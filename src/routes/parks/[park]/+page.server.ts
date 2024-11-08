import { PARKS_API_KEY, WEATHER_API_KEY } from "$env/static/private";
import { error } from "@sveltejs/kit";
import type { PageServerLoad } from "./$types";
import { prisma } from "../../../prisma";

interface Park {
  parkCode: string;
  description: string;
  designation: string;
  directionsInfo: string;
  directionsUrl: string;
  fullName: string;
  latitude: string;
  longitude: string;
  states: string;
  url: string;
  weatherInfo: string;
  topics: { id: string; name: string }[];
  activities: { id: string; name: string }[];
}

const getWeather = async (lat = "0", long = "0") => {
  console.log(lat, long);
  const weatherResponse = await fetch(
    `https://api.weatherapi.com/v1/current.json?q=${lat},${long}&key=${WEATHER_API_KEY}`
  );

  const weatherData = await weatherResponse.json();

  return weatherData;
};

const getParkFromNPS = async (park: string) => {
  const parksResponse = await fetch(
    `https://developer.nps.gov/api/v1/parks?parkCode=${park}&api_key=${PARKS_API_KEY}`
  );

  if (!parksResponse.ok) {
    error(500, "error fetching data");
  }

  const parksData = await parksResponse.json();

  if (parksData.data.length) {
    return parksData.data[0] as Park;
  }
};

export const load: PageServerLoad = async ({ params }) => {
  let park = await prisma.park.findFirst({
    where: {
      npsId: params.park,
    },
    include: {
      Activity_ParksWithActivity: true,
      Topic_ParksWithTopic: true,
    },
  });

  if (!park) {
    const npsPark = await getParkFromNPS(params.park);
    const parkTopics = [];
    const parkActivities = [];

    if (npsPark?.topics) {
      for (const topic of npsPark.topics) {
        const topicObj = {
          npsId: topic.id,
          name: topic.name,
        };

        parkTopics.push(topicObj);
      }
    }

    if (npsPark?.activities) {
      for (const activity of npsPark.activities) {
        const activityObj = {
          npsId: activity.id,
          name: activity.name,
        };

        parkActivities.push(activityObj);
      }
    }

    const topics = await prisma.topic.createManyAndReturn({
      data: parkTopics,
      skipDuplicates: true,
    });

    const activities = await prisma.activity.createManyAndReturn({
      data: parkActivities,
      skipDuplicates: true,
    });

    park = await prisma.park.create({
      data: {
        npsId: params.park,
        description: npsPark?.description || "",
        designation: npsPark?.designation || "",
        directionsInfo: npsPark?.directionsInfo || "",
        directionsUrl: npsPark?.directionsUrl || "",
        fullName: npsPark?.fullName || "",
        latitude: npsPark?.latitude || "",
        longitude: npsPark?.longitude || "",
        states: npsPark?.states || "",
        url: npsPark?.url || "",
        weatherInfo: npsPark?.weatherInfo || "",
        Topic_ParksWithTopic: {
          connect: topics,
        },
        Activity_ParksWithActivity: {
          connect: activities,
        },
      },
      include: {
        Topic_ParksWithTopic: true,
        Activity_ParksWithActivity: true,
      },
    });
  }

  console.log(park);

  const weather = await getWeather(park.latitude, park.longitude);

  return {
    park,
    weather: weather.current,
  };
};
