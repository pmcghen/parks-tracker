import type { Actions, PageServerLoad } from "../$types";
import { redirect } from "@sveltejs/kit";
import { prisma } from "../../../../prisma";

interface User {
  id: string | null;
  name: string | null;
  displayFirstName: string | null;
  displayLastName: string | null;
  bio: string | null;
  location: string | null;
}

export const load: PageServerLoad = async (event) => {
  const session = await event.locals.auth();
  const userData = (await prisma.user.findFirst({
    where: {
      id: session?.user?.id,
    },
  })) as User;

  return {
    userData,
  };
};

export const actions: Actions = {
  default: async ({ request }) => {
    const formData = await request.formData();
    const id = formData.get("id") as string;
    const firstName = formData.get("firstName") as string;
    const lastName = formData.get("lastName") as string;
    const bio = formData.get("bio") as string;
    const location = formData.get("location") as string;

    await prisma.user.update({
      where: {
        id: id,
      },
      data: {
        displayFirstName: firstName,
        displayLastName: lastName,
        bio: bio,
        location: location,
      },
    });

    redirect(303, "/profile/me");
  },
};
