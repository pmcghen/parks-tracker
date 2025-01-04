<script lang="ts">
  import { enhance } from "$app/forms";

  export let isVisited: boolean;

  async function toggleVisited() {
    isVisited = !isVisited;
  }
</script>

<div>
  <form method="POST" action="?/updateVisitStatus" use:enhance>
    <button onclick={toggleVisited}>
      {#if isVisited}
        I haven't visited this park
      {:else}
        I've visited this park!
      {/if}
    </button>
  </form>
</div>

<style>
  button {
    padding: 0.5rem;
    margin-block-end: 1rem;
  }
</style>
