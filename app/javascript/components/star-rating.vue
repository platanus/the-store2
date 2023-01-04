
<script setup lang="ts">
import { computed } from 'vue';

type Props = {
  rating: number
}

const MAX_STARS = 5;

const props = defineProps<Props>();

const hasHalfStars = computed(() => props.rating % 1 !== 0);
const fullStars = computed(() => (Math.floor(props.rating)));
const emptyStars = computed(() => (hasHalfStars.value ? MAX_STARS - fullStars.value - 1 : MAX_STARS - fullStars.value),
);
</script>

<template>
  <div class="flex justify-center gap-x-6">
    <inline-svg
      v-for="i in fullStars"
      :key="`fill-${i}`"
      class="h-6 w-6"
      :src="require('images/icon/star-fill.svg') "
    />
    <inline-svg
      v-if="hasHalfStars"
      class="h-6 w-6"
      :src="require('images/icon/star-half-fill.svg') "
    />
    <inline-svg
      v-for="i in emptyStars"
      :key="`empty-${i}`"
      class="h-6 w-6"
      :src="require('images/icon/star-empty.svg') "
    />
  </div>
</template>
