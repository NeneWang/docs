import comp from "C:/github/testing/code-documentation/docs/.vuepress/.temp/pages/posts/projects/python.html.vue"
const data = JSON.parse("{\"path\":\"/posts/projects/python.html\",\"title\":\"Python Stack\",\"lang\":\"en-US\",\"frontmatter\":{\"title\":\"Python Stack\"},\"headers\":[{\"level\":2,\"title\":\"Fast API + Streamlit\",\"slug\":\"fast-api-streamlit\",\"link\":\"#fast-api-streamlit\",\"children\":[]},{\"level\":2,\"title\":\"Streamlit Authentication\",\"slug\":\"streamlit-authentication\",\"link\":\"#streamlit-authentication\",\"children\":[]}],\"git\":{\"updatedTime\":1710098392000,\"contributors\":[{\"name\":\"NelsonWang\",\"email\":\"wangnelson2@gmail.com\",\"commits\":1}]},\"filePathRelative\":\"posts/projects/python.md\",\"excerpt\":\"<h2>Fast API + Streamlit</h2>\\n<p>https://github.com/NeneWang/streamlit-fastapi-template</p>\\n\"}")
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
