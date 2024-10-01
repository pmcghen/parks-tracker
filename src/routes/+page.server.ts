import { PARKS_API_KEY } from "$env/static/private"
import { error } from "@sveltejs/kit";

export async function load() {
    interface ParkImage {
        url: string;
        altText: string;
    }

    interface Park {
        fullName: string;
        images: ParkImage[];
    }

    const activities = ['biking', 'camping', 'climbing', 'hiking'];
    const activity = activities[Math.floor(Math.random() * activities.length)];

    const parksResponse = await fetch(`https://developer.nps.gov/api/v1/parks?q=${activity}&api_key=${PARKS_API_KEY}`);
    const parksData = await parksResponse.json();

    const randomPark: Park = parksData.data[Math.floor(Math.random() * parksData.data.length)];
    const randomParkImgIndex = Math.floor(Math.random() * randomPark.images.length);
    const randomParkImage: ParkImage = randomPark.images[randomParkImgIndex];

    if (parksResponse) {
        return {
            randomPark: randomPark,
            randomParkImage: randomParkImage,
            activity: activity
        };
    }

    error(500, 'Error fetching data');
}
