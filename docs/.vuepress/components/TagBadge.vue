<!-- List of badges .vuepress/components/TagLinks.vue -->

<!-- List of badges .vuepress/components/TagLinks.vue -->

<template lang="html">
  <tag-badge-list :tags="$page.frontmatter.tags" />
</template>

<script>
export default {
  computed: {
    tags: {
      get() {
        return this.$page.frontmatter.tags;
      },
    },
  }
}
</script>

