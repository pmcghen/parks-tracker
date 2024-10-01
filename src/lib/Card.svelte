<script lang="ts">
  export let name: string;
  export let location: string;
  export let isFree: boolean;
  export let parkCode: string;
</script>

<div class="card">
  <a href="/parks/{parkCode}" class="title">{name} ({location})</a>
  {#if isFree}
    <span class="banner banner--free">Free! 💸</span>
  {/if}
</div>

<style>
  .card {
    position: relative;
    border: solid 1px #999;
    border-radius: 0.5rem;
    padding: 1rem;
    margin-bottom: 1.25rem;
  }

  .banner {
    position: absolute;
    top: -0.66rem;
    right: -0.5rem;
    transform: rotate(10deg);
  }

  .banner--free {
    background-color: green;
    color: #fff;
    padding: 0.25rem;
  }

  .title {
    font-size: 1.5rem;
    font-weight: 700;
  }
</style>
