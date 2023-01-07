<script lang="ts">
  export let serverId: number;
  export let name: string;
</script>

<div class="container">
  <div>{serverId}</div>
  <div>{name}</div>
</div>

<style>
  .container {
    display: grid;
    grid-template-columns: 30px auto;
    background: rgba(0, 0, 0, 0.85);
    border-radius: 5px;
    padding: 5px;
  }
</style>
