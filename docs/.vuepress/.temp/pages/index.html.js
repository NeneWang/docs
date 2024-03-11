import comp from "C:/github/testing/code-documentation/docs/.vuepress/.temp/pages/index.html.vue"
const data = JSON.parse("{\"path\":\"/\",\"title\":\"\",\"lang\":\"en-US\",\"frontmatter\":{\"home\":true,\"tagline\":\"A survival guide for the corporate zombie apocalypse 🧟.\",\"actionText\":\"Get Started\",\"actionLink\":\"/guide/\",\"heroImage\":\"https://avatars.githubusercontent.com/u/29577570?v=4\",\"features\":[{\"title\":\"Tips\",\"details\":\"Tips for Survival.\",\"link\":\"https://v2.vuepress.vuejs.org/guide/assets.html#base-helper\"},{\"title\":\"Projects\",\"details\":\"Projects and Templates for future use,\"},{\"title\":\"Journals\",\"details\":\"Personal Journal from the developer.\"}],\"footer\":\"Nelson Wang since 8.10.2021\"},\"headers\":[],\"git\":{\"updatedTime\":1710098392000,\"contributors\":[{\"name\":\"NelsonWang\",\"email\":\"wangnelson2@gmail.com\",\"commits\":23}]},\"filePathRelative\":\"index.md\"}")
export { comp, data }

if (import.meta.webpackHot) {
  import.meta.webpackHot.accept()
  if (__VUE_HMR_RUNTIME__.updatePageData) {
    __VUE_HMR_RUNTIME__.updatePageData(data)
  }
}

if (import.meta.hot) {
  import.meta.hot.accept(({ data }) => {
    __VUE_HMR_RUNTIME__.updatePageData(data)
  })
}
