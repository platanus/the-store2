<script setup lang="ts">
</script>

<template>
  <notifications
    :duration="-1"
    width="auto"
  />
</template>

<style scoped lang="scss">
::v-deep .vue-notification {
  @apply font-base text-sm;

  &.success {
    @apply bg-green-400 border-l-green-600;
  }

  &.error {
    @apply bg-rose-400 border-l-rose-600;
  }
}
</style>
