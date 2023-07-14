

const repoUrl = "https://api.github.com/repos/NeneWang/streamlit-fastapi-template";

fetch(repoUrl)
  .then(response => response.json())
  .then(data => {
    const description = data.description;
    const languagesUrl = data.languages_url;

    console.log("Project Description:", description);

    fetch(languagesUrl)
      .then(response => response.json())
      .then(languagesData => {
        const languagePercentages = calculateLanguagePercentages(languagesData);
        console.log("Languages Used:");
        for (const language in languagePercentages) {
          const percentage = languagePercentages[language];
          console.log(`${language}: ${percentage.toFixed(2)}%`);
        }
      })
      .catch(error => console.error("Error fetching languages:", error));
  })
  .catch(error => console.error("Error fetching repository information:", error));

function calculateLanguagePercentages(languagesData) {
  const totalBytes = Object.values(languagesData).reduce((sum, bytesCount) => sum + bytesCount, 0);
  const languagePercentages = {};

  for (const language in languagesData) {
    const bytesCount = languagesData[language];
    const percentage = (bytesCount / totalBytes) * 100;
    languagePercentages[language] = percentage;
  }

  return languagePercentages;
}
