<script lang="ts">
  interface Props {
    type: "topic" | "activity";
    link: string;
    children?: import('svelte').Snippet;
  }

  let { type, link, children }: Props = $props();
</script>

<a href={link} class={type}>{@render children?.()}</a>

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