<script setup lang="ts">
import type { Item } from '../api/items';
import ItemListCard from './item-list-card.vue';

type Props = {
  items: Item[]
};
defineProps<Props>();
</script>

<template>
  <div class="mx-auto grid grid-cols-2 gap-12">
    <item-list-card
      v-for="item in items"
      :key="item.id"
      :item-id="item.id"
      :name="item.name"
      :price="item.price"
      :image-url="item.image['sm']['url']"
    />
  </div>
</template>
