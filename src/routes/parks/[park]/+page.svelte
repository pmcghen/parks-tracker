<script lang="ts">
  import Tag from "$lib/Tag.svelte";

  let { data } = $props();

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

  <h2>Activities</h2>
  <ul class="tag-list">
    {#each park.activities as activity}
      <li>
        <Tag type="activity" link="/activities/{activity.id}">
          {activity.name}
        </Tag>
      </li>
    {/each}
  </ul>

  <h2>Topics</h2>
  <ul class="tag-list">
    {#each park.topics as topic}
      <li>
        <Tag type="topic" link="/topics/{topic.id}">{topic.name}</Tag>
      </li>
    {/each}
  </ul>

  <h2>Know before you go!</h2>
  <div class="grid">
    <div>
      <h3><i class="bx bx-time"></i> Hours</h3>
      {#if park.operatingHours.length}
        {#each park.operatingHours as hoursDetail}
          <p>{hoursDetail.description}</p>
          <ul>
            <li>
              <strong>Sunday</strong>: {hoursDetail.standardHours.sunday}
            </li>
            <li>
              <strong>Monday</strong>: {hoursDetail.standardHours.monday}
            </li>
            <li>
              <strong>Tuesday</strong>: {hoursDetail.standardHours.tuesday}
            </li>
            <li>
              <strong>Wednesday</strong>: {hoursDetail.standardHours.wednesday}
            </li>
            <li>
              <strong>Thursday</strong>: {hoursDetail.standardHours.thursday}
            </li>
            <li>
              <strong>Friday</strong>: {hoursDetail.standardHours.friday}
            </li>
            <li>
              <strong>Saturday</strong>: {hoursDetail.standardHours.saturday}
            </li>
          </ul>

          {#if hoursDetail.exceptions.length}
            <h4>Exceptions</h4>
            <ul>
              {#each hoursDetail.exceptions as exception}
                {#if exception.name.includes("Closed")}
                  <li>
                    {exception.name}
                  </li>
                {/if}
              {/each}
            </ul>
          {/if}
        {/each}
      {/if}
    </div>
    <div>
      <h3><i class="bx bx-phone"></i> Contact</h3>
      {#if park.contacts.phoneNumbers.length}
        <h4>Phone Numbers</h4>
        <ul>
          {#each park.contacts.phoneNumbers as phoneNumber}
            <li>{phoneNumber.phoneNumber}</li>
          {/each}
        </ul>
      {/if}
      {#if park.contacts.emailAddresses.length}
        <h4>Email</h4>
        <ul>
          {#each park.contacts.emailAddresses as emailAddress}
            <li>{emailAddress.emailAddress}</li>
          {/each}
        </ul>
      {/if}
    </div>
    <div>
      <h3><i class="bx bx-money-withdraw"></i> Fees</h3>
      {#if park.entranceFees.length}
        {#each park.entranceFees as fee}
          <div>
            <h4>{fee.title} (${fee.cost})</h4>
            <p>{fee.description}</p>
          </div>
        {/each}
        {#if park.entrancePasses.length}
          {#each park.entrancePasses as pass}
            <div>
              <h4>{pass.title} (${pass.cost})</h4>
              <p>{pass.description}</p>
            </div>
          {/each}
        {/if}
      {:else}
        No entrance fee
      {/if}
    </div>
    <div>
      <h3><i class="bx bx-leaf"></i> Weather</h3>
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

      <small>
        Last updated {new Date(weather.last_updated).toLocaleString()}
      </small>
    </div>
  </div>

  <h3><i class="bx bx-directions"></i> Directions</h3>
  <p>{park.directionsInfo}</p>
  <a href={park.directionsUrl} target="_blank">Website</a>
</main>

<style>
  h2,
  h3 {
    line-height: 1.75;
    border-bottom: solid 1px var(--link-color);
  }

  h4 {
    margin-bottom: 0;
  }

  ul {
    margin-top: 0;
    padding: 0;
    list-style: none;
  }

  .tag-list li {
    display: inline-block;
    margin-inline-end: 0.5rem;
    margin-block-end: 0.75rem;
  }
</style>
