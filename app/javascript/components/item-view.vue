<script setup lang="ts">
import { ref, computed } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import type { User } from '../api/users';
import type { Review } from '../api/reviews';
import purchasesApi from '../api/purchases';
import type { Item } from '../api/items';
import ItemViewReviewComment from './item-view-review-comment.vue';
import ItemViewReviewSummary from './item-view-review-summary.vue';
import ItemViewReviewForm from './item-view-review-form.vue';

type Props = {
  item: Item,
  user: User,
  reviews: Review[]
}

const props = defineProps<Props>();
const loading = ref(false);
const showForm = ref(false);

const { notify } = useNotification();
const listReviews = ref(props.reviews);

const userReviewExists = computed(() => listReviews.value.some(review => review.userId === props.user.id));

function onSubmitReview(review: Review) {
  listReviews.value.unshift(review);
}

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
    v-if="reviews.length > 0"
    class="space-y-6"
  >
    <div class="flex flex-col items-center justify-center gap-y-8 md:flex-row md:gap-16">
      <div>
        <h2 class="text-xl font-bold text-zinc-800">
          Opiniones del producto
        </h2>
        <item-view-review-summary
          :count="item.reviewsCount"
          :average="item.reviewsAverage"
        />
      </div>

      <div v-if="!showForm && !userReviewExists">
        <p>Cómo te fue con el producto?</p>
        <base-button
          variant="secondary"
          class="w-full rounded-full border-2 border-blue-800"
          @click="showForm = true"
        >
          Escribir mi opinión
        </base-button>
      </div>
    </div>

    <div>
      <p
        v-if="userReviewExists"
        class="text-3xl text-zinc-800"
      >
        Ya ingresaste un review 😢.
      </p>
      <div v-else>
        <item-view-review-form
          v-if="showForm"
          :item-id="item.id"
          @submit-review="onSubmitReview"
          @close-form="showForm = false"
        />
      </div>
    </div>
    <ul class="flex flex-col gap-y-6">
      <item-view-review-comment
        v-for="review in listReviews"
        :key="review.id"
        :user-id="review.userId"
        :user-email="review.user.email"
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
