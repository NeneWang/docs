import comp from "C:/github/testing/code-documentation/docs/v2/code-docs-v2/docs/.vuepress/.temp/pages/posts/code/index.html.vue"
const data = JSON.parse("{\"path\":\"/posts/code/\",\"title\":\"Introduction\",\"lang\":\"en-US\",\"frontmatter\":{},\"headers\":[],\"git\":{\"updatedTime\":null,\"contributors\":[]},\"filePathRelative\":\"posts/code/README.md\",\"excerpt\":\"\\n<p>As for 2022-10-15 13:54:16\\nI will be shifting the focus of the code into components and templates.</p>\\n<ul>\\n<li>Templates</li>\\n<li>Components</li>\\n</ul>\\n\"}")
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
