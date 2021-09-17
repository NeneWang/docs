const {
  description
} = require('../../package')

module.exports = {
  title: 'Docs',
  publicPath: './',

  description: description,
  head: [
    ['meta', {
      name: 'theme-color',
      content: '#3eaf7c'
    }],
    ['meta', {
      name: 'apple-mobile-web-app-capable',
      content: 'yes'
    }],
    ['meta', {
      name: 'apple-mobile-web-app-status-bar-style',
      content: 'black'
    }]
  ],


  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  themeConfig: {
    repo: '',
    editLinks: true,
    docsDir: '',
    editLinkText: '',
    lastUpdated: true,
    nav: [{
        text: 'Code',
        link: '/code/',
      },
      {
        text: 'Project',
        link: '/projects/'
      },
      {
        text: 'Journal',
        link: '/journal/'
      },
    ],
  },


  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    '@vuepress/plugin-back-to-top',
    '@vuepress/plugin-medium-zoom',
    ["vuepress-plugin-auto-sidebar", {
      // sort: {
      //   readmeFirstForce: true,
      // },
      title: {
        mode: "titlecase",
        map: {
          "/code/mobile/": "mobile",
          "/code/web/": "web"
        }
      },
      sidebarDepth: 1,
      collapse: {
        open: true,
        collapseList: ["/code/web/"],
        uncollapseList: ["/code/game/"]
      },
      // sidebarDepth: 1,
      // collapse: {
      //   open: true,
      //   collapseList: ["/menu1/menu1-2/"],
      //   uncollapseList: ["/menu1/menu1-3/"]
      // },
      // ignore: [
      //   {
      //     menu: "/menu3/menu3-3/",
      //     regex: "ignore-*"
      //   }
      // ]
    }]
  ],

}