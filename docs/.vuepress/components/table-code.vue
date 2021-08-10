<template>
  <div class="subsection">
    <h2>{{ title }}</h2>
    <table style="width:100%!important">
      <tr>
        <th>Description</th>
        <th>Code</th>
      </tr>
      <slot></slot>
    </table>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      required: true,
    },
  },
};
</script>
