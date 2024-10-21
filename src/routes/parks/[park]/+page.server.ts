import { PARKS_API_KEY, WEATHER_API_KEY } from "$env/static/private";
import { error } from "@sveltejs/kit";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({ params }) => {
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
    return { park: parksData.data[0], weather: weatherData.current };
  }

  error(500, "error fetching data");
};
