<script lang="ts">
  import { browser } from "$app/environment";
  import Card from "$lib/Card.svelte";
  let { data } = $props();

  interface PageLink {
    url: string;
    number: number;
  }

  const { parks, pages } = data;
  const pageLinks: PageLink[] = [];
  let params: URLSearchParams | undefined;
  let currentPage = $state("1");

  if (browser) {
    params = new URLSearchParams(document.location.search);
    currentPage = params.get("p") ?? "1";
  }

  if (browser) {
    const pageUrl = new URL(window.location.href);
    const path = pageUrl.pathname;

    for (let i = 1; i <= pages; i++) {
      pageLinks.push({ url: `${path}?p=${i}`, number: i });
    }
  }
</script>

<svelte:head>
  <title>All Parks | National Parks Tracker</title>
</svelte:head>

<div class="container">
  {#if parks.length}
    <h1>National Parks</h1>
    <div class="grid">
      {#each parks as park}
        <Card
          name={park.fullName}
          location={park.states}
          isFree={!park.entranceFees.length}
          parkCode={park.parkCode}
        />
      {/each}
    </div>
  {/if}

  {#if pageLinks.length}
    <nav aria-label="Parks pagination">
      {#each pageLinks as link}
        <a
          data-sveltekit-reload
          href={link.url}
          class={link.number === parseInt(currentPage) ? "active" : ""}
          >{link.number}</a
        >
      {/each}
    </nav>
  {/if}
</div>

<style>
  a {
    border: solid 1px #999;
    border-radius: 0.5rem;
    display: inline-block;
    padding: 0.5rem 1rem;
  }

  nav {
    text-align: center;

    & a:not(:first-child) {
      margin-left: 1rem;
    }
  }

  .active {
    background: var(--font-color);
    color: var(--background-color);
    border: none;
    text-decoration: none;
  }
</style>
