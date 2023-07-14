<template>
  <div class="long-card">
    <p>Link: {{ github_url }}</p>
  </div>
</template>

<script>
// import axios
import axios from "axios";

export default {
  props: {
    github_url: String,
  },
  mounted() {
    console.log("mounted");
    const axios = require("axios");

    const repoUrl =
      "https://api.github.com/repos/NeneWang/streamlit-fastapi-template";

    axios
      .get(repoUrl)
      .then((response) => {
        const data = response.data;
        const description = data.description;
        const languagesUrl = data.languages_url;

        console.log("Project Description:", description);

        axios
          .get(languagesUrl)
          .then((response) => {
            const languagesData = response.data;
            const languagePercentages = calculateLanguagePercentages(
              languagesData
            );
            console.log("Languages Used:");
            for (const language in languagePercentages) {
              const percentage = languagePercentages[language];
              console.log(`${language}: ${percentage.toFixed(2)}%`);
            }
          })
          .catch((error) => console.error("Error fetching languages:", error));
      })
      .catch((error) =>
        console.error("Error fetching repository information:", error)
      );

    function calculateLanguagePercentages(languagesData) {
      const totalBytes = Object.values(languagesData).reduce(
        (sum, bytesCount) => sum + bytesCount,
        0
      );
      const languagePercentages = {};

      for (const language in languagesData) {
        const bytesCount = languagesData[language];
        const percentage = (bytesCount / totalBytes) * 100;
        languagePercentages[language] = percentage;
      }

      return languagePercentages;
    }
  },
};
</script>
