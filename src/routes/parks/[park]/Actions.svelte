<script lang="ts">
  import { enhance } from "$app/forms";

  export let isVisited: boolean;
  export let isOnWishlist: boolean;

  function toggleVisited() {
    isVisited = !isVisited;
  }

  function toggleWishlist() {
    isOnWishlist = !isOnWishlist;
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
  <form method="POST" action="?/updateWishlistStatus" use:enhance>
    <button onclick={toggleWishlist}>
      {#if isOnWishlist}
        Remove from wishlist
      {:else}
        Add to wishlist
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
