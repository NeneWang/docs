<template>
  <tr>
    <td>{{title}}</td>
    <td>
      <pre>{{code}}</pre>
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
