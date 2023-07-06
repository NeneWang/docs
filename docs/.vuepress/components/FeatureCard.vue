<template>
  <div class="small-card col-md-3">
    <h2>{{ title }}</h2>
    <p>{{ description }}</p>
    <a :href="link">Link</a>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    description: String,
    link: String,
  },
};
</script>

<style>
.small-card {
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 4px;
  background-color: #f5f5f5;
  width: 200px;
}
</style>
