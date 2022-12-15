<script setup lang="ts">
interface Props {
  signedIn: boolean
}
defineProps<Props>();

const inStore = location.pathname === '/';
const inPurchases = location.pathname === '/purchases';
</script>

<template>
  <header class="flex w-full items-center bg-blue-800 px-8 py-2 text-white">
    <h1 class="mr-16 text-2xl font-bold">
      The Store
    </h1>
    <div
      v-if="signedIn"
      class="flex gap-10"
    >
      <a
        href="/"
        :class="{'font-medium border-b-2 border-yellow-400': inStore}"
      >
        Tienda
      </a>
      <a
        href="/purchases"
        :class="{'font-medium border-b-2 border-yellow-400': inPurchases}"
      >
        Mis compras
      </a>
    </div>
  </header>
</template>
