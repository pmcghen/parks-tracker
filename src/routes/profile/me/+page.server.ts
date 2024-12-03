import { prisma } from "../../../prisma";
import type { PageServerLoad } from "./$types";

interface User {
  id: string | null;
  name: string | null;
  displayFirstName: string | null;
  displayLastName: string | null;
  bio: string | null;
  location: string | null;
  private: boolean;
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
