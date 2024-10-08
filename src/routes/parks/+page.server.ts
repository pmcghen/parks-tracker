import { PARKS_API_KEY } from "$env/static/private";
import { error } from "@sveltejs/kit";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async ({ url }) => {
  const parksPerPage = 50;
  let pageNumber: string;
  let parksResponse: Response;
  const baseUrl = `https://developer.nps.gov/api/v1/parks?api_key=${PARKS_API_KEY}`;

  if (url.searchParams.size && url.searchParams.get("p")) {
    pageNumber = url.searchParams.get("p") ?? "1";
    parksResponse = await fetch(
      `${baseUrl}&start=${parksPerPage * (parseInt(pageNumber) - 1) + 1}`
    );
  } else {
    parksResponse = await fetch(baseUrl);
  }

  const parksData = await parksResponse.json();

  const totalParks = parksData.total;

  let pages = 0;

  if (totalParks > parksPerPage) {
    pages = Math.ceil(totalParks / parksPerPage);
  }

  console.log(pages);

  if (parksResponse.status === 200) {
    return {
      pages,
      parks: parksData.data,
    };
  }

  error(500, "error fetching data");
};
