<script lang="ts">
  import { page } from "$app/stores";
</script>

<svelte:head>
  <title>Error 😬 | National Parks Tracker</title>
</svelte:head>

<h1>{$page.status}: {$page.error?.message}</h1>

<img class="img-responsive" src="/img/empty.jpg" alt="" />
<br />
<a
  href="https://www.pexels.com/photo/grayscale-photo-of-an-abandoned-wooden-house-5924031/"
  target="_blank"
>
  Photo by JOHN CALLERY
</a>
