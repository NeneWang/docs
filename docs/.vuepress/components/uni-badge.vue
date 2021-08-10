// table row escape

<template>
  <ul>
    <li v-if="lab">Lab</li>
    <li v-if="practice">Practice</li>
  </ul>
</template>

<script>
export default {
  props: {
    lab: {
      required: false,
    },
    practice: {
      required: false,
    },
  },
};
</script>
