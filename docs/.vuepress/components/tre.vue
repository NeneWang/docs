// table row escape

<template>
  <tr>
    <td>
      {{ title }}: <br />
    </td>
    <td class="code" >
      <slot></slot>
      
      <span class="subtitle">{{ sub }}</span>
    </td>
  </tr>
</template>

<script>
export default {
  props: {
    title: {
      required: true,
    },
    sub: {
      required: false,
    },
  },
  data() {
    return {
    };
  },

};
</script>

<style lang="stylus">
.code{

color:white;
font-size: .85em;
}

.subtitle{
  font-size:.7em;
}
</style>
