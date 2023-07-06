<!-- .vuepress/components/TagList.vue -->
<!-- These are just h2 lists -->
<template lang="html">
  <div class="row">
    <div class="col-md-6" v-for="tag in Object.keys(tags)">
      <h2 class="table-title" :id="tag">
        <router-link
          :to="{ path: `/tags.html#${tag}` }"
          class="header-anchor"
          aria-hidden="true"
          >#</router-link
        >
        {{ tag }}
      </h2>
      <ul>
        <li v-for="page in tags[tag]">
          <router-link :to="{ path: page.path }">{{ page.title }}</router-link>
        </li>
      </ul>
    </div>
  </div>
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
