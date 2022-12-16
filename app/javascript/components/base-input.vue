<script setup lang="ts">
import { useAttrs } from 'vue';

interface Props {
  label?: string
}
withDefaults(
  defineProps<Props>(),
  {
    label: undefined,
  },
);

const emit = defineEmits<{
  (event: 'update:modelValue', value: string): void;
}>();

const attrs = useAttrs();
const attrsWithoutClasses = Object.fromEntries(
  Object.entries(attrs).filter(([key]) => key !== 'class'),
);
</script>

<script lang="ts">
export default {
  inheritAttrs: false,
};
</script>

<template>
  <label
    class="flex flex-col"
    :class="attrs.class"
  >
    <span class="font-normal text-zinc-800">{{ label }}</span>
    <input
      class="rounded border-zinc-300 bg-white focus:ring-blue-800"
      v-bind="attrsWithoutClasses"
      @input="emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    >
  </label>
</template>
