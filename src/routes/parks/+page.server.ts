import { PARKS_API_KEY } from "$env/static/private";
import { error } from "@sveltejs/kit";

export async function load() {
  const parksResponse = await fetch(
    `https://developer.nps.gov/api/v1/parks?api_key=${PARKS_API_KEY}`
  );
  const parksData = await parksResponse.json();

  if (parksResponse.status === 200) {
    return { parks: parksData.data };
  }

  error(500, "error fetching data");
}
