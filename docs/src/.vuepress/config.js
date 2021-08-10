const {
  description
} = require('../../package')

module.exports = {
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#title
   */
  title: 'Code',
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#description
   */
  description: description,

  /**
   * Extra tags to be injected to the page HTML `<head>`
   *
   * ref：https://v1.vuepress.vuejs.org/config/#head
   */
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
    editLinks: false,
    docsDir: '',
    editLinkText: '',
    lastUpdated: false,
    nav: [{
        text: 'Guide',
        link: '/guide/',
      },
      {
        text: 'Config',
        link: '/config/'
      },
    ],
    sidebar: {
      '/overview/': [{
        title: 'Overview',
        collapsable: false,
        children: [
          '',
          'Guide',
          'Plan',
          'random',
          
        ]
      }],
      '/web/': [{
        title: 'Web',
        collapsable: false,
        children: [
          'HTML',
          'Javascript',
          'CSS',
          'Sass',
          'React',
          'Angular',
          'Vue',
          'Next',
          'MongoDB',
          'MySQL',
          'Express',
          'Laravel',
          'Django',
          'PHP',
        ]
      }],
      '/automation/': [{
        title: 'Automation',
        collapsable: false,
        children: [
          'Makefile',
          'Git',
          'Shell',
          'Python',
          'UIPath',
          'Java',
        ]
      }],
      '/desktop/': [{
        title: 'Desktop',
        collapsable: false,
        children: [
          'Electron',
        ]
      }],
      '/game/': [{
        title: 'Game',
        collapsable: false,
        children: [
          'Unity',
          'Engine',
          'Utilities',
          'Animation',
          'Models',
        ]
      }],
      '/mobile/': [{
        title: 'Mobile',
        collapsable: false,
        children: [
          'ReactNative',
          'Flutter',
          'XCode',
          'AndroidStudio',
        ]
      }],
    }
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    '@vuepress/plugin-back-to-top',
    '@vuepress/plugin-medium-zoom',
  ]
}