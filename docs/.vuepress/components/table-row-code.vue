<template>
  <tr>
    <td>
      {{ title }} <br />
    </td>
    <td>
      <span class="subtitle">{{ sub }}</span>
      <pre> <code v-html="code"></code></pre>
      
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
  data() {
    return {
      title,
    };
  },

  computed: {
    cleanMessage() {
      return this.$sanitize(code);
    },
  },
};
</script>

<style lang="stylus">
pre{

color:white;
font-size: .65em;
}

.subtitle{
  font-size:.7em;
}
</style>
