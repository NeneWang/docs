
<template>
  <tr>
    <td>
      {{ title }} <br />
    </td>
    <td>
      <span class="subtitle">{{ sub }}</span>
      <pre class="code-pre" > {{code}} </pre>
      
    </td>
  </tr>
</template>

<script>
export default {
  props: {
    title: {
      required: false,
    },
    code: {
      required: false,
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

