<script lang="ts">
  export let data;
  const { userData } = data;
  let name = userData.name;

  if (userData.displayFirstName || userData.displayLastName) {
    name = `${userData.displayFirstName} ${userData.displayLastName}`;
  }
</script>

<div class="container">
  <h1>
    {name}'s profile

    <a href="/profile/me/edit">
      <i class="bx bx-edit-alt"></i><span class="sr-only">Edit</span>
    </a>
  </h1>
  <p>Location: {userData?.location}</p>
  <p>Bio: {userData?.bio}</p>
  {#if !userData.private}
    <h2>Favorite parks</h2>
    <h2>My wishlist</h2>
  {/if}
</div>

<style>
  h1 i {
    font-weight: 400;
    font-size: 80%;
  }
</style>
