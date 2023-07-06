<!-- .vuepress/components/TagBadgeList.vue -->
<template lang="html">
  <div class="row">
    <div class="col-md-6" v-for="tag in tags">
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
    props: ['tags']
};
</script>
