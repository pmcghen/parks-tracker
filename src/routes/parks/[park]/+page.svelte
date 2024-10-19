<script lang="ts">
  export let data;

  const { park, weather } = data;

  const parkImage = park.images[0];
</script>

<svelte:head>
  <title>{park.fullName} | National Parks Tracker</title>
</svelte:head>
<main class="container">
  <h1>{park.fullName} (<a href={park.url} target="_blank">Website</a>)</h1>
  <p>{park.description}</p>
  <img class="img-responsive" src={parkImage.url} alt={parkImage.altText} />

  <ul>
    {#each park.activities as activity}
      <li>
        {activity.name}
      </li>
    {/each}
    {#each park.topics as topic}
      <li>
        {topic.name}
      </li>
    {/each}
  </ul>

  <h2>Know before you go!</h2>
  <div class="grid">
    <div>
      <h3>Hours</h3>
    </div>
    <div>
      <h3>Contact</h3>
    </div>
    <div>
      <h3>Fees</h3>
      {#if park.fees.length}
        Money
      {:else}
        No entrance fee
      {/if}
    </div>
    <div>
      <h3>Weather</h3>
      <p>{park.weatherInfo}</p>
      <p>
        <strong>Current Temperature</strong>
        {weather.temp_f}°F
      </p>
      <p>
        <strong>Feels Like</strong>
        {weather.feelslike_f}°F
      </p>
      <p>
        <strong>Wind</strong>
        {weather.wind_mph} from {weather.wind_dir}
      </p>

      <small>Last updated {new Date(weather.last_updated).toLocaleString()}</small>
    </div>
  </div>


  <h3>Directions</h3>
  <p>{park.directionsInfo}</p>
  <a href={park.directionsUrl} target="_blank">Website</a>
</main>

<style>
  h2,
  h3 {
    line-height: 1.75;
    border-bottom: solid 1px var(--link-color);
  }
</style>