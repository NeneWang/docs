<template>
  <tr>
    <td>{{title}}</td>
    <td>
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
  },
};
</script>
