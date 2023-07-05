<!-- .vuepress/components/TagLinks.vue -->
<template lang="html">
  <div>
    <router-link
      v-for="tag in $page.frontmatter.tags"
      :key="tag"
      :to="{ path: `/tags.html#${tag}` }"
    >
      <Badge :text="tag" :type="get_tag_color(tag)" />
    </router-link>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tags_to_colors: {
        practice: "lit",
        lab: "warning",
        development: "error",
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
