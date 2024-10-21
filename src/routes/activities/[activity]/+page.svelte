<script lang="ts">
  import Card from "$lib/Card.svelte";

    export let data;
    const { activity, parks } = data;
</script>

<main class="container">
    <h1>{activity}</h1>
    {#if parks.length}
        <div class="grid">
            {#each parks as park}
                <Card
                    name={park.fullName}
                    location={park.states}
                    parkCode={park.parkCode} />
            {/each}
        </div>
    {/if}
</main>