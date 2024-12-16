<script lang="ts">
  interface Props {
    name: string;
    location: string;
    isFree?: boolean;
    parkCode: string;
    posterImage: string;
  }

  let {
    name,
    location,
    isFree = false,
    parkCode,
    posterImage,
  }: Props = $props();
</script>

<div class="card">
  <img src={posterImage} alt="" class="img-responsive" />
  <div class="content">
    <a href="/parks/{parkCode}" class="title">{name} ({location})</a>
    {#if !isFree}
      <i class="bx bx-dollar-circle" role="presentation"></i>
    {/if}
  </div>
</div>

<style>
  .card {
    position: relative;
    border: solid 1px #999;
    border-radius: 0.5rem;
    margin-bottom: 1.25rem;
    box-shadow: var(--box-shadow);
  }

  .content {
    padding: 1rem;
  }

  .title {
    font-size: 1.25rem;
    font-weight: 700;
  }

  img {
    aspect-ratio: 4/3;
    border-top-left-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
  }
</style>
