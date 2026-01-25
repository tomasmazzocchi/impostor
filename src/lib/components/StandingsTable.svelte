<script lang="ts">
  import type { GameState } from "$lib/game/types";
  import { getPlayersByScore } from "$lib/game/local-mode";

  export let gameState: GameState;
  export let compact: boolean = false;

  const rankedPlayers = getPlayersByScore(gameState);
  const highestScore = rankedPlayers.length > 0 ? rankedPlayers[0].score : 0;
</script>

<div class="flex flex-col gap-{compact ? '3' : '4'}">
  {#each rankedPlayers as player, index}
    <div class="flex items-center gap-{compact ? '4' : '6'} bg-{compact ? 'gray-50' : 'white'} p-{compact ? '4' : '6'} rounded-xl border-2 shadow {player.score === highestScore && highestScore > 0 ? 'border-yellow-300 bg-gradient-to-br from-yellow-50 to-yellow-100 shadow-lg' : compact ? 'border-gray-200' : 'border-gray-border'}">
      <div class="text-{compact ? '2xl' : '3xl'} font-bold min-w-[{compact ? '50' : '60'}px] text-center">
        {#if player.score === highestScore}
          🥇
        {:else if index === 1 && rankedPlayers[1].score !== highestScore}
          🥈
        {:else if index === 2 && rankedPlayers[2]?.score !== highestScore && rankedPlayers[1].score !== highestScore}
          🥉
        {:else}
          #{index + 1}
        {/if}
      </div>
      <div class="flex-1">
        <h3 class="text-{compact ? 'xl' : '2xl'} text-gray-800 {compact ? 'font-bold' : ''}">
          {player.name}
        </h3>
      </div>
      <div class="text-{compact ? 'lg' : 'xl'} text-gray-800 font-bold">
        Pts: {player.score}
      </div>
    </div>
  {/each}
</div>
