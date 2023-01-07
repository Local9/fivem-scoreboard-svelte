<script lang="ts">
  import { useNuiEvent } from "../utils/useNuiEvent";
  import Player from "../components/Player.svelte";
  import { scoreboard } from "../store/scoreboard.store";

  let sc: any;

  scoreboard.subscribe((data) => {
    sc = data;
  });

  useNuiEvent<any>("setScoreboard", (scoreboardData) => {
    scoreboard.set(scoreboardData);
  });
</script>

<div class="container">
  <div class="header">{sc.header}</div>
  <div class="players">
    {#each sc.players as player, i}
      <Player name={player.name} serverId={player.id} />
    {/each}
  </div>
</div>

<style>
  .container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 80vw;
    height: 80vh;
    user-select: none;
    background-color: rgba(0, 0, 0, 0.85);
    color: whitesmoke;
    border-radius: 10px;
    padding: 10px;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    flex-direction: column;
  }

  .header {
    font-size: 2rem;
    text-align: center;
    margin-bottom: 10px;
  }

  .players {
    display: grid;
    grid-template-columns: repeat(4, 2fr);
    column-gap: 5px;
    row-gap: 5px;
    overflow-y: auto;
  }
</style>
