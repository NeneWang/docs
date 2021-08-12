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
    ],
    sidebar: {

      '/projects/': [

        {
          title: 'Projects',
          collapsable: true,
          children: [
            '',
            'lab42',
            // 'random',
          ]
        },
      ],
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
            'terminal-libraries',
            // 'vcs',
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