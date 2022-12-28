<script setup lang="ts">
import { ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import purchasesApi from '../api/purchases';

import type { Item } from '../api/items';

type Props = {
  item: Item
}

defineProps<Props>();

</script>

<template>
  <div>
    <a
      class="inline-flex items-center gap-2 px-3 py-2 text-sm rounded-full bg-zinc-100"
      href="/"
    >
      <inline-svg
        class="w-4 h-4 fill-white"
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

        <div>
          <p class="lg:mt-4">
            {{ item.description }}
          </p>
          <base-button class="w-full rounded-full">
            Comprar
          </base-button>
        </div>
      </div>
    </div>
  </div>
</template>

