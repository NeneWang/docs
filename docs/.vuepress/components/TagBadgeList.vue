<!-- List of badges .vuepress/components/TagLinks.vue -->

<template lang="html">
  <div>
    <router-link
      v-for="tag in tags"
      :key="tag"
      :to="{ path: `/tags.html#${tag}` }"
    >
      <Badge class="mr-3" :text="tag" :type="get_tag_color(tag)" />
      <span> </span>
      <!-- <div class"mr-1"></div> -->
    </router-link>
  </div>
</template>

<script>
export default {
  props: {
    tags: Array,
  },
  data() {
    return {
      tags_to_colors: {
        practice: "lit",
        lab: "warning",
        development: "error",
        next: "warning",
      },
    };
  },
  methods: {
    get_tag_color(tag) {
      if (tag in this.tags_to_colors) {
        return this.tags_to_colors[tag];
      }
      return "";
    },
  },
};
</script>
