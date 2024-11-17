<script lang="ts">
  import { SignIn, SignOut } from "@auth/sveltekit/components";
  import { page } from "$app/stores";

  interface Props {
    children?: import("svelte").Snippet;
  }

  let { children }: Props = $props();

  let hasSession = $derived($page.data.session);
</script>

<svelte:head>
  <title>National Parks Tracker</title>
</svelte:head>

<header>
  <nav>
    <a href="/">Home</a>
    <a data-sveltekit-reload href="/parks">All parks</a>
  </nav>
  <div>
    {#if hasSession}
      <img
        class="avatar"
        src={$page.data.session?.user?.image}
        alt={$page.data.session?.user?.name}
      />
      <SignOut>
        {#snippet submitButton()}
          Sign Out
        {/snippet}
      </SignOut>
    {:else}
      <SignIn provider="github" signInPage="log-in">
        {#snippet submitButton()}
          Sign In with GitHub
        {/snippet}
      </SignIn>
      <SignIn provider="google" signInPage="log-in">
        {#snippet submitButton()}
          Sign In with Google
        {/snippet}
      </SignIn>
    {/if}
  </div>
</header>

{@render children?.()}

<footer>
  © {new Date().getFullYear()}
</footer>

<style>
  header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0.75rem;

    & div {
      display: flex;
      align-items: center;
    }
  }

  nav {
    display: flex;
    gap: 1rem;
    align-items: center;
  }

  .avatar {
    border-radius: 100%;
    height: 48px;
    width: 48px;
    margin-inline-end: 1rem;
  }
</style>
