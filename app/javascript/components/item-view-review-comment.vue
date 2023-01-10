<script setup lang="ts">
import formatDate from '../utils/format-date';
import StarRating from './star-rating.vue';

type Props = {
  userEmail: string,
  body: string,
  rating: number,
  createdAt: string,
}

defineProps<Props>();

</script>

<template>
  <li>
    <figure class="space-y-4">
      <div class="flex items-center justify-between">
        <star-rating :rating="rating" />

        <time
          :datetime="createdAt"
          class="text-sm  text-zinc-500"
        > {{ formatDate(createdAt) }} </time>
      </div>

      <blockquote>
        <p> {{ body }}</p>
      </blockquote>
      <figcaption>
        <p>{{ userEmail }}</p>
      </figcaption>
    </figure>
  </li>
</template>

