import comp from "C:/github/testing/code-documentation/docs/.vuepress/.temp/pages/posts/projects/angular-dotnet.html.vue"
const data = JSON.parse("{\"path\":\"/posts/projects/angular-dotnet.html\",\"title\":\"Angular Dotnet\",\"lang\":\"en-US\",\"frontmatter\":{\"title\":\"Angular Dotnet\",\"tags\":[\"Angular\",\".net\"]},\"headers\":[],\"git\":{\"updatedTime\":1710098392000,\"contributors\":[{\"name\":\"NelsonWang\",\"email\":\"wangnelson2@gmail.com\",\"commits\":1}]},\"filePathRelative\":\"posts/projects/angular-dotnet.md\",\"excerpt\":\"<p>AlgoDateApp</p>\\n<div class=\\\"language-text\\\" data-ext=\\\"text\\\" data-title=\\\"text\\\"><pre class=\\\"language-text\\\"><code>Installation\\ndotnet new snl\\ndotnet new webapi -n API\\ndotnet sln add API\\n\\n</code></pre></div><p><strong>Features</strong></p>\\n<ul>\\n<li>Swagger</li>\\n<li>.Net C# API</li>\\n</ul>\\n\"}")
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
