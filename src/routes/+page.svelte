<script lang="ts">
  export let data;

  const { randomPark, randomParkImage, activity } = data;
</script>

<svelte:head>
  <title>Home | National Parks Tracker</title>
</svelte:head>

<div class="container">
  <img
    class="img-responsive"
    src={randomParkImage.url}
    alt={randomParkImage.altText}
  />
  <p>Why not go {activity} at {randomPark.fullName}?</p>
  <a href="/parks">More parks!</a>
</div>
