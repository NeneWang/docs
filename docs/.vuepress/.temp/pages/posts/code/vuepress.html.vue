<template><div>
<nav class="table-of-contents"><ul><li><router-link to="#adding-bootstrap">Adding Bootstrap:</router-link></li><li><router-link to="#fetching-pages-in-current-folder">Fetching Pages in Current Folder:</router-link></li></ul></nav>
<h3 id="adding-bootstrap" tabindex="-1"><a class="header-anchor" href="#adding-bootstrap"><span>Adding Bootstrap:</span></a></h3>
<p>https://conorsheehan1.hashnode.dev/add-bootstrap-vue-to-vuepress</p>
<p>For Adding Bootstrap into it.</p>
<p>Have Bootstrap.</p>
<h3 id="fetching-pages-in-current-folder" tabindex="-1"><a class="header-anchor" href="#fetching-pages-in-current-folder"><span>Fetching Pages in Current Folder:</span></a></h3>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>
<span class="token operator">&lt;</span>script<span class="token operator">></span>
<span class="token keyword">import</span> FeatureCard <span class="token keyword">from</span> <span class="token string">"./FeatureCard.vue"</span><span class="token punctuation">;</span>
<span class="token keyword">export</span> <span class="token keyword">default</span> <span class="token punctuation">{</span>
  <span class="token literal-property property">components</span><span class="token operator">:</span> <span class="token punctuation">{</span> FeatureCard <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token function">mounted</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token string">"mounted"</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">this</span><span class="token punctuation">.</span><span class="token function">getPagesInCurrentFolder</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    console<span class="token punctuation">.</span><span class="token function">log</span><span class="token punctuation">(</span><span class="token keyword">this</span><span class="token punctuation">.</span>pagesInCurrentFolder<span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token function">data</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token punctuation">{</span>
      <span class="token literal-property property">projects</span><span class="token operator">:</span> <span class="token punctuation">[</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token string">"Project 1"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">description</span><span class="token operator">:</span> <span class="token string">"Description 1"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">link</span><span class="token operator">:</span> <span class="token string">"Some link"</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token string">"Project 2"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">description</span><span class="token operator">:</span> <span class="token string">"Description 2"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">link</span><span class="token operator">:</span> <span class="token string">"Some link"</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token string">"Project 3"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">description</span><span class="token operator">:</span> <span class="token string">"Description 2"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">link</span><span class="token operator">:</span> <span class="token string">"Some link"</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token string">"Project 4"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">description</span><span class="token operator">:</span> <span class="token string">"Description 1"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">link</span><span class="token operator">:</span> <span class="token string">"Some link"</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token string">"Project 5"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">description</span><span class="token operator">:</span> <span class="token string">"Description 2"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">link</span><span class="token operator">:</span> <span class="token string">"Some link"</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
        <span class="token punctuation">{</span>
          <span class="token literal-property property">name</span><span class="token operator">:</span> <span class="token string">"Project 6"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">description</span><span class="token operator">:</span> <span class="token string">"Description 2"</span><span class="token punctuation">,</span>
          <span class="token literal-property property">link</span><span class="token operator">:</span> <span class="token string">"Some link"</span><span class="token punctuation">,</span>
        <span class="token punctuation">}</span><span class="token punctuation">,</span>
      <span class="token punctuation">]</span><span class="token punctuation">,</span>
      <span class="token literal-property property">pagesInCurrentFolder</span><span class="token operator">:</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
    <span class="token punctuation">}</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token literal-property property">methods</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token function">getPagesInCurrentFolder</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
      <span class="token keyword">const</span> currentFolder <span class="token operator">=</span> <span class="token keyword">this</span><span class="token punctuation">.</span>$route<span class="token punctuation">.</span>path<span class="token punctuation">.</span><span class="token function">substring</span><span class="token punctuation">(</span>
        <span class="token number">0</span><span class="token punctuation">,</span>
        <span class="token keyword">this</span><span class="token punctuation">.</span>$route<span class="token punctuation">.</span>path<span class="token punctuation">.</span><span class="token function">lastIndexOf</span><span class="token punctuation">(</span><span class="token string">"/"</span><span class="token punctuation">)</span>
      <span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token keyword">this</span><span class="token punctuation">.</span>pagesInCurrentFolder <span class="token operator">=</span> <span class="token keyword">this</span><span class="token punctuation">.</span>$site<span class="token punctuation">.</span>pages<span class="token punctuation">.</span><span class="token function">filter</span><span class="token punctuation">(</span><span class="token punctuation">(</span><span class="token parameter">page</span><span class="token punctuation">)</span> <span class="token operator">=></span>
        page<span class="token punctuation">.</span>path<span class="token punctuation">.</span><span class="token function">startsWith</span><span class="token punctuation">(</span>currentFolder<span class="token punctuation">)</span>
      <span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
<span class="token punctuation">}</span><span class="token punctuation">;</span>
<span class="token operator">&lt;</span><span class="token operator">/</span>script<span class="token operator">></span>

<span class="token operator">&lt;</span>style<span class="token operator">></span><span class="token operator">&lt;</span><span class="token operator">/</span>style<span class="token operator">></span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Which means it wors.</p>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>Array(3) [ {…}, {…}, {…} ]
​
0: Object { title: Getter &amp; Setter, frontmatter: Getter &amp; Setter, regularPath: Getter &amp; Setter, … }
​​
__ob__: Object { value: {…}, dep: {…}, vmCount: 0 }
​​
createdTime: 
​​
frontmatter: Object { title: Getter &amp; Setter, … }
​​​
__ob__: Object { value: {…}, dep: {…}, vmCount: 0 }
​​​
title: 
​​​
&lt;get title()>: function reactiveGetter()
​​​
&lt;set title()>: function reactiveSetter(newVal)
​​​
&lt;prototype>: Object { … }
​​
key: 
​​
lastUpdated: 
​​
path: 
​​
regularPath: 
​​
relativePath: 
​​
title: 
​​
&lt;get createdTime()>: function reactiveGetter()
​​
&lt;set createdTime()>: function reactiveSetter(newVal)
​​
&lt;get frontmatter()>: function reactiveGetter()
​​
&lt;set frontmatter()>: function reactiveSetter(newVal)
​​
&lt;get key()>: function reactiveGetter()
​​
&lt;set key()>: function reactiveSetter(newVal)
​​
&lt;get lastUpdated()>: function reactiveGetter()
​​
&lt;set lastUpdated()>: function reactiveSetter(newVal)
​​
&lt;get path()>: function reactiveGetter()
​​
&lt;set path()>: function reactiveSetter(newVal)
​​
&lt;get regularPath()>: function reactiveGetter()
​​
&lt;set regularPath()>: function reactiveSetter(newVal)
​​
&lt;get relativePath()>: function reactiveGetter()
​​
&lt;set relativePath()>: function reactiveSetter(newVal)
​​
&lt;get title()>: function reactiveGetter()
​​
&lt;set title()>: function reactiveSetter(newVal)
​​
&lt;prototype>: Object { … }
​
1: Object { title: Getter &amp; Setter, frontmatter: Getter &amp; Setter, regularPath: Getter &amp; Setter, … }
​
2: Object { title: Getter &amp; Setter, frontmatter: Getter &amp; Setter, regularPath: Getter &amp; Setter, … }
​
__ob__: Object { value: (3) […], dep: {…}, vmCount: 0 }
​
length: 3
​
&lt;prototype>: Object { … }
ProjectTable.vue:24

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div></div></template>


