<template>
  <div class="features row">
    <div
      class="feature col-sm-6"
      v-for="project in projects"
      :key="project.name"
    >
      <feature-card
        :title="project.name"
        :link="project.link"
        :description="project.description"
        :tags="project.tags"
      />
    </div>
  </div>
</template>

<script>
import FeatureCard from "./FeatureCard.vue";
export default {
  components: { FeatureCard },
  mounted() {
    console.log("mounted");
    this.getPagesInCurrentFolder();
    const projects_data = [];
    // console.log(this.pagesInCurrentFolder);
    for (let page of this.pagesInCurrentFolder) {
      // console.log(page);
      if (page.path == this.folder_path) continue;
      projects_data.push({
        name: page.title,
        description: page.description??"",
        link: page.path,
        tags: page.frontmatter.tags??[],
      });
    }
    console.log("project_data", projects_data);
    // this.projects = projects_data;
  },
  data() {
    return {
      folder_path: "/projects/",
      projects: [],
      pagesInCurrentFolder: [],
    };
  },
  methods: {
    getPagesInCurrentFolder() {
      const currentFolder = this.$route.path.substring(
        0,
        this.$route.path.lastIndexOf("/")
      );
      this.pagesInCurrentFolder = this.$site.pages.filter((page) =>
        page.path.startsWith(currentFolder)
      );
    },
  },
};
</script>

<style></style>
