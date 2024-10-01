<svelte:head>
  <title>National Parks Tracker</title>
</svelte:head>

<header>
  <h1>Let's go to the park!</h1>
  <nav>
    <a href="/">Home</a>
    <a href="/parks">All parks</a>
  </nav>
</header>

<main class="container">
  <slot />
</main>

<footer>
  © {new Date().getFullYear()}
</footer>
