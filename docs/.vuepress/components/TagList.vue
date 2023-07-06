<!-- .vuepress/components/TagList.vue -->
<template lang="html">
  <TagBadgeList :tags="Object.keys(tags)" />
</template>

<script>
export default {
  computed: {
    tags() {
      let tags = {};
      for (let page of this.$site.pages) {
        for (let index in page.frontmatter.tags) {
          const tag = page.frontmatter.tags[index];
          if (tag in tags) {
            tags[tag].push(page);
          } else {
            tags[tag] = [page];
          }
        }
      }
      return tags;
    },
  },
};
</script>
