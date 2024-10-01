<script lang="ts">
  export let data;

  const { park, weather } = data;

  const parkImage = park.images[0];
</script>

<svelte:head>
  <title>{park.fullName} | National Parks Tracker</title>
</svelte:head>

<h2>{park.fullName} (<a href={park.url} target="_blank">Website</a>)</h2>
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
<h3>Hours</h3>

<h3>Contact</h3>

<h3>Directions</h3>
<p>{park.directionsInfo}</p>
<a href={park.directionsUrl} target="_blank">Website</a>

<h3>Fees</h3>
{#if park.fees.length}
  Money
{:else}
  No entrance fee
{/if}

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
