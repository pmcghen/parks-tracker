<svelte:head>
  <title>Home | National Parks Tracker</title>
</svelte:head>

<div class="hero">
  <div class="content">
    <h1>National Parks Tracker</h1>
    <p class="hero--details">Explore U.S. National Parks</p>
  </div>
</div>
<div class="container">
  <p>
    Whether you're taking the family out for a leisurely afternoon stroll or
    gearing up for a weeklong adventure our national parks have a lot to offer.
    You can use the National Parks Tracker to search for your new favorite spot,
    show off which parks you've visited, or save your favorites to add to your
    bucket list!
  </p>
</div>

<style>
  .hero {
    background-color: rgba(26, 43, 33, 0.8);
    background-size: cover;
    background-position: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    aspect-ratio: 3/1;
  }

  h1 {
    font-size: 3rem;
    line-height: 1.125;
    margin: 0;
  }

  .content {
    background-color: rgba(228, 235, 231, 0.5);
    backdrop-filter: blur(0.25rem);
    padding: 3rem;
    text-align: center;
    border-radius: 0.5rem;

    & p {
      font-size: 1.5rem;
    }
  }
</style>
