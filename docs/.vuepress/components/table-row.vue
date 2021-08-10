<template>
  <p class="demo">
    okay....
    {{ msg }} {{value}}
  </p>
</template>

<script>
  export default {
    props:{
      value: {
        required: true
      }
    },
    data() {
      return {
        msg: `Hello this is <demo-component>`
      }
    }
  }
</script>
