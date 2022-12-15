<script setup lang="ts">
type Props = {
  itemName: string
  status: 'pending' | 'delivered'
};
defineProps<Props>();
const tagColorClasses = {
  pending: 'bg-yellow-50 border border-yellow-500 text-yellow-500',
  delivered: 'bg-green-50 border border-green-500 text-green-500',
};
const tagText = {
  pending: 'En proceso',
  delivered: 'Entregado',
};
</script>

<template>
  <div class="flex w-full items-center justify-between rounded-md bg-white px-4 py-3 shadow-md">
    <span class="text-zinc-800">{{ itemName }}</span>
    <div
      :class="tagColorClasses[status]"
      class="rounded-md px-2 py-0.5 font-medium"
    >
      {{ tagText[status] }}
    </div>
  </div>
</template>
