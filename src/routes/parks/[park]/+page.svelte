<script lang="ts">
  import { page } from "$app/stores";
  import Tag from "$lib/Tag.svelte";
  import Actions from "./Actions.svelte";

  let { data } = $props();

  const { park, weather, images } = data;

  const swapImage = (e: MouseEvent) => {
    const mainImage = document.querySelector("#main-image") as HTMLImageElement;
    const newImage = e.target as HTMLImageElement;

    if (mainImage) {
      mainImage.src = newImage.src;
      mainImage.alt = newImage.alt;
    }
  };

  let isVisited = park.User_ParksVisited.find(
    (user) => user.id === $page.data.session?.user?.id,
  )
    ? true
    : false;
</script>

<svelte:head>
  <title>{park.fullName} | National Parks Tracker</title>
</svelte:head>

<div class="container">
  <h1>{park.fullName} (<a href={park.url} target="_blank">Website</a>)</h1>

  {#if images.length}
    <img
      src={images[0].url}
      alt={images[0].altText}
      id="main-image"
      class="img-responsive"
    />
    <div class="thumbnails">
      {#each images as image}
        <button onclick={swapImage}>
          <img class="thumbnail" src={image.url} alt={image.altText} />
        </button>
      {/each}
    </div>
  {/if}

  {#if $page.data.session}
    <Actions {isVisited} />
  {/if}

  <p>{park.description}</p>

  <h2>Activities</h2>
  <ul class="tag-list">
    {#each park.Activity_ParksWithActivity as activity}
      <li>
        <Tag type="activity" link="/activities/{activity.id}">
          {activity.name}
        </Tag>
      </li>
    {/each}
  </ul>

  <h2>Topics</h2>
  <ul class="tag-list">
    {#each park.Topic_ParksWithTopic as topic}
      <li>
        <Tag type="topic" link="/topics/{topic.id}">{topic.name}</Tag>
      </li>
    {/each}
  </ul>

  <h2>Know before you go!</h2>
  <div class="grid">
    <div>
      <h3><i class="bx bx-time"></i> Hours</h3>
      <!-- {#if park.operatingHours.length}
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
      {/if} -->
    </div>
    <div>
      <h3><i class="bx bx-phone"></i> Contact</h3>
      <!-- {#if park.contacts.phoneNumbers.length}
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
      {/if} -->
    </div>
    <div>
      <h3><i class="bx bx-money-withdraw"></i> Fees</h3>
      <!-- {#if park.entranceFees.length}
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
      {/if} -->
    </div>
    <div>
      <h3><i class="bx bx-leaf"></i> Weather</h3>
      <p>{park.weatherInfo}</p>
      <p>
        <strong>Current temperature</strong>
        {weather.temp_f}°F
      </p>
      <p>
        <strong>Feels like</strong>
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
</div>

<style>
  h2,
  h3 {
    line-height: 1.75;
    border-bottom: solid 1px var(--link-color);
  }

  ul {
    margin-top: 0;
    padding: 0;
    list-style: none;
  }

  .thumbnails {
    display: flex;
    justify-content: space-around;
    margin-top: 1rem;
    margin-bottom: 1rem;
  }

  .thumbnail {
    clip-path: fill-box;
    border-radius: 0.66rem;
    height: 160px;
    width: auto;
  }

  .tag-list li {
    display: inline-block;
    margin-inline-end: 0.5rem;
    margin-block-end: 0.75rem;
  }
</style>
