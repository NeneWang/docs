<template><div><h2 id="_1-fri" tabindex="-1"><a class="header-anchor" href="#_1-fri"><span>1 Fri</span></a></h2>
<h3 id="_1-todo" tabindex="-1"><a class="header-anchor" href="#_1-todo"><span>1.todo</span></a></h3>
<ul>
<li>[ ] 1.1 Fix The SlC broken page.</li>
</ul>
<p>Tried fixing but still:</p>
<div class="language-php line-numbers-mode" data-ext="php" data-title="php"><pre v-pre class="language-php"><code><span class="token php language-php"><span class="token delimiter important">&lt;?php</span>

<span class="token keyword">namespace</span> <span class="token package">TCG<span class="token punctuation">\</span>Voyager<span class="token punctuation">\</span>Models</span><span class="token punctuation">;</span>

<span class="token keyword">use</span> <span class="token package">Illuminate<span class="token punctuation">\</span>Database<span class="token punctuation">\</span>Eloquent<span class="token punctuation">\</span>Model</span><span class="token punctuation">;</span>
<span class="token keyword">use</span> <span class="token package">Illuminate<span class="token punctuation">\</span>Support<span class="token punctuation">\</span>Facades<span class="token punctuation">\</span>Route</span><span class="token punctuation">;</span>
<span class="token keyword">use</span> <span class="token package">TCG<span class="token punctuation">\</span>Voyager<span class="token punctuation">\</span>Facades<span class="token punctuation">\</span>Voyager</span><span class="token punctuation">;</span>
<span class="token keyword">use</span> <span class="token package">TCG<span class="token punctuation">\</span>Voyager<span class="token punctuation">\</span>Traits<span class="token punctuation">\</span>Translatable</span><span class="token punctuation">;</span>

<span class="token keyword">class</span> <span class="token class-name-definition class-name">MenuItem</span> <span class="token keyword">extends</span> <span class="token class-name">Model</span>
<span class="token punctuation">{</span>
    <span class="token keyword">use</span> <span class="token package">Translatable</span><span class="token punctuation">;</span>

    <span class="token keyword">protected</span> <span class="token variable">$translatorMethods</span> <span class="token operator">=</span> <span class="token punctuation">[</span>
        <span class="token string single-quoted-string">'link'</span> <span class="token operator">=></span> <span class="token string single-quoted-string">'translatorLink'</span><span class="token punctuation">,</span>
    <span class="token punctuation">]</span><span class="token punctuation">;</span>

    <span class="token keyword">protected</span> <span class="token variable">$table</span> <span class="token operator">=</span> <span class="token string single-quoted-string">'menu_items'</span><span class="token punctuation">;</span>

    <span class="token keyword">protected</span> <span class="token variable">$guarded</span> <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>

    <span class="token keyword">protected</span> <span class="token variable">$translatable</span> <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token string single-quoted-string">'title'</span><span class="token punctuation">]</span><span class="token punctuation">;</span>

    <span class="token keyword">public</span> <span class="token keyword">static</span> <span class="token keyword">function</span> <span class="token function-definition function">boot</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword static-context">parent</span><span class="token operator">::</span><span class="token function">boot</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

        <span class="token keyword static-context">static</span><span class="token operator">::</span><span class="token function">created</span><span class="token punctuation">(</span><span class="token keyword">function</span> <span class="token punctuation">(</span><span class="token variable">$model</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$model</span><span class="token operator">-></span><span class="token property">menu</span><span class="token operator">-></span><span class="token function">removeMenuFromCache</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

        <span class="token keyword static-context">static</span><span class="token operator">::</span><span class="token function">saved</span><span class="token punctuation">(</span><span class="token keyword">function</span> <span class="token punctuation">(</span><span class="token variable">$model</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$model</span><span class="token operator">-></span><span class="token property">menu</span><span class="token operator">-></span><span class="token function">removeMenuFromCache</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

        <span class="token keyword static-context">static</span><span class="token operator">::</span><span class="token function">deleted</span><span class="token punctuation">(</span><span class="token keyword">function</span> <span class="token punctuation">(</span><span class="token variable">$model</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$model</span><span class="token operator">-></span><span class="token property">menu</span><span class="token operator">-></span><span class="token function">removeMenuFromCache</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">children</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">return</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token function">hasMany</span><span class="token punctuation">(</span><span class="token class-name static-context">Voyager</span><span class="token operator">::</span><span class="token function">modelClass</span><span class="token punctuation">(</span><span class="token string single-quoted-string">'MenuItem'</span><span class="token punctuation">)</span><span class="token punctuation">,</span> <span class="token string single-quoted-string">'parent_id'</span><span class="token punctuation">)</span>
            <span class="token operator">-></span><span class="token function">with</span><span class="token punctuation">(</span><span class="token string single-quoted-string">'children'</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">menu</span><span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">return</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token function">belongsTo</span><span class="token punctuation">(</span><span class="token class-name static-context">Voyager</span><span class="token operator">::</span><span class="token function">modelClass</span><span class="token punctuation">(</span><span class="token string single-quoted-string">'Menu'</span><span class="token punctuation">)</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">link</span><span class="token punctuation">(</span><span class="token variable">$absolute</span> <span class="token operator">=</span> <span class="token constant boolean">false</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">return</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token function">prepareLink</span><span class="token punctuation">(</span><span class="token variable">$absolute</span><span class="token punctuation">,</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token property">route</span><span class="token punctuation">,</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token property">parameters</span><span class="token punctuation">,</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token property">url</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">translatorLink</span><span class="token punctuation">(</span><span class="token variable">$translator</span><span class="token punctuation">,</span> <span class="token variable">$absolute</span> <span class="token operator">=</span> <span class="token constant boolean">false</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">return</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token function">prepareLink</span><span class="token punctuation">(</span><span class="token variable">$absolute</span><span class="token punctuation">,</span> <span class="token variable">$translator</span><span class="token operator">-></span><span class="token property">route</span><span class="token punctuation">,</span> <span class="token variable">$translator</span><span class="token operator">-></span><span class="token property">parameters</span><span class="token punctuation">,</span> <span class="token variable">$translator</span><span class="token operator">-></span><span class="token property">url</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">protected</span> <span class="token keyword">function</span> <span class="token function-definition function">prepareLink</span><span class="token punctuation">(</span><span class="token variable">$absolute</span><span class="token punctuation">,</span> <span class="token variable">$route</span><span class="token punctuation">,</span> <span class="token variable">$parameters</span><span class="token punctuation">,</span> <span class="token variable">$url</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token function">is_null</span><span class="token punctuation">(</span><span class="token variable">$parameters</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$parameters</span> <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token function">is_string</span><span class="token punctuation">(</span><span class="token variable">$parameters</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$parameters</span> <span class="token operator">=</span> <span class="token function">json_decode</span><span class="token punctuation">(</span><span class="token variable">$parameters</span><span class="token punctuation">,</span> <span class="token constant boolean">true</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span> <span class="token keyword">elseif</span> <span class="token punctuation">(</span><span class="token function">is_array</span><span class="token punctuation">(</span><span class="token variable">$parameters</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$parameters</span> <span class="token operator">=</span> <span class="token variable">$parameters</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span> <span class="token keyword">elseif</span> <span class="token punctuation">(</span><span class="token function">is_object</span><span class="token punctuation">(</span><span class="token variable">$parameters</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$parameters</span> <span class="token operator">=</span> <span class="token function">json_decode</span><span class="token punctuation">(</span><span class="token function">json_encode</span><span class="token punctuation">(</span><span class="token variable">$parameters</span><span class="token punctuation">)</span><span class="token punctuation">,</span> <span class="token constant boolean">true</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token operator">!</span><span class="token function">is_null</span><span class="token punctuation">(</span><span class="token variable">$route</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token operator">!</span><span class="token class-name static-context">Route</span><span class="token operator">::</span><span class="token function">has</span><span class="token punctuation">(</span><span class="token variable">$route</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
                <span class="token keyword">return</span> <span class="token string single-quoted-string">'#'</span><span class="token punctuation">;</span>
            <span class="token punctuation">}</span>

            <span class="token keyword">return</span> <span class="token function">route</span><span class="token punctuation">(</span><span class="token variable">$route</span><span class="token punctuation">,</span> <span class="token variable">$parameters</span><span class="token punctuation">,</span> <span class="token variable">$absolute</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token variable">$absolute</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token keyword">return</span> <span class="token function">url</span><span class="token punctuation">(</span><span class="token variable">$url</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token keyword">return</span> <span class="token variable">$url</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">getParametersAttribute</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">)</span>
<span class="token punctuation">{</span>
    <span class="token keyword">return</span> <span class="token variable">$value</span> <span class="token operator">?</span> <span class="token function">json_decode</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">,</span> <span class="token constant boolean">true</span><span class="token punctuation">)</span> <span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">;</span>
<span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">setParametersAttribute</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token function">is_array</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$value</span> <span class="token operator">=</span> <span class="token function">json_encode</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token variable">$this</span><span class="token operator">-></span><span class="token property">attributes</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'parameters'</span><span class="token punctuation">]</span> <span class="token operator">=</span> <span class="token variable">$value</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">setUrlAttribute</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token function">is_null</span><span class="token punctuation">(</span><span class="token variable">$value</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$value</span> <span class="token operator">=</span> <span class="token string single-quoted-string">''</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token variable">$this</span><span class="token operator">-></span><span class="token property">attributes</span><span class="token punctuation">[</span><span class="token string single-quoted-string">'url'</span><span class="token punctuation">]</span> <span class="token operator">=</span> <span class="token variable">$value</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token doc-comment comment">/**
     * Return the Highest Order Menu Item.
     *
     * <span class="token keyword">@param</span> <span class="token class-name">number</span> <span class="token parameter">$parent</span> (Optional) Parent id. Default null
     *
     * <span class="token keyword">@return</span> <span class="token class-name">number</span> Order number
     */</span>
    <span class="token keyword">public</span> <span class="token keyword">function</span> <span class="token function-definition function">highestOrderMenuItem</span><span class="token punctuation">(</span><span class="token variable">$parent</span> <span class="token operator">=</span> <span class="token constant">null</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token variable">$order</span> <span class="token operator">=</span> <span class="token number">1</span><span class="token punctuation">;</span><span class="token class-name type-declaration">S</span>

        <span class="token variable">$item</span> <span class="token operator">=</span> <span class="token variable">$this</span><span class="token operator">-></span><span class="token function">where</span><span class="token punctuation">(</span><span class="token string single-quoted-string">'parent_id'</span><span class="token punctuation">,</span> <span class="token string single-quoted-string">'='</span><span class="token punctuation">,</span> <span class="token variable">$parent</span><span class="token punctuation">)</span>
            <span class="token operator">-></span><span class="token function">orderBy</span><span class="token punctuation">(</span><span class="token string single-quoted-string">'order'</span><span class="token punctuation">,</span> <span class="token string single-quoted-string">'DESC'</span><span class="token punctuation">)</span>
            <span class="token operator">-></span><span class="token function">first</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

        <span class="token keyword">if</span> <span class="token punctuation">(</span><span class="token operator">!</span><span class="token function">is_null</span><span class="token punctuation">(</span><span class="token variable">$item</span><span class="token punctuation">)</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
            <span class="token variable">$order</span> <span class="token operator">=</span> <span class="token function">intval</span><span class="token punctuation">(</span><span class="token variable">$item</span><span class="token operator">-></span><span class="token property">order</span><span class="token punctuation">)</span> <span class="token operator">+</span> <span class="token number">1</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token keyword">return</span> <span class="token variable">$order</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</span></code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_11-mon" tabindex="-1"><a class="header-anchor" href="#_11-mon"><span>11 Mon</span></a></h2>
<h3 id="_11-todo" tabindex="-1"><a class="header-anchor" href="#_11-todo"><span>11.todo</span></a></h3>
<ul>
<li>[x] 11.1 Work on the AspNet</li>
<li>[x] 11.2 Get started with Coderhouse.</li>
</ul>
<p>I think today's coderhouse will be just basic,</p>
<h3 id="_11-1-work-on-the-aspnet" tabindex="-1"><a class="header-anchor" href="#_11-1-work-on-the-aspnet"><span>11.1 Work on the AspNet</span></a></h3>
<h2 id="_15-fri" tabindex="-1"><a class="header-anchor" href="#_15-fri"><span>15 Fri</span></a></h2>
<h3 id="_15-todo" tabindex="-1"><a class="header-anchor" href="#_15-todo"><span>15.todo</span></a></h3>
<ul>
<li>[x] 15.1 Creating a Sell Buy Button</li>
<li>[ ] 15.2 Bookmarks Show all</li>
</ul>
<h3 id="_15-1-creating-a-sell-buy-button" tabindex="-1"><a class="header-anchor" href="#_15-1-creating-a-sell-buy-button"><span>15.1 Creating a Sell Buy Button</span></a></h3>
<!-- ![](./../../img/2023-09-15-08-35-21.png) 

Now we need to match the integer

![](./../../img/2023-09-15-10-06-55.png) -->
<p>Attempting to fix:</p>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code> profit_color: Color(0xffeb5757)}
I/flutter ( 4593): _totalCostController.text
I/flutter ( 4593): Invalid input. Not a valid integer.
I/flutter ( 4593): 184.12
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>So its an actual Float:</p>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>
// Check if the input string is a valid integer
if (RegExp(r'^[0-9]+$').hasMatch(totalCostString)) {
double totalCost = double.parse(totalCostString);
print("totalCost" + totalCost.toString());
int count = (totalCost / double.parse(price)).round();

print('price: ${price.toString()}, symbol: $symbol');
purchaseMethod(symbol, count: count, price: price);
} else {
print('Invalid input. Not a valid integer.');
print(totalCostString);
}
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>
    <span class="token keyword">if</span> <span class="token punctuation">(</span>response<span class="token punctuation">.</span>statusCode <span class="token operator">==</span> <span class="token number">200</span><span class="token punctuation">)</span> <span class="token punctuation">{</span>
      <span class="token function">print</span><span class="token punctuation">(</span><span class="token string-literal"><span class="token string">"Purchase stock success"</span></span><span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token function">print</span><span class="token punctuation">(</span>response<span class="token punctuation">.</span>body<span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token keyword">await</span> <span class="token function">syncData</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
      <span class="token comment">// return;</span>
    <span class="token punctuation">}</span> <span class="token keyword">else</span> <span class="token punctuation">{</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>By the way this might be breaking the code.</p>
<ul>
<li>
<p>[x] Sell Button.</p>
</li>
<li>
<p>[x] Today I am hoping to fix SLC Website as well. Try once again, otherwise move the domain to one of your owns.</p>
</li>
<li>
<p>[ ] Get the Portfolio correctly with the count and stuff.</p>
</li>
</ul>
<div class="language-bash line-numbers-mode" data-ext="sh" data-title="sh"><pre v-pre class="language-bash"><code>85b0ecf8-4ea7-4ad2-a388-30df41971095
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>There are couples of things to do on the API:</p>
<ul>
<li>[x] Modify the the API to at least create some fake bookmarks if there is empty or &lt;= 1 bookmrks.</li>
<li>[x] Include Cash</li>
</ul>
<div class="language-json line-numbers-mode" data-ext="json" data-title="json"><pre v-pre class="language-json"><code><span class="token punctuation">{</span>
  <span class="token property">"stocks_names"</span><span class="token operator">:</span> <span class="token punctuation">[</span>
    <span class="token string">"ACN"</span><span class="token punctuation">,</span>
    <span class="token string">"AAPL"</span>
  <span class="token punctuation">]</span><span class="token punctuation">,</span>
  <span class="token property">"bookmarks_names"</span><span class="token operator">:</span> <span class="token punctuation">[</span>
    <span class="token string">"META"</span><span class="token punctuation">,</span>
    <span class="token string">"AAPL"</span>
  <span class="token punctuation">]</span><span class="token punctuation">,</span>
  <span class="token property">"bookmarks"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token property">"META"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
      <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">300.30999755859375</span><span class="token punctuation">,</span>
      <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">300.30999755859375</span><span class="token punctuation">,</span>
      <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">312</span><span class="token punctuation">,</span>
      <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">298.75</span><span class="token punctuation">,</span>
      <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">311.6099853515625</span><span class="token punctuation">,</span>
      <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">26470820</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token property">"AAPL"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
      <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">175.00999450683594</span><span class="token punctuation">,</span>
      <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">175.00999450683594</span><span class="token punctuation">,</span>
      <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">176.4949951171875</span><span class="token punctuation">,</span>
      <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">173.82000732421875</span><span class="token punctuation">,</span>
      <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">174</span><span class="token punctuation">,</span>
      <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">109062327</span>
    <span class="token punctuation">}</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token property">"stocks"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token property">"ACN"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
      <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">312.5299987792969</span><span class="token punctuation">,</span>
      <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">312.5299987792969</span><span class="token punctuation">,</span>
      <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">316.67498779296875</span><span class="token punctuation">,</span>
      <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">311.4599914550781</span><span class="token punctuation">,</span>
      <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">316.2300109863281</span><span class="token punctuation">,</span>
      <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">3334512</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token property">"AAPL"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
      <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">175.00999450683594</span><span class="token punctuation">,</span>
      <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">175.00999450683594</span><span class="token punctuation">,</span>
      <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">176.4949951171875</span><span class="token punctuation">,</span>
      <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">173.82000732421875</span><span class="token punctuation">,</span>
      <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">174</span><span class="token punctuation">,</span>
      <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">109062327</span>
    <span class="token punctuation">}</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token property">"papel_asset_worth"</span><span class="token operator">:</span> <span class="token number">837.5599822998047</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Now lets grab the API.</p>
<h3 id="_15-2-bookmarks-show-all" tabindex="-1"><a class="header-anchor" href="#_15-2-bookmarks-show-all"><span>15.2 Bookmarks Show all</span></a></h3>
<ul>
<li>[ ] Get all the bookmark.</li>
</ul>
<p>Get all the bookmark and use that data. Whereas you want to write</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>
<span class="token keyword">final</span> stockList <span class="token operator">=</span> <span class="token function">convertToListingFormat</span><span class="token punctuation">(</span>watchListPageBuildStocks<span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div></div></div><p>This is still using the data on the</p>
<div class="language-json line-numbers-mode" data-ext="json" data-title="json"><pre v-pre class="language-json"><code>const Map&lt;String<span class="token punctuation">,</span> Map&lt;String<span class="token punctuation">,</span> dynamic>> watchListPageBuildStocks = <span class="token punctuation">{</span>
  <span class="token property">"AAPL"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">184.1199951171875</span><span class="token punctuation">,</span>
    <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">184.1199951171875</span><span class="token punctuation">,</span>
    <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">184.89999389648438</span><span class="token punctuation">,</span>
    <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">179.5</span><span class="token punctuation">,</span>
    <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">179.6999969482422</span><span class="token punctuation">,</span>
    <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">52365100</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token property">"ACN"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">323.45001220703125</span><span class="token punctuation">,</span>
    <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">323.45001220703125</span><span class="token punctuation">,</span>
    <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">324.3699951171875</span><span class="token punctuation">,</span>
    <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">319.55999755859375</span><span class="token punctuation">,</span>
    <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">320.3900146484375</span><span class="token punctuation">,</span>
    <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">1525000</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">}</span>;
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-json line-numbers-mode" data-ext="json" data-title="json"><pre v-pre class="language-json"><code> <span class="token property">"stocks"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
    <span class="token property">"ACN"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
      <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">312.5299987792969</span><span class="token punctuation">,</span>
      <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">312.5299987792969</span><span class="token punctuation">,</span>
      <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">316.67498779296875</span><span class="token punctuation">,</span>
      <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">311.4599914550781</span><span class="token punctuation">,</span>
      <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">316.2300109863281</span><span class="token punctuation">,</span>
      <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">3334512</span>
    <span class="token punctuation">}</span><span class="token punctuation">,</span>
    <span class="token property">"AAPL"</span><span class="token operator">:</span> <span class="token punctuation">{</span>
      <span class="token property">"Adj Close"</span><span class="token operator">:</span> <span class="token number">175.00999450683594</span><span class="token punctuation">,</span>
      <span class="token property">"Close"</span><span class="token operator">:</span> <span class="token number">175.00999450683594</span><span class="token punctuation">,</span>
      <span class="token property">"High"</span><span class="token operator">:</span> <span class="token number">176.4949951171875</span><span class="token punctuation">,</span>
      <span class="token property">"Low"</span><span class="token operator">:</span> <span class="token number">173.82000732421875</span><span class="token punctuation">,</span>
      <span class="token property">"Open"</span><span class="token operator">:</span> <span class="token number">174</span><span class="token punctuation">,</span>
      <span class="token property">"Volume"</span><span class="token operator">:</span> <span class="token number">109062327</span>
    <span class="token punctuation">}</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>So lets see 175:
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>WHERE you have the kson like this, now the question is if you have the data like that? On the backend?</p>
<p>Here being how</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code><span class="token function">print</span><span class="token punctuation">(</span>responseData<span class="token punctuation">)</span><span class="token punctuation">;</span>
userBookmarkPrices <span class="token operator">=</span> responseData<span class="token punctuation">[</span><span class="token string-literal"><span class="token string">"bookmarks"</span></span><span class="token punctuation">]</span><span class="token punctuation">;</span>
userStockPrices <span class="token operator">=</span> responseData<span class="token punctuation">[</span><span class="token string-literal"><span class="token string">"stocks"</span></span><span class="token punctuation">]</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Now lets see if thats on the dashboard?</p>
<p>Show Cash Left:</p>
<ul>
<li>[x] Show the cash left when buying.</li>
<li>[x] Create a Force Reload.</li>
</ul>
<h3 id="fix-the-problem-with-removign-into-stateful" tabindex="-1"><a class="header-anchor" href="#fix-the-problem-with-removign-into-stateful"><span>Fix the problem with removign into stateful</span></a></h3>
<p>The solution was having</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p>In the declaration fothe stateful</p>
<h3 id="create-a-dictionary-to-store-the-formatted-data" tabindex="-1"><a class="header-anchor" href="#create-a-dictionary-to-store-the-formatted-data"><span>Create a dictionary to store the formatted data</span></a></h3>
<pre><code>formatted_data_key = {}
print(ticket_data.columns.levels[0])
for column in ticket_data.columns.levels[0]:
    column_data = {}
    for ticker in selected_ticket_names:
        ticker_value = list(ticket_data[(column, ticker)].to_dict().values())[0]
        column_data[ticker] = ticker_value 
        # if value is none or nan, then skip
        if(ticker_value is None or ticker_value is pd.NaT or pd.isna(ticker_value)):
            print(&quot;ticker_value is None&quot;, ticker_value, ticker, column)
            continue
        if(ticker not in formatted_data_key):
            formatted_data_key[ticker] = {}
        formatted_data_key[ticker][column] = ticker_value 
print(formatted_data_key)
</code></pre>
<h3 id="creating-a-search-button-for-the-stocks-around" tabindex="-1"><a class="header-anchor" href="#creating-a-search-button-for-the-stocks-around"><span>Creating a search button for the stocks around.</span></a></h3>
<p>For now it can just be a list filter.</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code><span class="token class-name">Get</span><span class="token punctuation">.</span><span class="token function">snackbar</span><span class="token punctuation">(</span>
    <span class="token string-literal"><span class="token string">"Refreshed"</span></span><span class="token punctuation">,</span>
    <span class="token string-literal"><span class="token string">"Portfolio refreshed"</span></span><span class="token punctuation">,</span>
    backgroundColor<span class="token punctuation">:</span> green219653<span class="token punctuation">,</span>
    colorText<span class="token punctuation">:</span> white<span class="token punctuation">,</span>
    <span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_16-sat" tabindex="-1"><a class="header-anchor" href="#_16-sat"><span>16 Sat</span></a></h2>
<h3 id="creating-the-login" tabindex="-1"><a class="header-anchor" href="#creating-the-login"><span>Creating the login</span></a></h3>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
<span class="token decorator annotation punctuation">@router<span class="token punctuation">.</span>post</span><span class="token punctuation">(</span><span class="token string">'/get_highlight_today'</span><span class="token punctuation">,</span> status_code<span class="token operator">=</span><span class="token number">200</span><span class="token punctuation">)</span>
<span class="token keyword">async</span> <span class="token keyword">def</span> <span class="token function">get_user_report</span><span class="token punctuation">(</span>
    player_id<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">,</span>
    selected_ticket_names<span class="token punctuation">:</span> List<span class="token punctuation">[</span><span class="token builtin">str</span><span class="token punctuation">]</span> <span class="token operator">=</span> Query<span class="token punctuation">(</span><span class="token punctuation">[</span><span class="token punctuation">]</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""Return all data including stocks, bookmarks and papel asset worth
    Try with player_id: 85b0ecf8-4ea7-4ad2-a388-30df41971095

    Args:
        player_id (str): The user id of the user
        selected_ticket_names (List[str]): The ticket names of the bookmarked ticket names

    Returns a dict of:
        stocks: List[{'stock_name': str, 'stock_price': float}]
        bookmarks: List[{'stock_name': str, 'stock_price': float}]
        papel_asset_worth: float
    """</span>
    assets <span class="token operator">=</span> <span class="token keyword">await</span> getAssets<span class="token punctuation">(</span>player_id<span class="token operator">=</span>player_id<span class="token punctuation">)</span>
    assets_name <span class="token operator">=</span> <span class="token punctuation">[</span>asset<span class="token punctuation">.</span>symbol <span class="token keyword">for</span> asset <span class="token keyword">in</span> assets<span class="token punctuation">]</span>
    

    <span class="token keyword">if</span><span class="token punctuation">(</span><span class="token builtin">len</span><span class="token punctuation">(</span>selected_ticket_names<span class="token punctuation">)</span> <span class="token operator">&lt;=</span> <span class="token number">1</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
        <span class="token keyword">for</span> stock <span class="token keyword">in</span> <span class="token punctuation">[</span><span class="token string">"TSLA"</span><span class="token punctuation">,</span> <span class="token string">"ABNB"</span><span class="token punctuation">,</span> <span class="token string">"AMD"</span><span class="token punctuation">]</span><span class="token punctuation">:</span>
            <span class="token keyword">if</span><span class="token punctuation">(</span>stock <span class="token keyword">not</span> <span class="token keyword">in</span> selected_ticket_names<span class="token punctuation">)</span><span class="token punctuation">:</span>
                selected_ticket_names<span class="token punctuation">.</span>append<span class="token punctuation">(</span>stock<span class="token punctuation">)</span>
    
    selected_ticket_data <span class="token operator">=</span> get_stock_data_multiple<span class="token punctuation">(</span>selected_ticket_names<span class="token punctuation">)</span>

    assets_data <span class="token operator">=</span> get_stock_data_multiple<span class="token punctuation">(</span>assets_name<span class="token punctuation">)</span>
    player_selected <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>Player<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>Player<span class="token punctuation">.</span><span class="token builtin">id</span> <span class="token operator">==</span> player_id<span class="token punctuation">)</span><span class="token punctuation">.</span>one_or_none<span class="token punctuation">(</span><span class="token punctuation">)</span>

    user_selected <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>Users<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>Users<span class="token punctuation">.</span><span class="token builtin">id</span> <span class="token operator">==</span> player_selected<span class="token punctuation">.</span>user_id<span class="token punctuation">)</span><span class="token punctuation">.</span>one_or_none<span class="token punctuation">(</span><span class="token punctuation">)</span>

    <span class="token comment"># Calculate the papel asset worth</span>
    papel_asset_worth <span class="token operator">=</span> <span class="token number">0</span>
    <span class="token keyword">for</span> asset <span class="token keyword">in</span> assets<span class="token punctuation">:</span>
        stock_price <span class="token operator">=</span> assets_data<span class="token punctuation">[</span>asset<span class="token punctuation">.</span>symbol<span class="token punctuation">]</span><span class="token punctuation">[</span><span class="token string">'Close'</span><span class="token punctuation">]</span>
        papel_asset_worth <span class="token operator">+=</span> stock_price <span class="token operator">*</span> asset<span class="token punctuation">.</span>count

    <span class="token keyword">print</span><span class="token punctuation">(</span><span class="token string">"assets"</span><span class="token punctuation">,</span> assets<span class="token punctuation">)</span>
    <span class="token keyword">return</span> <span class="token punctuation">{</span>
        <span class="token string">'stocks_names'</span><span class="token punctuation">:</span> assets_name<span class="token punctuation">,</span>
        <span class="token string">'bookmarks_names'</span><span class="token punctuation">:</span> selected_ticket_names<span class="token punctuation">,</span>
        <span class="token string">"bookmarks"</span><span class="token punctuation">:</span> selected_ticket_data<span class="token punctuation">,</span>
        <span class="token string">"stocks"</span><span class="token punctuation">:</span> assets_data<span class="token punctuation">,</span>
        <span class="token string">'papel_asset_worth'</span><span class="token punctuation">:</span> papel_asset_worth<span class="token punctuation">,</span>
        <span class="token string">'user_cash'</span><span class="token punctuation">:</span> player_selected<span class="token punctuation">.</span>cash<span class="token punctuation">,</span>
        <span class="token string">'user_total_worth'</span><span class="token punctuation">:</span> player_selected<span class="token punctuation">.</span>cash <span class="token operator">+</span> papel_asset_worth<span class="token punctuation">,</span>
        <span class="token string">'player_id'</span><span class="token punctuation">:</span> player_id<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token punctuation">,</span>
        <span class="token string">'competition_id'</span><span class="token punctuation">:</span> player_selected<span class="token punctuation">.</span>competition_id<span class="token punctuation">,</span>
        <span class="token string">'user_id'</span><span class="token punctuation">:</span> user_selected<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token punctuation">,</span>
        <span class="token string">'user_name'</span><span class="token punctuation">:</span> user_selected<span class="token punctuation">.</span>name<span class="token punctuation">,</span>
        <span class="token string">'user_email'</span><span class="token punctuation">:</span> user_selected<span class="token punctuation">.</span>email
    <span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Now once it has been deployed, my guess:</p>
<ol>
<li>Create the api for logging in.
<ol>
<li>This could be just a verification of the email and password.</li>
<li>It would return the player_id. {As well as the whole data for the day report.}</li>
<li>There should be a log off button to log off.</li>
</ol>
</li>
<li>Or choose to use the demo player.</li>
<li>Also create the API for resetting</li>
<li>As well as logging in and etc.</li>
<li>Signing Up
<ol>
<li>Ability to register new emails</li>
<li>By default joints you to the recommended competition.</li>
<li>Ass well as a pass code</li>
</ol>
</li>
</ol>
<h2 id="_16-sat-1" tabindex="-1"><a class="header-anchor" href="#_16-sat-1"><span>16 Sat</span></a></h2>
<ul>
<li>[x] 16.1 Create the API for logging in</li>
</ul>
<h3 id="_16-1-create-the-api-for-logging-in" tabindex="-1"><a class="header-anchor" href="#_16-1-create-the-api-for-logging-in"><span>16.1 Create the API for logging in.</span></a></h3>
<ol>
<li>[x] This could be just a verification of the email and password.</li>
<li>[x] It would return the player_id. {As well as the whole data for the day report.}</li>
<li>[ ] There should be a log off button to log off.</li>
</ol>
<p>Had some errors, but it was because of the wrong input</p>
<ul>
<li>SO tried using cypher to check, and that was it!</li>
</ul>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code>
<span class="token keyword">def</span> <span class="token function">caesar_cipher</span><span class="token punctuation">(</span>text<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">,</span> shift<span class="token punctuation">:</span> <span class="token builtin">int</span> <span class="token operator">=</span> <span class="token number">3</span><span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">str</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""Caesar cipher implementation.

    Args:
        text (str): text to be encrypted
        shift (int, optional): shift amount. Defaults to 3.

    Returns:
        str: encrypted text
    """</span>
    cipher <span class="token operator">=</span> <span class="token string">""</span>
    <span class="token keyword">for</span> char <span class="token keyword">in</span> text<span class="token punctuation">:</span>
        char_code <span class="token operator">=</span> <span class="token builtin">ord</span><span class="token punctuation">(</span>char<span class="token punctuation">)</span>
        shifted_char_code <span class="token operator">=</span> <span class="token punctuation">(</span>char_code <span class="token operator">+</span> shift<span class="token punctuation">)</span> <span class="token operator">%</span> <span class="token number">128</span>
        cipher <span class="token operator">+=</span> <span class="token builtin">chr</span><span class="token punctuation">(</span>shifted_char_code<span class="token punctuation">)</span>
    <span class="token keyword">return</span> cipher

<span class="token keyword">def</span> <span class="token function">get_hashed_password</span><span class="token punctuation">(</span>password<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">str</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> caesar_cipher<span class="token punctuation">(</span>password<span class="token punctuation">)</span>


<span class="token keyword">def</span> <span class="token function">verify_password</span><span class="token punctuation">(</span>password<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">,</span> hashed_pass<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">bool</span><span class="token punctuation">:</span>
    <span class="token keyword">print</span><span class="token punctuation">(</span><span class="token string">"comparing"</span><span class="token punctuation">,</span> caesar_cipher<span class="token punctuation">(</span>password<span class="token punctuation">)</span><span class="token punctuation">,</span> hashed_pass<span class="token punctuation">)</span>
    <span class="token keyword">return</span> caesar_cipher<span class="token punctuation">(</span>password<span class="token punctuation">)</span> <span class="token operator">==</span> hashed_pass
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Now with the actual correct passwd + registration logic:</p>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code><span class="token keyword">import</span> re
<span class="token keyword">from</span> bcrypt <span class="token keyword">import</span> checkpw<span class="token punctuation">,</span> gensalt<span class="token punctuation">,</span> hashpw
<span class="token keyword">from</span> pydantic <span class="token keyword">import</span> BaseModel
<span class="token keyword">from</span> pyparsing <span class="token keyword">import</span> Optional
<span class="token keyword">import</span> uvicorn
<span class="token keyword">from</span> fastapi <span class="token keyword">import</span> FastAPI<span class="token punctuation">,</span> Depends<span class="token punctuation">,</span> File<span class="token punctuation">,</span> UploadFile<span class="token punctuation">,</span> Path<span class="token punctuation">,</span> status<span class="token punctuation">,</span> BackgroundTasks<span class="token punctuation">,</span> HTTPException

<span class="token keyword">from</span> passlib<span class="token punctuation">.</span>context <span class="token keyword">import</span> CryptContext
<span class="token comment"># from http.client import HTTPException</span>
<span class="token keyword">from</span> fastapi<span class="token punctuation">.</span>encoders <span class="token keyword">import</span> jsonable_encoder
<span class="token keyword">from</span> fastapi<span class="token punctuation">.</span>middleware<span class="token punctuation">.</span>cors <span class="token keyword">import</span> CORSMiddleware
<span class="token keyword">from</span> database <span class="token keyword">import</span> SessionLocal<span class="token punctuation">,</span> engine
<span class="token keyword">import</span> models
<span class="token keyword">import</span> os<span class="token punctuation">,</span> json
<span class="token keyword">from</span> dotenv <span class="token keyword">import</span> load_dotenv
<span class="token keyword">from</span> routes <span class="token keyword">import</span> utils<span class="token punctuation">,</span> api

<span class="token keyword">import</span> models

<span class="token keyword">from</span> sqlalchemy<span class="token punctuation">.</span>ext<span class="token punctuation">.</span>declarative <span class="token keyword">import</span> declarative_base
<span class="token keyword">from</span> fastapi<span class="token punctuation">.</span>openapi<span class="token punctuation">.</span>docs <span class="token keyword">import</span> get_swagger_ui_html
<span class="token keyword">from</span> models <span class="token keyword">import</span> Users

<span class="token keyword">import</span> re

<span class="token keyword">def</span> <span class="token function">validateEmail</span><span class="token punctuation">(</span>email<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""Returns True if the email is valid, False otherwise.

    Args:
        email (str): email string

    Returns:
        bool: Whether the email is valid or not
    """</span>
    <span class="token keyword">if</span> <span class="token builtin">len</span><span class="token punctuation">(</span>email<span class="token punctuation">)</span> <span class="token operator">></span> <span class="token number">3</span><span class="token punctuation">:</span>
        <span class="token keyword">if</span> re<span class="token punctuation">.</span><span class="token keyword">match</span><span class="token punctuation">(</span><span class="token string">r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"</span><span class="token punctuation">,</span> email<span class="token punctuation">)</span> <span class="token keyword">is</span> <span class="token keyword">not</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
            <span class="token keyword">return</span> <span class="token boolean">True</span>
    <span class="token keyword">return</span> <span class="token boolean">False</span>

db <span class="token operator">=</span> SessionLocal<span class="token punctuation">(</span><span class="token punctuation">)</span>




load_dotenv<span class="token punctuation">(</span><span class="token punctuation">)</span>

dotusername <span class="token operator">=</span> os<span class="token punctuation">.</span>getenv<span class="token punctuation">(</span><span class="token string">"USER"</span><span class="token punctuation">)</span>

app <span class="token operator">=</span> FastAPI<span class="token punctuation">(</span>
    docs_url<span class="token operator">=</span><span class="token boolean">None</span><span class="token punctuation">,</span>
    title<span class="token operator">=</span><span class="token string">"DD API"</span><span class="token punctuation">,</span>
    description<span class="token operator">=</span><span class="token string">'Bla description'</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span>

app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>models<span class="token punctuation">.</span>playerRoutes<span class="token punctuation">)</span>
app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>models<span class="token punctuation">.</span>userRoutes<span class="token punctuation">)</span>
app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>models<span class="token punctuation">.</span>assetRoutes<span class="token punctuation">)</span>
app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>models<span class="token punctuation">.</span>competitionRoutes<span class="token punctuation">)</span>
app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>models<span class="token punctuation">.</span>transactionRoutes<span class="token punctuation">)</span>

app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>api<span class="token punctuation">.</span>router<span class="token punctuation">)</span>







<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>get</span><span class="token punctuation">(</span><span class="token string">"/docs"</span><span class="token punctuation">,</span> include_in_schema<span class="token operator">=</span><span class="token boolean">False</span><span class="token punctuation">)</span>
<span class="token keyword">async</span> <span class="token keyword">def</span> <span class="token function">swagger_ui_html</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> get_swagger_ui_html<span class="token punctuation">(</span>
        openapi_url<span class="token operator">=</span><span class="token string">"/openapi.json"</span><span class="token punctuation">,</span>
        title<span class="token operator">=</span><span class="token string">"DD API"</span><span class="token punctuation">,</span>
    <span class="token punctuation">)</span>

Base <span class="token operator">=</span> declarative_base<span class="token punctuation">(</span><span class="token punctuation">)</span>

<span class="token keyword">def</span> <span class="token function">get_db</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    session <span class="token operator">=</span> SessionLocal<span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token keyword">try</span><span class="token punctuation">:</span>
        <span class="token keyword">yield</span> session
        session<span class="token punctuation">.</span>commit<span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token keyword">finally</span><span class="token punctuation">:</span>
        session<span class="token punctuation">.</span>close<span class="token punctuation">(</span><span class="token punctuation">)</span>


origins <span class="token operator">=</span> <span class="token punctuation">[</span><span class="token string">"*"</span><span class="token punctuation">]</span>
app<span class="token punctuation">.</span>add_middleware<span class="token punctuation">(</span>
    CORSMiddleware<span class="token punctuation">,</span>
    allow_origins<span class="token operator">=</span>origins<span class="token punctuation">,</span>
    allow_credentials<span class="token operator">=</span><span class="token boolean">True</span><span class="token punctuation">,</span>
    allow_methods<span class="token operator">=</span><span class="token punctuation">[</span><span class="token string">"*"</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
    allow_headers<span class="token operator">=</span><span class="token punctuation">[</span><span class="token string">"*"</span><span class="token punctuation">]</span><span class="token punctuation">,</span>
<span class="token punctuation">)</span>

app<span class="token punctuation">.</span>include_router<span class="token punctuation">(</span>utils<span class="token punctuation">.</span>router<span class="token punctuation">)</span>

models<span class="token punctuation">.</span>Base<span class="token punctuation">.</span>metadata<span class="token punctuation">.</span>create_all<span class="token punctuation">(</span>bind<span class="token operator">=</span>engine<span class="token punctuation">)</span>

<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>get</span><span class="token punctuation">(</span><span class="token string">"/"</span><span class="token punctuation">)</span>
<span class="token keyword">def</span> <span class="token function">index</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> <span class="token punctuation">{</span> <span class="token string">"message"</span><span class="token punctuation">:</span> <span class="token string">"hello world This is the Another update version"</span><span class="token punctuation">}</span>

<span class="token keyword">if</span> __name__ <span class="token operator">==</span> <span class="token string">"__main__"</span><span class="token punctuation">:</span>
    uvicorn<span class="token punctuation">.</span>run<span class="token punctuation">(</span>app<span class="token punctuation">,</span> port<span class="token operator">=</span><span class="token number">8080</span><span class="token punctuation">,</span> host<span class="token operator">=</span><span class="token string">'0.0.0.0'</span><span class="token punctuation">)</span>



<span class="token comment"># pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")</span>

<span class="token comment"># def hash_password(password: str):</span>
<span class="token comment">#     return pwd_context.hash(password)</span>


password_context <span class="token operator">=</span> CryptContext<span class="token punctuation">(</span>schemes<span class="token operator">=</span><span class="token punctuation">[</span><span class="token string">"bcrypt"</span><span class="token punctuation">]</span><span class="token punctuation">,</span> deprecated<span class="token operator">=</span><span class="token string">"auto"</span><span class="token punctuation">)</span>

<span class="token keyword">def</span> <span class="token function">get_hashed_password</span><span class="token punctuation">(</span>password<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">str</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> password_context<span class="token punctuation">.</span><span class="token builtin">hash</span><span class="token punctuation">(</span>password<span class="token punctuation">)</span>


<span class="token keyword">def</span> <span class="token function">verify_password</span><span class="token punctuation">(</span>password<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">,</span> hashed_pass<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span> <span class="token operator">-</span><span class="token operator">></span> <span class="token builtin">bool</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> password_context<span class="token punctuation">.</span>verify<span class="token punctuation">(</span>password<span class="token punctuation">,</span> hashed_pass<span class="token punctuation">)</span>



<span class="token keyword">class</span> <span class="token class-name">UserLoginFormat</span><span class="token punctuation">(</span>BaseModel<span class="token punctuation">)</span><span class="token punctuation">:</span>
    email<span class="token punctuation">:</span> <span class="token builtin">str</span>
    password<span class="token punctuation">:</span> <span class="token builtin">str</span>

<span class="token keyword">class</span> <span class="token class-name">UserSignUpFormat</span><span class="token punctuation">(</span>BaseModel<span class="token punctuation">)</span><span class="token punctuation">:</span>
    email<span class="token punctuation">:</span> <span class="token builtin">str</span>
    password<span class="token punctuation">:</span> <span class="token builtin">str</span>
    name<span class="token punctuation">:</span> <span class="token builtin">str</span>
    competition_id<span class="token punctuation">:</span> <span class="token builtin">str</span> <span class="token operator">=</span> <span class="token string">""</span>

<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>delete</span><span class="token punctuation">(</span><span class="token string">"/delete_user"</span><span class="token punctuation">)</span>
<span class="token keyword">async</span> <span class="token keyword">def</span> <span class="token function">delete_user</span><span class="token punctuation">(</span>user_email<span class="token punctuation">:</span> <span class="token builtin">str</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""Using example:
    """</span>

    user <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>Users<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>Users<span class="token punctuation">.</span>email <span class="token operator">==</span> user_email<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token keyword">if</span> user <span class="token keyword">is</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid email"</span><span class="token punctuation">)</span>
    
    <span class="token comment"># Remove all players with that user_id</span>
    count_players_deleted <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>models<span class="token punctuation">.</span>Player<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Player<span class="token punctuation">.</span>user_id <span class="token operator">==</span> user<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token punctuation">)</span><span class="token punctuation">.</span>delete<span class="token punctuation">(</span><span class="token punctuation">)</span>

    <span class="token comment"># Now delete the user.</span>
    db<span class="token punctuation">.</span>delete<span class="token punctuation">(</span>user<span class="token punctuation">)</span>
    db<span class="token punctuation">.</span>commit<span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token keyword">return</span> <span class="token punctuation">{</span> <span class="token string">"detail"</span><span class="token punctuation">:</span> <span class="token string">"User deleted successfully"</span><span class="token punctuation">,</span> <span class="token string">"count_players_deleted"</span><span class="token punctuation">:</span> count_players_deleted<span class="token punctuation">,</span> <span class="token string">"user"</span><span class="token punctuation">:</span> user<span class="token punctuation">.</span>__dict__<span class="token punctuation">}</span>


<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>post</span><span class="token punctuation">(</span><span class="token string">"/signup"</span><span class="token punctuation">)</span>
<span class="token keyword">async</span> <span class="token keyword">def</span> <span class="token function">signup</span><span class="token punctuation">(</span>user<span class="token punctuation">:</span> UserSignUpFormat<span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token triple-quoted-string string">"""Using example:
    {
    "email": "wangnelson4@gmail.com",
    "password": "test1234",
    "name": "Nelson the Tester",
    "competition_id": ""
    }
    """</span>
    <span class="token comment"># hashed_password = hashpw(user.password.encode('utf-8'), gensalt()).decode('utf-8')</span>
    hashed_password <span class="token operator">=</span> get_hashed_password<span class="token punctuation">(</span>user<span class="token punctuation">.</span>password<span class="token punctuation">)</span>
    <span class="token comment"># new_user = user.copy(update={"password": hashed_password})</span>
    <span class="token keyword">if</span><span class="token punctuation">(</span>validateEmail<span class="token punctuation">(</span>email<span class="token operator">=</span>user<span class="token punctuation">.</span>email<span class="token punctuation">)</span> <span class="token operator">==</span> <span class="token boolean">False</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid email"</span><span class="token punctuation">)</span>
    
    new_user <span class="token operator">=</span> Users<span class="token punctuation">(</span>
        email<span class="token operator">=</span>user<span class="token punctuation">.</span>email<span class="token punctuation">,</span>
        password<span class="token operator">=</span>hashed_password<span class="token punctuation">,</span>
        name<span class="token operator">=</span>user<span class="token punctuation">.</span>name<span class="token punctuation">,</span>
    <span class="token punctuation">)</span>

    <span class="token comment"># if email already exists then throw error</span>
    <span class="token keyword">if</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>Users<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>Users<span class="token punctuation">.</span>email <span class="token operator">==</span> user<span class="token punctuation">.</span>email<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span> <span class="token keyword">is</span> <span class="token keyword">not</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Email already exists"</span><span class="token punctuation">)</span>
    
    competition_join <span class="token operator">=</span> <span class="token string">"7bc69deb-b1b4-4d45-aab1-43ce2d9caf8b"</span>
    <span class="token keyword">if</span> user<span class="token punctuation">.</span>competition_id <span class="token operator">==</span> <span class="token string">""</span><span class="token punctuation">:</span>
        user<span class="token punctuation">.</span>competition_id <span class="token operator">=</span> competition_join

    <span class="token comment"># If competition doesnt exist then throw error</span>
    competition <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>models<span class="token punctuation">.</span>Competitions<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Competitions<span class="token punctuation">.</span><span class="token builtin">id</span> <span class="token operator">==</span> user<span class="token punctuation">.</span>competition_id<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    <span class="token keyword">if</span> competition <span class="token keyword">is</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string-interpolation"><span class="token string">f"Invalid competition_id </span><span class="token interpolation"><span class="token punctuation">{</span>user<span class="token punctuation">.</span>competition_id<span class="token punctuation">}</span></span><span class="token string">"</span></span><span class="token punctuation">)</span>

    new_user<span class="token punctuation">.</span>default_competition_id <span class="token operator">=</span> user<span class="token punctuation">.</span>competition_id   

    
    <span class="token comment"># test verify method</span>
    <span class="token comment"># if not pwd_context.verify(user.password, hashed_password):</span>
    <span class="token keyword">if</span> <span class="token keyword">not</span> verify_password<span class="token punctuation">(</span>user<span class="token punctuation">.</span>password<span class="token punctuation">,</span> hashed_password<span class="token punctuation">)</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid password"</span><span class="token punctuation">)</span>

    db<span class="token punctuation">.</span>add<span class="token punctuation">(</span>new_user<span class="token punctuation">)</span>
    db<span class="token punctuation">.</span>commit<span class="token punctuation">(</span><span class="token punctuation">)</span>
    db<span class="token punctuation">.</span>refresh<span class="token punctuation">(</span>new_user<span class="token punctuation">)</span>
    

    new_player <span class="token operator">=</span> models<span class="token punctuation">.</span>Player<span class="token punctuation">(</span>
        user_id<span class="token operator">=</span>new_user<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token punctuation">,</span>
        competition_id<span class="token operator">=</span>user<span class="token punctuation">.</span>competition_id<span class="token punctuation">,</span>
    <span class="token punctuation">)</span>


    db<span class="token punctuation">.</span>add<span class="token punctuation">(</span>new_player<span class="token punctuation">)</span>
    db<span class="token punctuation">.</span>commit<span class="token punctuation">(</span><span class="token punctuation">)</span>

    db<span class="token punctuation">.</span>refresh<span class="token punctuation">(</span>new_player<span class="token punctuation">)</span>
    db<span class="token punctuation">.</span>refresh<span class="token punctuation">(</span>new_user<span class="token punctuation">)</span>
    

    <span class="token keyword">return</span> <span class="token punctuation">{</span> <span class="token string">"detail"</span><span class="token punctuation">:</span> <span class="token string">"User created successfully"</span><span class="token punctuation">,</span>
            <span class="token string">"user"</span><span class="token punctuation">:</span> new_user<span class="token punctuation">.</span>__dict__<span class="token punctuation">,</span>
             <span class="token string">"player"</span><span class="token punctuation">:</span> new_player<span class="token punctuation">.</span>__dict__ <span class="token punctuation">}</span>

<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>post</span><span class="token punctuation">(</span><span class="token string">"/login"</span><span class="token punctuation">)</span>
<span class="token keyword">async</span> <span class="token keyword">def</span> <span class="token function">login</span><span class="token punctuation">(</span>user_entry<span class="token punctuation">:</span> UserLoginFormat<span class="token punctuation">)</span><span class="token punctuation">:</span>
    user_db <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>Users<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>Users<span class="token punctuation">.</span>email <span class="token operator">==</span> user_entry<span class="token punctuation">.</span>email<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    
    <span class="token keyword">if</span> user_db <span class="token keyword">is</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid email"</span><span class="token punctuation">)</span>
    
<span class="token comment">#    if not checkpw(user_db.password.encode('utf-8'), user_db.password.encode('utf-8')):</span>
    <span class="token keyword">if</span> <span class="token keyword">not</span> verify_password<span class="token punctuation">(</span>user_entry<span class="token punctuation">.</span>password<span class="token punctuation">,</span> user_db<span class="token punctuation">.</span>password<span class="token punctuation">)</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid password"</span><span class="token punctuation">)</span>
    <span class="token keyword">return</span> user_db<span class="token punctuation">.</span>__dict__


<span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>get</span><span class="token punctuation">(</span><span class="token string">'/unprotected'</span><span class="token punctuation">)</span>
<span class="token keyword">def</span> <span class="token function">unprotected</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    <span class="token keyword">return</span> <span class="token punctuation">{</span> <span class="token string">'hello'</span><span class="token punctuation">:</span> <span class="token string">'world'</span> <span class="token punctuation">}</span>


</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h3 id="return-the-player-id-as-well-as-the-whole-data-for-the-day-report" tabindex="-1"><a class="header-anchor" href="#return-the-player-id-as-well-as-the-whole-data-for-the-day-report"><span>return the player_id. {As well as the whole data for the day report.}</span></a></h3>
<ul>
<li>My guess is to just return the whole data for the day report if flagged.</li>
</ul>
<div class="language-python line-numbers-mode" data-ext="py" data-title="py"><pre v-pre class="language-python"><code><span class="token decorator annotation punctuation">@app<span class="token punctuation">.</span>post</span><span class="token punctuation">(</span><span class="token string">"/login"</span><span class="token punctuation">)</span>
<span class="token keyword">async</span> <span class="token keyword">def</span> <span class="token function">login</span><span class="token punctuation">(</span>user_entry<span class="token punctuation">:</span> UserLoginFormat<span class="token punctuation">,</span> report_on_sucess<span class="token punctuation">:</span> <span class="token builtin">bool</span> <span class="token operator">=</span> <span class="token boolean">True</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
    user_db <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>Users<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>Users<span class="token punctuation">.</span>email <span class="token operator">==</span> user_entry<span class="token punctuation">.</span>email<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span>
    
    <span class="token keyword">if</span> user_db <span class="token keyword">is</span> <span class="token boolean">None</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid email"</span><span class="token punctuation">)</span>
    <span class="token keyword">if</span> <span class="token keyword">not</span> verify_password<span class="token punctuation">(</span>user_entry<span class="token punctuation">.</span>password<span class="token punctuation">,</span> user_db<span class="token punctuation">.</span>password<span class="token punctuation">)</span><span class="token punctuation">:</span>
        <span class="token keyword">raise</span> HTTPException<span class="token punctuation">(</span>status_code<span class="token operator">=</span><span class="token number">400</span><span class="token punctuation">,</span> detail<span class="token operator">=</span><span class="token string">"Invalid password"</span><span class="token punctuation">)</span>

    <span class="token keyword">if</span><span class="token punctuation">(</span>report_on_sucess <span class="token operator">==</span> <span class="token boolean">True</span><span class="token punctuation">)</span><span class="token punctuation">:</span>
        default_competition_id <span class="token operator">=</span> user_db<span class="token punctuation">.</span>default_competition_id
        default_player_id <span class="token operator">=</span> db<span class="token punctuation">.</span>query<span class="token punctuation">(</span>models<span class="token punctuation">.</span>Player<span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">filter</span><span class="token punctuation">(</span>models<span class="token punctuation">.</span>Player<span class="token punctuation">.</span>user_id <span class="token operator">==</span> user_db<span class="token punctuation">.</span><span class="token builtin">id</span><span class="token punctuation">,</span> models<span class="token punctuation">.</span>Player<span class="token punctuation">.</span>competition_id <span class="token operator">==</span> default_competition_id<span class="token punctuation">)</span><span class="token punctuation">.</span>first<span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">.</span><span class="token builtin">id</span>
        <span class="token keyword">return</span> <span class="token keyword">await</span> api<span class="token punctuation">.</span>get_user_report<span class="token punctuation">(</span>
            player_id<span class="token operator">=</span>default_player_id<span class="token punctuation">,</span>
            selected_ticket_names<span class="token operator">=</span>constants<span class="token punctuation">.</span>BEGINNER_TICKET_LIST
        <span class="token punctuation">)</span>

    <span class="token keyword">return</span> user_db<span class="token punctuation">.</span>__dict__


</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_17-sun" tabindex="-1"><a class="header-anchor" href="#_17-sun"><span>17 Sun</span></a></h2>
<h3 id="_17-todo" tabindex="-1"><a class="header-anchor" href="#_17-todo"><span>17.todo</span></a></h3>
<ul>
<li>[x] 17.1 Fixing retrieval of the current user data.</li>
</ul>
<h3 id="fixing-log-int-he-current" tabindex="-1"><a class="header-anchor" href="#fixing-log-int-he-current"><span>Fixing Log int he current</span></a></h3>
<h3 id="there-should-be-a-log-off-button-to-log-off" tabindex="-1"><a class="header-anchor" href="#there-should-be-a-log-off-button-to-log-off"><span>There should be a log off button to log off.</span></a></h3>
<p>This is actually something more to be done from the front end whereas:</p>
<ul>
<li>[x] The front end should have a log off button.
<ul>
<li>[x] It should take you towards the welcome page.</li>
</ul>
</li>
</ul>
<p>Makes sense to have a login method that:</p>
<ul>
<li>
<p>rejects whenever</p>
</li>
<li>
<p>[x] Log off button should also delete the guid and user_data in local_storage.</p>
</li>
<li>
<p>[x] Create a demo log in option.</p>
</li>
<li>
<p>[x] Crate another Demo Log int to make sure you can also log from a different account</p>
<ul>
<li>[x] BUt this time it should be using an specific password etc to retrieve the player id and etc.</li>
</ul>
</li>
<li>
<p>[x] The front end should have a log in button.</p>
</li>
</ul>
<p>Is this because of:</p>
<div class="language-dart line-numbers-mode" data-ext="dart" data-title="dart"><pre v-pre class="language-dart"><code>
db<span class="token punctuation">.</span><span class="token function">loadData</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
db<span class="token punctuation">.</span><span class="token function">syncData</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_18-mon" tabindex="-1"><a class="header-anchor" href="#_18-mon"><span>18 Mon</span></a></h2>
<h3 id="_18-todo" tabindex="-1"><a class="header-anchor" href="#_18-todo"><span>18.todo</span></a></h3>
<ul>
<li>[x] 18.1 Re Designing a LTS General Documentation Strategy</li>
<li>[ ] 18.2 Fixing and implementing the <code v-pre>Salaryman's survival guide</code></li>
</ul>
<h3 id="_18-1-re-designing-a-lts-general-documentation-strategy" tabindex="-1"><a class="header-anchor" href="#_18-1-re-designing-a-lts-general-documentation-strategy"><span>18.1 Re Designing a LTS General Documentation Strategy</span></a></h3>
<p>Which makes it not working right.****</p>
<p><strong>Documenting</strong></p>
<p>Some stuff is important to be docuented and have specific projects on them.</p>
<p>At for the current decision is to have all the documentation inside of the <code v-pre>design-docs =&gt; Docusaurus.</code></p>
<h3 id="general-re-design-of-algo-docs" tabindex="-1"><a class="header-anchor" href="#general-re-design-of-algo-docs"><span>General re-design of algo docs..</span></a></h3>
<ul>
<li>[ ] Having parts of the CV there including GPA etc.</li>
<li>[ ] Having the projects there.</li>
<li>[ ] The site could be in the <code v-pre>wangnelson.xyz</code> main page.</li>
</ul>
<h3 id="project-walkthroughts" tabindex="-1"><a class="header-anchor" href="#project-walkthroughts"><span>Project Walkthroughts</span></a></h3>
<ul>
<li>This can be things like Angular, Flutter, React Projects etc.</li>
<li>Devpost Competitions.</li>
<li>The idea of walkthroughts is to have a documentation</li>
<li>As for plans and the like, having a <code v-pre>Salary man survival guide</code> would be rather cool in my opinion.</li>
</ul>
<p>I think it would be rather to focuson developer notes</p>
<p><strong>Features to Have</strong></p>
<ul>
<li>[ ] Code Documentation Explainaition on the hard things.</li>
<li>[ ] Link to Github</li>
<li>[ ] Link to live Demo.</li>
<li>[ ] Gif recordings of the front end and etc.</li>
<li>[ ] Youtube video of the project.</li>
<li>[ ] Template code from that code for the future to be re-utilized</li>
</ul>
<p><strong>Projects to document from the past</strong></p>
<ul>
<li>[ ] Maid CLI</li>
<li>[ ] E-Commerce Website</li>
</ul>
<h3 id="algorithms-documentation" tabindex="-1"><a class="header-anchor" href="#algorithms-documentation"><span>Algorithms Documentation</span></a></h3>
<h3 id="cybersecurity" tabindex="-1"><a class="header-anchor" href="#cybersecurity"><span>Cybersecurity</span></a></h3>
<p>It makes sense to</p>
<h3 id="_18-2-fixing-and-implementing-the-salaryman-s-survival-guide" tabindex="-1"><a class="header-anchor" href="#_18-2-fixing-and-implementing-the-salaryman-s-survival-guide"><span>18.2 Fixing and implementing the <code v-pre>Salaryman's survival guide</code></span></a></h3>
<ul>
<li>[ ] Fixing The Image</li>
</ul>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>${projectRoot}/docs/.vuepress/public/img
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><p><img src="@source/posts/.vuepress/public/img/2023-09-18-12-43-37.png" alt=""></p>
<h3 id="_18-3-meeting-room" tabindex="-1"><a class="header-anchor" href="#_18-3-meeting-room"><span>18.3 Meeting Room</span></a></h3>
<ul>
<li>
<p>The idea of the journal is to also be shareable so no shady stuff here please!</p>
</li>
<li>
<p>Creates environment</p>
</li>
<li>
<p>And comes in place,</p>
</li>
<li>
<p>Minimize the risk factor</p>
</li>
<li>
<p>Visual Processing and the great dizzziness</p>
</li>
<li>
<p>Shows that perfect simulation while they are performing</p>
</li>
<li>
<p>Payments to connect up with companies, let those folks pay for the platform.</p>
</li>
<li>
<p>Forage virtual internships -&gt; Lulu lemon.</p>
<ul>
<li>Turn in the tasks and get paid.</li>
<li>Providing the Analyzis and the company and the ideal hould have in terms of skillsets and virtual work experiences.</li>
</ul>
</li>
<li>
<p>[ ] I like the idea of sending the what to do and develop strategy.</p>
</li>
<li>
<p>[ ] School lessons</p>
</li>
<li>
<p>[ ] Data points and watching someones over time.</p>
</li>
<li>
<p>[ ] The environment</p>
<ul>
<li>[ ] What it looks under certain what the job roles are. Kind</li>
<li>[ ] Perform according to those roles and engage through the metrics.</li>
<li>[ ] With the culture and the like, have the custom as well. Customer Discovery in the interviews to find the cultures in that place.</li>
<li>[ ] Quantify that aspect.</li>
</ul>
</li>
<li>
<p>[ ] -&gt; That could trigger to Facebook buyup.</p>
</li>
</ul>
<h3 id="_18-4-reset-portfolio-option" tabindex="-1"><a class="header-anchor" href="#_18-4-reset-portfolio-option"><span>18.4 Reset Portfolio Option.</span></a></h3>
<h3 id="_18-5-buying-0-to-1-update" tabindex="-1"><a class="header-anchor" href="#_18-5-buying-0-to-1-update"><span>18.5 Buying 0 to 1 update.</span></a></h3>
<ul>
<li>[ ] Venture well put student.</li>
<li>[ ] Test if you can quickly update the stock lists</li>
</ul>
<p>Planning to go to this from the next month.</p>
<h3 id="random-offline-for-maid-for-acceleration" tabindex="-1"><a class="header-anchor" href="#random-offline-for-maid-for-acceleration"><span>Random Offline for maid for acceleration</span></a></h3>
<div class="language-javascript line-numbers-mode" data-ext="js" data-title="js"><pre v-pre class="language-javascript"><code>randomOffline <span class="token operator">=</span> <span class="token boolean">false</span>
<span class="token function-variable function">getYoungest</span> <span class="token operator">=</span> <span class="token keyword">async</span> <span class="token punctuation">(</span><span class="token parameter">potential_questions<span class="token punctuation">,</span> <span class="token punctuation">{</span> limit <span class="token operator">=</span> <span class="token number">3</span><span class="token punctuation">,</span> account_id <span class="token operator">=</span> <span class="token number">1</span><span class="token punctuation">,</span> debug <span class="token operator">=</span> <span class="token boolean">false</span><span class="token punctuation">,</span> randomOffline <span class="token operator">=</span> <span class="token boolean">false</span> <span class="token punctuation">}</span> <span class="token operator">=</span> <span class="token punctuation">{</span><span class="token punctuation">}</span></span><span class="token punctuation">)</span> <span class="token operator">=></span> <span class="token punctuation">{</span>
<span class="token punctuation">}</span>

        potential_questions <span class="token operator">=</span> <span class="token keyword">await</span> <span class="token keyword">this</span><span class="token punctuation">.</span><span class="token function">getYoungest</span><span class="token punctuation">(</span>potential_questions<span class="token punctuation">,</span> <span class="token punctuation">{</span> <span class="token literal-property property">limit</span><span class="token operator">:</span> <span class="token number">2</span><span class="token punctuation">,</span> <span class="token literal-property property">randomOffline</span><span class="token operator">:</span> <span class="token boolean">true</span> <span class="token punctuation">}</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Like this is literally bad</p>
<div class="language-json line-numbers-mode" data-ext="json" data-title="json"><pre v-pre class="language-json"><code><span class="token punctuation">[</span>
  <span class="token punctuation">{</span>
    <span class="token property">"price_average"</span><span class="token operator">:</span> <span class="token number">149.12</span><span class="token punctuation">,</span>
    <span class="token property">"symbol"</span><span class="token operator">:</span> <span class="token string">"JPM"</span><span class="token punctuation">,</span>
    <span class="token property">"count"</span><span class="token operator">:</span> <span class="token number">2</span><span class="token punctuation">,</span>
    <span class="token property">"updated_time"</span><span class="token operator">:</span> <span class="token string">"2023-09-18T21:13:32.380819"</span><span class="token punctuation">,</span>
    <span class="token property">"player_id"</span><span class="token operator">:</span> <span class="token string">"92cb1815-bbc7-47aa-aba4-4788425b0524"</span><span class="token punctuation">,</span>
    <span class="token property">"id"</span><span class="token operator">:</span> <span class="token string">"fbe2136b-ab07-49b8-b1d5-8b24f873ebed"</span><span class="token punctuation">,</span>
    <span class="token property">"created_time"</span><span class="token operator">:</span> <span class="token string">"2023-09-17T14:50:40.089467"</span><span class="token punctuation">,</span>
    <span class="token property">"estimated_profit"</span><span class="token operator">:</span> <span class="token number">0.3100000000000023</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token punctuation">{</span>
    <span class="token property">"price_average"</span><span class="token operator">:</span> <span class="token number">177.97</span><span class="token punctuation">,</span>
    <span class="token property">"symbol"</span><span class="token operator">:</span> <span class="token string">"AAPL"</span><span class="token punctuation">,</span>
    <span class="token property">"count"</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
    <span class="token property">"updated_time"</span><span class="token operator">:</span> <span class="token string">"2023-09-18T21:18:27.730452"</span><span class="token punctuation">,</span>
    <span class="token property">"player_id"</span><span class="token operator">:</span> <span class="token string">"92cb1815-bbc7-47aa-aba4-4788425b0524"</span><span class="token punctuation">,</span>
    <span class="token property">"id"</span><span class="token operator">:</span> <span class="token string">"c1dca151-2881-490d-8c78-3f334e516fff"</span><span class="token punctuation">,</span>
    <span class="token property">"created_time"</span><span class="token operator">:</span> <span class="token string">"2023-09-17T14:34:06.384441"</span><span class="token punctuation">,</span>
    <span class="token property">"estimated_profit"</span><span class="token operator">:</span> <span class="token number">5.920000000000016</span>
  <span class="token punctuation">}</span><span class="token punctuation">,</span>
  <span class="token punctuation">{</span>
    <span class="token property">"price_average"</span><span class="token operator">:</span> <span class="token number">329.06</span><span class="token punctuation">,</span>
    <span class="token property">"symbol"</span><span class="token operator">:</span> <span class="token string">"MSFT"</span><span class="token punctuation">,</span>
    <span class="token property">"count"</span><span class="token operator">:</span> <span class="token number">1</span><span class="token punctuation">,</span>
    <span class="token property">"updated_time"</span><span class="token operator">:</span> <span class="token string">"2023-09-18T22:39:22.980889"</span><span class="token punctuation">,</span>
    <span class="token property">"player_id"</span><span class="token operator">:</span> <span class="token string">"92cb1815-bbc7-47aa-aba4-4788425b0524"</span><span class="token punctuation">,</span>
    <span class="token property">"id"</span><span class="token operator">:</span> <span class="token string">"6f2a0434-d2f5-4f1b-a7a0-db5e4d8dd81e"</span><span class="token punctuation">,</span>
    <span class="token property">"created_time"</span><span class="token operator">:</span> <span class="token string">"2023-09-18T21:15:34.560221"</span><span class="token punctuation">,</span>
    <span class="token property">"estimated_profit"</span><span class="token operator">:</span> <span class="token number">0</span>
  <span class="token punctuation">}</span>
<span class="token punctuation">]</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>It should instead be instead the calculation included with the current price, total invested and other while basic, required data.</p>
<p><img src="@source/posts/.vuepress/public/img/2023-09-19-12-17-27.png" alt=""></p>
<p>Credentials for all protected</p>
<div class="language-text line-numbers-mode" data-ext="text" data-title="text"><pre v-pre class="language-text"><code>{
    developer
    Dev123
}
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><p>Here some goals:</p>
<ul>
<li><a href="https://www.youtube.com/watch?v=L8ypSXwyBds" target="_blank" rel="noopener noreferrer">Python Snake Game<ExternalLinkIcon/></a></li>
<li><a href="https://www.youtube.com/watch?v=2eeYqJ0uBKE" target="_blank" rel="noopener noreferrer">Mario AI Simulations<ExternalLinkIcon/></a></li>
<li><a href="https://www.youtube.com/watch?v=Cy155O5R1Oo" target="_blank" rel="noopener noreferrer">Self Driving<ExternalLinkIcon/></a></li>
<li><a href="https://www.youtube.com/watch?v=2f6TmKm7yx0" target="_blank" rel="noopener noreferrer">Python Ping Poing Tutorial<ExternalLinkIcon/></a></li>
<li><a href="https://www.youtube.com/watch?v=ffzvhe97J4Q" target="_blank" rel="noopener noreferrer">Python Chess<ExternalLinkIcon/></a></li>
</ul>
<h2 id="_22-fri" tabindex="-1"><a class="header-anchor" href="#_22-fri"><span>22 Fri</span></a></h2>
<h3 id="_22-todo" tabindex="-1"><a class="header-anchor" href="#_22-todo"><span>22.todo</span></a></h3>
<ul>
<li>[ ] 22.1 Making a better decision in where I want to go i life</li>
</ul>
<h3 id="_22-1-making-a-better-decision-in-where-i-want-to-go-i-life" tabindex="-1"><a class="header-anchor" href="#_22-1-making-a-better-decision-in-where-i-want-to-go-i-life"><span>22.1 Making a better decision in where I want to go i life</span></a></h3>
<p><strong>Path 1: Continue as Software</strong></p>
<ul>
<li>Continue learning no end</li>
<li>Just focusing on algorithms</li>
</ul>
<p><strong>Path 2: Becoming a Logistics guy</strong></p>
<ul>
<li>Then you should
<ul>
<li>[x] Continuous Practice of algorithms
<ul>
<li>[x] The DSA CLI is a great integration</li>
</ul>
</li>
<li>[x] Is important to master the tools of:
<ul>
<li>[x] Documentation</li>
<li>[x] Self Tools Developments. ( I think is good enough )</li>
</ul>
</li>
<li>[ ] Slight chance for AI and understanding of algorithms to be in your favor</li>
<li>[ ] Data Science
<ul>
<li>[ ] Drill down into Market Analysis is important. =&gt; Udemy Course to be checked</li>
<li>[ ] Drill down into Data Science is important. =&gt; Udemy Course to be checked on Parallel</li>
</ul>
</li>
<li>[ ] It would be complementary to understand Factorio and other factory like games.</li>
<li>[ ] Social
<ul>
<li>[ ] Getting Buffed up =&gt; Required</li>
</ul>
</li>
</ul>
</li>
</ul>
<p><strong>Data Science</strong></p>
<ul>
<li>Practice Kaggle on the Daily?</li>
<li>Working up simulations also on the daily? Using Pygame I mean? WIll that be any use?
<ul>
<li>Just get right the idea</li>
</ul>
</li>
</ul>
</div></template>


