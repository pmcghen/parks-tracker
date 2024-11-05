import { PARKS_API_KEY, WEATHER_API_KEY } from "$env/static/private";
import { error } from "@sveltejs/kit";
import type { PageServerLoad } from "./$types";
import { prisma } from "../../../prisma";

export const load: PageServerLoad = async ({ params, parent }) => {
  const userId = (await parent()).session?.user?.id;
  let user;
  let isVisited = false;
  let park = await prisma.park.findFirst({
    where: {
      npsId: params.park,
    },
  });

  if (!park) {
    park = await prisma.park.create({
      data: {
        npsId: params.park,
      },
    });
  }

  if (userId) {
    user = await prisma.user.findUnique({
      where: {
        id: userId,
      },
      include: {
        Park_ParksVisited: true,
      },
    });

    isVisited = !!user?.Park_ParksVisited.includes(park);
  }

  const parksResponse = await fetch(
    `https://developer.nps.gov/api/v1/parks?parkCode=${params.park}&api_key=${PARKS_API_KEY}`
  );
  const parksData = await parksResponse.json();

  if (parksResponse.status === 200 && parksData.data.length) {
    const latLong = `${parksData.data[0].latitude},${parksData.data[0].longitude}`;
    const weatherResponse = await fetch(
      `https://api.weatherapi.com/v1/current.json?q=${latLong}&key=${WEATHER_API_KEY}`
    );

    const weatherData = await weatherResponse.json();

    return {
      park: parksData.data[0],
      weather: weatherData.current,
      user,
      isVisited,
    };
  }

  error(500, "error fetching data");
};
