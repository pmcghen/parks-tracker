<script lang="ts">
  import Card from "$lib/Card.svelte";
  export let data;

  const { parks } = data;
</script>

<svelte:head>
  <title>All Parks | National Parks Tracker</title>
</svelte:head>

<div class="container">
  {#if parks.length}
    <h2>National Parks</h2>
    {#each parks as park}
      <Card
        name={park.fullName}
        location={park.states}
        isFree={!park.entranceFees.length}
        parkCode={park.parkCode}
      />
    {/each}
  {/if}
</div>
