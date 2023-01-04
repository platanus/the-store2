<script setup lang="ts">

import StarRating from './star-rating.vue';

type Props = {
  count: number,
  average: number
}

defineProps<Props>();

</script>

<template>
  <div class="flex items-center justify-start gap-4">
    <div>
      <p class="text-6xl text-zinc-800">
        {{ average.toFixed(1) }}
      </p>
    </div>
    <div class="flex flex-col">
      <div class="flex gap-3">
        <star-rating :rating="average" />
      </div>
      <p class="text-sm text-zinc-500">
        {{ count }} calificaciones
      </p>
    </div>
  </div>
</template>

