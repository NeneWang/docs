const {
  description
} = require('../../package')

module.exports = {
  title: 'Salaryman\'s Survival Guide',
  publicPath: './',
  extendsMarkdown: (md) => {
    md.use('markdown-it-task-lists')
  },
  markdown: {
    config: md => {
      md.use(require('markdown-it-task-lists'))
    }
  },

  description: description,
  head: [
    [
      'link',
      {
        rel: 'icon',
        href: '/img/favicon.png'
      }
    ],
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
    }],
  ],

  // docs/.vuepress/dist

  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   * Test
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  themeConfig: {
    repo: '',
    editLinks: true,
    docsDir: '',
    editLinkText: '',
    lastUpdated: true,
    logo: '/img/favicon.png',
    nav: [
      {
        text: 'Guide',
        link: '/guide/',
      },
      {
        text:  `👩‍💻 Dev Notes`,
        ariaLabel: 'Author Notes',
        items: [
          {
            text: 'Code',
            link: '/code/',
          },
          {
            text: ' 🏗 Project',
            link: '/projects/'
          }, {
            text: ' 📓 Journal',
            link: '/journal/'
          },
        ]
      },
      {
        text: `🔗 Links`,
        items: [

          {
            text: "Admin",
            link: "https://project.wangnelson.xyz/public/prod"
          },
          {
            text: 'Strategic Docs',
            link: 'https://strategy.wangnelson.xyz/'
          },
          {
            text: 'Learning Docs',
            linkL: 'https://learning.wangnelson.xyz/'
          },
          {
            text: 'Platinum Docs',
            link: 'https://platinum.wangnelson.xyz/'
          },
          {
            text: 'Portfolio Docs',
            link: 'https://docs.wangnelson.xyz/'
          }
        ]
      }
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
    }]
  ],

}