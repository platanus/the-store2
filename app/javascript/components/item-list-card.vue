<script setup lang="ts">
import { computed, ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import purchasesApi from '../api/purchases';

type Props = {
  itemId: number
  name: string
  price: number
  imageUrl: string
};
const props = defineProps<Props>();

const currencyFormatter = new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' });
const formattedPrice = computed(() => currencyFormatter.format(props.price));

const loading = ref(false);
const { notify } = useNotification();
async function buy() {
  loading.value = true;
  try {
    await purchasesApi.create(props.itemId);
    notify({ text: 'Genial, recibimos tu orden! Te contactaremos para coordinar', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}
</script>

<template>
  <div class="flex w-80 flex-col items-center gap-4 overflow-hidden rounded-lg bg-white shadow-md">
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
    <button
      class="w-full py-4 text-blue-800 disabled:text-zinc-500"
      :disabled="loading"
      @click="buy"
    >
      Comprar
    </button>
  </div>
</template>
