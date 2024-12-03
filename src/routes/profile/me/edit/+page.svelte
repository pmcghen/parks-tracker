<script lang="ts">
  import { page } from "$app/stores";
  export let data;
  const { userData } = data;
</script>

<div class="container">
  <h1>Edit my profile</h1>
  <form method="POST">
    <div class="row">
      <div>
        <label for="firstName">First name:</label>
        <input
          type="text"
          name="firstName"
          id="firstName"
          value={userData.displayFirstName}
        />
      </div>
      <div>
        <label for="lastName">Last name:</label>
        <input
          type="text"
          name="lastName"
          id="lastName"
          value={userData.displayLastName}
        />
      </div>
    </div>
    <div>
      <label for="location">Location</label>
      <input
        type="text"
        name="location"
        id="location"
        value={userData.location}
      />
    </div>
    <div>
      <label for="bio">Bio</label>
      <textarea name="bio" id="bio" value={userData.bio}></textarea>
    </div>
    <div>
      <label>
        <input
          type="checkbox"
          id="private"
          name="private"
          checked={userData.private}
        />
        Make my profile private
      </label>
    </div>
    <div>
      <button type="reset">Reset</button>
      <button type="submit">Submit</button>
    </div>
    <input type="hidden" name="id" value={$page.data.session?.user?.id} />
  </form>
</div>

<style>
  .row {
    display: flex;
  }
</style>
