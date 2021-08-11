<!-- .vuepress/components/TagLinks.vue -->
<template lang="html">
  <div>

    <router-link
      v-for="tag in $page.frontmatter.tags"
      :key="tag"
      :to="{ path: `/tags.html#${tag}` }"
    >
      <Badge v-if="tag == 'practice'" type="lit" text="Practice Available" />
      <Badge v-if="tag == 'lab'" type="warning" text="Lab" />
      <Badge v-if="tag == 'development'" type="error" text="Development" />
    </router-link>
  </div>
</template>
