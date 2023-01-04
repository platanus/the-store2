<script setup lang="ts">
import { ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import purchasesApi from '../api/purchases';
import type { Item } from '../api/items';
import ItemViewReviewComment from './item-view-review-comment.vue';
import ItemViewReviewSummary from './item-view-review-summary.vue';

type Props = {
  item: Item,
}

const props = defineProps<Props>();
const loading = ref(false);
const { notify } = useNotification();

async function buy() {
  loading.value = true;
  try {
    await purchasesApi.create(props.item.id);
    notify({ text: 'Genial, recibimos tu orden! Te contactaremos para coordinar', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}

</script>

<template>
  <div>
    <a
      class="inline-flex items-center gap-2 rounded-full bg-zinc-100 px-3 py-2 text-sm"
      href="/"
    >
      <inline-svg
        class="h-4 w-4 fill-white"
        :src="require('images/icon/back-arrow.svg')"
      />
      Volver
    </a>
    <div class="mt-12 md:flex md:gap-4">
      <div>
        <img :src="item.image.sm.url">
      </div>
      <div>
        <h1 class="text-lg font-bold text-zinc-800">
          {{ item.name }}
        </h1>
        <p class="text-3xl text-zinc-800">
          {{ item.price }}
        </p>

        <div class="md:mt-4">
          <p class="text-base">
            {{ item.description }}
          </p>
          <base-button
            class="mt-4 w-full rounded-full"
            :disabled="loading"
            @click="buy"
          >
            Comprar
          </base-button>
        </div>
      </div>
    </div>
  </div>
  <div
    v-if="item.reviews.length > 0"
    class="space-y-6"
  >
    <div>
      <h2 class="text-xl font-bold text-zinc-800">
        Opiniones del producto
      </h2>
      <item-view-review-summary
        :count="item.reviewsCount"
        :average="item.reviewsAverage"
      />
    </div>
    <ul class="flex flex-col gap-y-6">
      <item-view-review-comment
        v-for="review in item.reviews"
        :key="review.id"
        :user-id="review.userId"
        :item-id="review.itemId"
        :body="review.body"
        :rating="review.rating"
        :created-at="review.createdAt"
        :updated-at="review.updatedAt"
        class="border-b border-zinc-800"
      />
    </ul>
  </div>
</template>
