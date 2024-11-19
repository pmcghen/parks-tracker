<script lang="ts">
  import { page } from "$app/stores";
  import { enhance } from "$app/forms";

  export let isVisited: boolean;
  const user = $page.data.session?.user?.id || "";

  async function toggleVisited() {
    isVisited = !isVisited;
  }
</script>

<div>
  <form method="POST" action="?/updateVisitStatus" use:enhance>
    <input type="hidden" value={user} />
    <button onclick={toggleVisited} value={String(!isVisited)}>
      {#if isVisited}
        I haven't visited this park
      {:else}
        I've visited this park!
      {/if}
    </button>
  </form>
</div>
