import comp from "C:/github/testing/code-documentation/docs/.vuepress/.temp/pages/posts/projects/documentation.html.vue"
const data = JSON.parse("{\"path\":\"/posts/projects/documentation.html\",\"title\":\"Documentation templates\",\"lang\":\"en-US\",\"frontmatter\":{\"title\":\"Documentation templates\",\"tags\":[\"documentation\",\"templates\"],\"description\":\"Collection of projects used for documentation or blog creation with Markdown.\"},\"headers\":[{\"level\":2,\"title\":\"PWA React Docusaurus Template\",\"slug\":\"pwa-react-docusaurus-template\",\"link\":\"#pwa-react-docusaurus-template\",\"children\":[]},{\"level\":2,\"title\":\"Vue Documentation\",\"slug\":\"vue-documentation\",\"link\":\"#vue-documentation\",\"children\":[]},{\"level\":2,\"title\":\"Storybook React\",\"slug\":\"storybook-react\",\"link\":\"#storybook-react\",\"children\":[]}],\"git\":{\"updatedTime\":1710098392000,\"contributors\":[{\"name\":\"NelsonWang\",\"email\":\"wangnelson2@gmail.com\",\"commits\":1}]},\"filePathRelative\":\"posts/projects/documentation.md\",\"excerpt\":\"<h2>PWA React Docusaurus Template</h2>\\n<p>https://github.com/NeneWang/template_pwa_doc</p>\\n<p>Features:</p>\\n<ul>\\n<li>PWA Support</li>\\n<li>Search on Deploy</li>\\n<li>Zoomable Images</li>\\n</ul>\\n<h2>Vue Documentation</h2>\\n<p>Git: https://github.com/NeneWang/code-documentation\\nDeployed version: https://docs.wangnelson.xyz/</p>\"}")
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
