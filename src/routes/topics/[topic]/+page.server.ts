import { PARKS_API_KEY } from "$env/static/private";
import { error } from "@sveltejs/kit";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({ params }) => {
  const parksResponse = await fetch(
    `https:/developer.nps.gov/api/v1/topics/parks?id=${params.topic}&api_key=${PARKS_API_KEY}`
  );
  const parksData = await parksResponse.json();

  if (parksResponse.status === 200 && parksData.data.length) {
    return {
      topic: parksData.data[0].name,
      parks: parksData.data[0].parks,
    };
  }

  error(500, "error fetching data");
};
