<script lang="ts">
  import VisibilityProvider from "./providers/VisibilityProvider.svelte";
  import { debugData } from "./utils/debugData";
  import Scoreboard from "./providers/ScoreboardProvider.svelte";
  import { generatePlayers } from "./utils/testData";

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
