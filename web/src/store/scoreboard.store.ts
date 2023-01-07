import { writable } from "svelte/store";

export const scoreboard = writable({header: "Scoreboard", players: [{id: 0, name: "Player 1"}]});