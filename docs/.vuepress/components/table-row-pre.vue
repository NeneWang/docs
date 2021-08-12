<template>
  <tr>
    <td>{{title}}</td>
    <td>
      <span class="subtitle">{{ sub }}</span>
      <br v-if="sub">
      <code>{{code}}</code>
    </td>
  </tr>
</template>

<script>
export default {
  props: {
    title: {
      required: true,
    },
    code: {
      required: true,
    },
    type: {
      required: false,
    },
    sub: {
      required: false,
    },
  },
};
</script>
