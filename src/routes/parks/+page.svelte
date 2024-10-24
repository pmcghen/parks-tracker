<script lang="ts">
  import { browser } from "$app/environment";
  import Card from "$lib/Card.svelte";
  let { data } = $props();

  interface PageLink {
    url: string;
    number: Number;
  }

  const { parks, pages } = data;
  const pageLinks: PageLink[] = [];

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
    {#each pageLinks as link}
      <a data-sveltekit-reload href={link.url}>{link.number}</a>
    {/each}
  {/if}
</div>
