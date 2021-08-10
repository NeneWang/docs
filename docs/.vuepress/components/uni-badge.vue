// table row escape

<template>
  <div>
      <Badge v-if="practice" type="lit" text="Practice Available" />
      <Badge v-if="lab" type="warning" text="Lab"/>
      <Badge v-if="develpoment" type="error" text="Development" />
    <!-- <li v-if="lab">Lab</li>
    <li v-if="practice">Practice</li> -->
  </div>
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
    development: {
      required: false,
    },
  },
};
</script>
