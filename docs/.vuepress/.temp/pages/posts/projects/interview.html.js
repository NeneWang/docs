import comp from "C:/github/testing/code-documentation/docs/.vuepress/.temp/pages/posts/projects/interview.html.vue"
const data = JSON.parse("{\"path\":\"/posts/projects/interview.html\",\"title\":\"Interview\",\"lang\":\"en-US\",\"frontmatter\":{\"title\":\"Interview\"},\"headers\":[{\"level\":3,\"title\":\"CUNY STEM Hub\",\"slug\":\"cuny-stem-hub\",\"link\":\"#cuny-stem-hub\",\"children\":[]}],\"git\":{\"updatedTime\":1710098392000,\"contributors\":[{\"name\":\"NelsonWang\",\"email\":\"wangnelson2@gmail.com\",\"commits\":1}]},\"filePathRelative\":\"posts/projects/interview.md\",\"excerpt\":\"<h3>CUNY STEM Hub</h3>\\n<p><strong>Why do you want to join?</strong></p>\\n<p>I havent unfortunately found an paying intership despite working on more than 3 internships. I am extremely worried of never being able to make a living by doing what I love which is engineering solutions using software.</p>\\n\"}")
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
