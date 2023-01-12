<script setup lang="ts">
import { useNotification } from '@kyvg/vue3-notification';
import reviewsApi, { type ReviewForm, type Review } from 'api/reviews';
import { reactive, ref } from 'vue';
import BaseInput from './base-input.vue';
import BaseButton from './base-button.vue';

const emit = defineEmits<{
  (e: 'submit-review', value: Review): void
  (e: 'close-form'): void
}>();

const { notify } = useNotification();

type Props = {
  itemId: number,
}
const props = defineProps<Props>();
const isLoading = ref(false);
const error = ref(false);

const form = reactive({
  itemId: props.itemId,
  body: '',
  rating: 0,
} as ReviewForm);

async function onSubmit() {
  isLoading.value = true;
  try {
    await reviewsApi.create(form).then(res => {
      emit('submit-review', res.data.review);
      notify({ text: 'Genial, se ha creado exitosamente tu review' });
    });
  } catch (e) {
    error.value = true;
    notify({ text: 'Ha ocurrido un error, inténtalo de nuevo.', type: 'error' });
  } finally {
    isLoading.value = false;
  }
}

</script>

<template>
  <form
    class=" bg-zinc-50 p-2"
    @submit.prevent="onSubmit"
  >
    <p class="text-center text-zinc-800">
      Agrega un comentario
    </p>
    <base-input
      v-model="form.body"
      class="rounded-lg border border-zinc-300 px-4 py-3 shadow-sm  focus:outline-none"
    />
    <p
      v-if="error"
      class="text-red-500"
    >
      Ha ocurrido un error, por favor intente nuevamente.
    </p>

    <div class="flex w-full items-center">
      <base-button
        variant="secondary"
        class="w-full text-zinc-800"
        type="button"
        @click="emit('close-form')"
      >
        Cancelar
      </base-button>
      <base-button
        variant="primary"
        class="w-full"
        type="submit"
      >
        Enviar
      </base-button>
    </div>
  </form>
</template>

