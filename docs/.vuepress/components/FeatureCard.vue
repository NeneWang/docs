<template>
  <div class="small-card">
    <router-link :to="{ path: link }">
      <h2>{{ title }}</h2>
      
      <p>{{ description }}</p>
    </router-link>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    description: String,
    link: String,
    tags: Array,
  },
};
</script>

<style>
.small-card {
  border: 1px solid #ccc;
  padding: 10px;

  border-radius: 4px;
  margin: 10px;
  /* background-color: #f5f5f5; */
  /* width: 180px; */
}
</style>
