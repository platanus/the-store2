<script setup lang="ts">
import { computed } from 'vue';

type Props = {
  name: string
  price: number
  imageUrl: string
};
const props = defineProps<Props>();
const currencyFormatter = new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' });
const formattedPrice = computed(() => currencyFormatter.format(props.price));
</script>

<template>
  <div class="flex w-80 flex-col gap-4 overflow-hidden rounded-lg bg-white shadow-md">
    <img
      :src="imageUrl"
      alt="Product image"
      class="w-full"
    >
    <div class="flex flex-col gap-2 text-center text-zinc-800">
      <span class="text-xl font-bold">
        {{ formattedPrice }}
      </span>
      <span>
        {{ name }}
      </span>
    </div>
    <button class="w-full py-4 text-blue-800">
      Comprar
    </button>
  </div>
</template>
