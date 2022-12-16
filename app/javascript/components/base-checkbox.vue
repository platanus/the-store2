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
    class="flex items-center"
    :class="$attrs.class"
  >
    <input
      type="checkbox"
      class="mr-2 rounded border-zinc-300 bg-white focus:ring-blue-800"
      v-bind="attrsWithoutClasses"
      @input="emit('update:modelValue', ($event.target as HTMLInputElement).value)"
    >
    <span class="text-base font-normal text-zinc-800">{{ label }}</span>
  </label>
</template>
