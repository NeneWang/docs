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
   publicPath: './',

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
    editLinks: true,
    docsDir: '',
    editLinkText: '',
    lastUpdated: true,
    nav: [{
        text: 'Code Documentation',
        link: '/code/',
      },
      {
        text: 'Config',
        link: '/config/'
      },
    ],
    sidebar: {

      '/code/': [
        
        {
          title: 'Overview',
          collapsable: true,
          children: [
            
            '',
            'guide',
            'plan',
            // 'random',
          ]
        },
        {
        title: 'Web Development',
        collapsable: true,
        children: [
          // 'angular',
          'css',
          'express',
          'html',
          'javascript',
          // 'laravel',
          // 'mongodb',
          'mysql',
          // 'next',
          'php',
          // 'react',
          // 'sass',
          // 'vue',
        ]
      }, 
      {
        title: 'Automation',
        collapsable: true,
        children: [
          'git',
          'vcs',
          'makefile',
          'shell',
          // 'python',
          // 'uipath',
          // 'java',
          
        ]
      },
      // {
      //   title: 'Game',
      //   collapsable: true,
      //   children: [
      //     'unity',
      //     'engine',
      //     'utilities',
      //     'animation',
      //     'model',
          
      //   ]
      // }, 
    ],
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