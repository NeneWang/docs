<template>
  <div class="features">
    <div class="feature row" v-for="project in projects" :key="project.name">
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
.features {
  display: flex;
  flex-wrap: wrap;
}

.feature {
  flex: 1;
  margin-right: 10px;
  margin-bottom: 10px;
}
</style>
