<script lang="ts">
  import { SignIn } from "@auth/sveltekit/components";
  import { signOut } from "@auth/sveltekit/client";

  import { page } from "$app/stores";

  $: hasSession = $page.data.session;
</script>

<svelte:head>
  <title>National Parks Tracker</title>
</svelte:head>

<header>
  <h1>Let's go to the park!</h1>
  <nav>
    <a href="/">Home</a>
    <a href="/parks">All parks</a>
    {#if hasSession}
      <img
        class="avatar"
        src={$page.data.session?.user?.image}
        alt={$page.data.session?.user?.name}
      />
      <button on:click={signOut}>Sign Out</button>
    {:else}
      <SignIn provider="github" signInPage="log-in">
        <svelte:fragment slot="submitButton">
          Sign In with GitHub
        </svelte:fragment>
      </SignIn>
    {/if}
  </nav>
</header>

<main class="container">
  <slot />
</main>

<footer>
  © {new Date().getFullYear()}
</footer>

<style>
  header {
    display: flex;
    align-items: center;
    justify-content: space-between;
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
  }
</style>
