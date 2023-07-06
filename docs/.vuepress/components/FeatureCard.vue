<template>
  <div class="small-card">
    <tag-badge-list :tags="tags" />
    <router-link :to="{ path: link }">
      <h2>{{ title }}</h2>
      <p>{{ description }}</p>
    </router-link>
  </div>
</template>

<script>
import TagBadgeList from "./TagBadgeList.vue";
export default {
  components: { TagBadgeList },
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
