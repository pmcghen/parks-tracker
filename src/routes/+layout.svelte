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
  <nav>
    <a href="/">Home</a>
    <a href="/parks">All parks</a>
  </nav>
  <div>
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
  </div>
</header>

<slot />

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

    & button {
      margin-inline-start: 1rem;
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
  }
</style>
