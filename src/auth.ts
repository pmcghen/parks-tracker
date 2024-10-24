import { SvelteKitAuth } from "@auth/sveltekit";
import GitHub from "@auth/sveltekit/providers/github";
import { PrismaAdapter } from "@auth/prisma-adapter";
import { prisma } from "./prisma";

export const { handle, signIn } = SvelteKitAuth({
  adapter: PrismaAdapter(prisma),
  providers: [GitHub],
  trustHost: true,
});
