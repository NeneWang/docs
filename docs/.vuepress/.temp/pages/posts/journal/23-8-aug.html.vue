<template><div><h3 id="_30-todo" tabindex="-1"><a class="header-anchor" href="#_30-todo"><span>30.todo</span></a></h3>
<ul>
<li>[x]  30.1 Deciding to document things</li>
<li>[x]  30.2 Installing WikiMedia</li>
<li>[x]  30.3 Changing Wiki Medias Icons.</li>
<li>[ ]  30.4 Setting up the Algorithmic registrations of things done from the API.</li>
<li>[ ]  30.4 Deleting a certain server or merging them together (ecommerce ctp.)</li>
</ul>
<h3 id="_30-1-deciding-to-document-things" tabindex="-1"><a class="header-anchor" href="#_30-1-deciding-to-document-things"><span>30.1 Deciding to document things</span></a></h3>
<p>Getting all started again with documentation.</p>
<p>Here the things I want to get started on documentation:</p>
<ul>
<li>Algorithms.</li>
</ul>
<p>Automatic documentation for Clozing. and comments and suggestions from the creaion of them.</p>
<p>ITs beeen more than a month since I stopped documenting, I wonder if I can get started agian with all the documentation I want to have.</p>
<p>So what were my summer projects that I wanted to do?</p>
<p>Right, I believe this might be because I started working on these apps.  And just trainning my algorithmic thinking.</p>
<p>So here the Wikis I would be doing with X framework:</p>
<table>
<thead>
<tr>
<th>domain</th>
<th>Framework</th>
<th>About</th>
</tr>
</thead>
<tbody>
<tr>
<td>wiki.anviltech</td>
<td>Wikimedia</td>
<td>Marketing and UX/UI</td>
</tr>
<tr>
<td>code.wangnelson</td>
<td>Vuepress</td>
<td>Templates and Code.</td>
</tr>
<tr>
<td>design.wangnelson</td>
<td>Docusaurus</td>
<td>Algo + Design  + AI</td>
</tr>
</tbody>
</table>
<p>Meta:</p>
<ol>
<li>wiki.anviltech: The idea is to register the techniques used in Marketing and UI/UX. I believe organization planning and culture management should have it's own section, which would make sense. But the problem is that is not something you want to specifically show a hiring manager But it would make sense on the way as it is also the marketing and PR of a company depends much of the organization values and the like.</li>
<li>code.wangnelson: This is more of a personal place where I can store both the projects I have done, link them with the Notion api to have all the assets and explaination and blogs of my personal projects.</li>
<li>design.wangnelson This is more to show of your research into the improvements of computer Science.</li>
</ol>
<h3 id="_30-2-installing-wikimedia" tabindex="-1"><a class="header-anchor" href="#_30-2-installing-wikimedia"><span>30.2  Installing WikiMedia</span></a></h3>
<p>Now lets install wikimedia on the so wanted page. The installed wikimedia shouldbe there but lets see, because you might have to switch the pointer.</p>
<ul>
<li>The problem is with the links, whereas the links desnt seem to be working for transference</li>
<li>While it says</li>
</ul>
<p>So I have no other way than to install it on the wngnelson.xyz folder</p>
<p>Admin Account</p>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>WikiSysop
wikinel448
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div></div></div><p>site Config</p>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>WikiName
admin@wiki.wangnelson.xyz
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>wangnelson2@gmail.com
wangnelson2
AnvilTech448!
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h3 id="_31" tabindex="-1"><a class="header-anchor" href="#_31"><span>31</span></a></h3>
<h3 id="_31-todo" tabindex="-1"><a class="header-anchor" href="#_31-todo"><span>31.todo</span></a></h3>
<ul>
<li>[ ] 31.1 Showing a list of top 10 stocks</li>
</ul>
<h3 id="_31-1-showing-a-list-of-top-10-stocks" tabindex="-1"><a class="header-anchor" href="#_31-1-showing-a-list-of-top-10-stocks"><span>31.1 Showing a list of top 10 stocks</span></a></h3>
<p>The idea is after the multi, also get the listing of the top 10. And by memory cache it.</p>
<ul>
<li>[ ] Fix the storage into a map instead of a list.</li>
</ul>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code><span class="token class-name">Map</span><span class="token generics"><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token keyword">dynamic</span><span class="token punctuation">></span></span> showStockList <span class="token operator">=</span> <span class="token punctuation">{</span><span class="token punctuation">}</span><span class="token punctuation">;</span> <span class="token comment">//The stocks being shown in the watchlist</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>Whereas you want to save it there.</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"checking the first 10 out of "</span></span> <span class="token operator">+</span> ticketNames<span class="token punctuation">.</span>length<span class="token punctuation">.</span><span class="token function">toString</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">final</span> stocksToLookup <span class="token operator">=</span> ticketNames<span class="token punctuation">.</span><span class="token function">sublist</span><span class="token punctuation">(</span><span class="token number">0</span><span class="token punctuation">,</span> <span class="token number">10</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"Researching multiple:"</span></span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token function">print</span><span class="token punctuation">(</span>stocksToLookup<span class="token punctuation">)</span><span class="token punctuation">;</span>
    showStockData <span class="token operator">=</span> <span class="token keyword">await</span> <span class="token function">researchMultiple</span><span class="token punctuation">(</span>stocksToLookup<span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>And now what we want to isshow it on the screen after logging them.</p>
<p>For that we need to await the population first:</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>  <span class="token class-name">Future</span> <span class="token function">populateAllStocksScreenData</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token keyword">async</span> <span class="token punctuation">{</span>
    <span class="token comment">// get the top 10 stocks from ticket names and request api to include their data on them.</span>

    <span class="token keyword">if</span> <span class="token punctuation">(</span>_myBox<span class="token punctuation">.</span><span class="token keyword">get</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"ticketNames"</span></span><span class="token punctuation">)</span> <span class="token operator">==</span> <span class="token keyword">null</span> <span class="token operator">||</span>
        _myBox<span class="token punctuation">.</span><span class="token keyword">get</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"ticketNames"</span></span><span class="token punctuation">)</span><span class="token punctuation">.</span>isEmpty<span class="token punctuation">)</span> <span class="token punctuation">{</span>
      <span class="token keyword">await</span> <span class="token function">getStockNames</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
      ticketNames <span class="token operator">=</span> _myBox<span class="token punctuation">.</span><span class="token keyword">get</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"ticketNames"</span></span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"checking the first 10 out of "</span></span> <span class="token operator">+</span> ticketNames<span class="token punctuation">.</span>length<span class="token punctuation">.</span><span class="token function">toString</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">final</span> stocksToLookup <span class="token operator">=</span> ticketNames<span class="token punctuation">.</span><span class="token function">sublist</span><span class="token punctuation">(</span><span class="token number">0</span><span class="token punctuation">,</span> <span class="token number">10</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token function">print</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"Researching multiple:"</span></span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token function">print</span><span class="token punctuation">(</span>stocksToLookup<span class="token punctuation">)</span><span class="token punctuation">;</span>
    showStockData <span class="token operator">=</span> <span class="token keyword">await</span> <span class="token function">researchMultiple</span><span class="token punctuation">(</span>stocksToLookup<span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token keyword">return</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><blockquote>
<p>So I am converting it inot a future method.</p>
</blockquote>
<p>The weird thing is that it requries a specific format but am I even respecting that on watchlist?</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code><span class="token class-name">List</span><span class="token generics"><span class="token punctuation">&lt;</span><span class="token class-name">Map</span><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token keyword">dynamic</span><span class="token punctuation">></span><span class="token punctuation">></span></span> <span class="token function">convertToListingFormat</span><span class="token punctuation">(</span>
    <span class="token class-name">Map</span><span class="token generics"><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token class-name">Map</span><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token keyword">dynamic</span><span class="token punctuation">></span><span class="token punctuation">></span></span> inputMap<span class="token punctuation">)</span> <span class="token punctuation">{</span>
  <span class="token class-name">List</span><span class="token generics"><span class="token punctuation">&lt;</span><span class="token class-name">Map</span><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token keyword">dynamic</span><span class="token punctuation">></span><span class="token punctuation">></span></span> outputList <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>It seems that it was actually the hardcoded thats why. But now I chnged it</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code><span class="token class-name">List</span><span class="token generics"><span class="token punctuation">&lt;</span><span class="token class-name">Map</span><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token keyword">dynamic</span><span class="token punctuation">></span><span class="token punctuation">></span></span> <span class="token function">convertToListingFormat</span><span class="token punctuation">(</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div></div></div><p>With that we have:</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>  <span class="token class-name">Future</span><span class="token generics"><span class="token punctuation">&lt;</span><span class="token class-name">List</span><span class="token punctuation">&lt;</span><span class="token class-name">Map</span><span class="token punctuation">&lt;</span><span class="token class-name">String</span><span class="token punctuation">,</span> <span class="token keyword">dynamic</span><span class="token punctuation">></span><span class="token punctuation">></span><span class="token punctuation">></span></span> <span class="token function">getShowStockAsList</span><span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token keyword">async</span> <span class="token punctuation">{</span>
    <span class="token keyword">if</span> <span class="token punctuation">(</span>showStockData<span class="token punctuation">.</span>isEmpty<span class="token punctuation">)</span> <span class="token punctuation">{</span>
      <span class="token keyword">await</span> <span class="token function">populateAllStocksScreenData</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
    <span class="token keyword">return</span> <span class="token function">convertToListingFormat</span><span class="token punctuation">(</span>showStockData<span class="token punctuation">)</span><span class="token punctuation">;</span>
  <span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Which now shoudld be used as following:</p>
<p>So great now we have th stocks.</p>
</div></template>


