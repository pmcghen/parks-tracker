import { SvelteKitAuth } from "@auth/sveltekit";
import GitHub from "@auth/sveltekit/providers/github";
import { PrismaAdapter } from "@auth/prisma-adapter";
import { prisma } from "./prisma";
import Google from "@auth/sveltekit/providers/google";

export const { handle, signIn } = SvelteKitAuth({
  adapter: PrismaAdapter(prisma),
  providers: [GitHub, Google],
  trustHost: true,
});
