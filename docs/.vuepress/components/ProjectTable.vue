<template>
  <div class="features row">
    <div class="feature col-sm-6" v-for="project in projects" :key="project.name">
      <feature-card
        :title="project.name"
        :link="project.link"
        :description="project.description"
      />
      
    </div>
  </div>
</template>

<script>
import FeatureCard from "./FeatureCard.vue";
export default {
  components: { FeatureCard },
  data() {
    return {
      projects: [
        {
          name: "Project 1",
          description: "Description 1",
          link: "Some link",
        },
        {
          name: "Project 2",
          description: "Description 2",
          link: "Some link",
        },
        {
          name: "Project 2",
          description: "Description 2",
          link: "Some link",
        },
        {
          name: "Project 1",
          description: "Description 1",
          link: "Some link",
        },
        {
          name: "Project 2",
          description: "Description 2",
          link: "Some link",
        },
        {
          name: "Project 2",
          description: "Description 2",
          link: "Some link",
        },
      ],
    };
  },
};
</script>

<style>
</style>
