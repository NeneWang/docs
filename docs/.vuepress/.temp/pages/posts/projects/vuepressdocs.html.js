import comp from "C:/github/testing/code-documentation/docs/.vuepress/.temp/pages/posts/projects/vuepressdocs.html.vue"
const data = JSON.parse("{\"path\":\"/posts/projects/vuepressdocs.html\",\"title\":\"Vuepress Docs\",\"lang\":\"en-US\",\"frontmatter\":{\"title\":\"Vuepress Docs\"},\"headers\":[],\"git\":{\"updatedTime\":1710098392000,\"contributors\":[{\"name\":\"NelsonWang\",\"email\":\"wangnelson2@gmail.com\",\"commits\":1}]},\"filePathRelative\":\"posts/projects/vuepressdocs.md\",\"excerpt\":\"<p>This site should contain the Vuepress documentaiton</p>\\n\"}")
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
