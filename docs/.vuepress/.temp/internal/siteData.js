export const siteData = JSON.parse("{\"base\":\"/https://nenewang.github.io/code-documentation/\",\"lang\":\"en-US\",\"title\":\"Salaryman's Survival Guide\",\"description\":\"For those who want to improve at their craft and get ahead in their career.\",\"head\":[],\"locales\":{}}")

if (import.meta.webpackHot) {
  import.meta.webpackHot.accept()
  if (__VUE_HMR_RUNTIME__.updateSiteData) {
    __VUE_HMR_RUNTIME__.updateSiteData(siteData)
  }
}

if (import.meta.hot) {
  import.meta.hot.accept(({ siteData }) => {
    __VUE_HMR_RUNTIME__.updateSiteData(siteData)
  })
}
