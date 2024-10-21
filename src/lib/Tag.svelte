<script lang="ts">
  export let type: "topic" | "activity";
  export let link: string;
</script>

<a href={link} class={type}><slot /></a>

<style>
  a {
    line-height: 2;
    padding: 0.5rem 1rem;
    border-radius: 2rem;
    border: 1px solid;
    background-color: hsla(185, 17%, 61%, 0.25);
    border-color: hsl(185, 17%, 61%);
  }
</style>