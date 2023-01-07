<script lang="ts">
  import VisibilityProvider from "./providers/VisibilityProvider.svelte";
  import { debugData } from "./utils/debugData";
  import Scoreboard from "./providers/ScoreboardProvider.svelte";

  function generatePlayers(numberOfPlayers: number = 512) {
    const players = [];
    for (let i = 0; i < numberOfPlayers; i++) {
      players.push({ id: i, name: `Player Name Example` });
    }
    return players;
  }

  debugData([
    {
      action: "setVisible",
      data: true,
    },
  ]);
  debugData([
    {
      action: "setScoreboard",
      data: {
        header: "Scoreboard Header",
        players: generatePlayers(),
      },
    },
  ]);
</script>

<main>
  <VisibilityProvider>
    <Scoreboard />
  </VisibilityProvider>
</main>
