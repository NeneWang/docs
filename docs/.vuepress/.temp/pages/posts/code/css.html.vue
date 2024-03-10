<template><div>
<ul>
<li>Examples Extracted from:
<ul>
<li><a href="https://htmlcheatsheet.com/css/" target="_blank" rel="noopener noreferrer">CSS Cheat Sheet<ExternalLinkIcon/></a></li>
</ul>
</li>
</ul>
<p>Table of contents:</p>
<nav class="table-of-contents"><ul><li><router-link to="#🎯-practice-sets">🎯 Practice Sets</router-link></li><li><router-link to="#selectors">Selectors</router-link></li><li><router-link to="#pseudo-classes">Pseudo Classes</router-link></li><li><router-link to="#attribute-selectors">Attribute Selectors</router-link></li></ul></nav>
<h2 id="🎯-practice-sets" tabindex="-1"><a class="header-anchor" href="#🎯-practice-sets"><span>🎯 Practice Sets</span></a></h2>
<ul>
<li><a href="https://www.w3schools.com/css/exercise.asp" target="_blank" rel="noopener noreferrer">W3 School Excercises<ExternalLinkIcon/></a></li>
</ul>
<h2 id="selectors" tabindex="-1"><a class="header-anchor" href="#selectors"><span>Selectors</span></a></h2>
<table>
<thead>
<tr>
<th>Selector</th>
<th>description</th>
</tr>
</thead>
<tbody>
<tr>
<td>*</td>
<td>all elements</td>
</tr>
<tr>
<td>div</td>
<td>all div tags</td>
</tr>
<tr>
<td>div, pall</td>
<td>divs and paragraphs</td>
</tr>
<tr>
<td>div pparagraphs inside divs</td>
<td></td>
</tr>
<tr>
<td>div &gt; p</td>
<td>all p tags one level deep in div</td>
</tr>
<tr>
<td>div + p</td>
<td>p tags immediately after div</td>
</tr>
<tr>
<td>div ~ p</td>
<td>p tags preceded by div</td>
</tr>
<tr>
<td>.classname</td>
<td>all elements with class</td>
</tr>
<tr>
<td>#idname</td>
<td>element with ID</td>
</tr>
<tr>
<td>div.classname</td>
<td>divs with certain classname</td>
</tr>
<tr>
<td>div#idname</td>
<td>div with certain ID</td>
</tr>
<tr>
<td>#idname *</td>
<td>all elements inside #idname</td>
</tr>
</tbody>
</table>
<h2 id="pseudo-classes" tabindex="-1"><a class="header-anchor" href="#pseudo-classes"><span>Pseudo Classes</span></a></h2>
<table>
<thead>
<tr>
<th>a:link</th>
<th>link in normal state</th>
</tr>
</thead>
<tbody>
<tr>
<td>a:active</td>
<td>link in clicked state</td>
</tr>
<tr>
<td>a:hover</td>
<td>link with mouse over it</td>
</tr>
<tr>
<td>a:visited</td>
<td>visited link</td>
</tr>
<tr>
<td>p::after{content:&quot;yo&quot;;}</td>
<td>add content after p</td>
</tr>
<tr>
<td>p::before</td>
<td>add content before p</td>
</tr>
<tr>
<td>input:checked</td>
<td>checked inputs</td>
</tr>
<tr>
<td>input:disabled</td>
<td>disabled inputs</td>
</tr>
<tr>
<td>input:enabled</td>
<td>enabled inputs</td>
</tr>
<tr>
<td>input:focu</td>
<td>sinput has focus</td>
</tr>
<tr>
<td>input:in-range</td>
<td>value in range</td>
</tr>
<tr>
<td>input:out-of-range</td>
<td>input value out of range</td>
</tr>
<tr>
<td>input:valid</td>
<td>input with valid value</td>
</tr>
<tr>
<td>input:invalid</td>
<td>input with invalid value</td>
</tr>
<tr>
<td>input:optional</td>
<td>no required attribute</td>
</tr>
<tr>
<td>input:required</td>
<td>input with requred attribute</td>
</tr>
<tr>
<td>input:read-only</td>
<td>with readonly attribute</td>
</tr>
<tr>
<td>input:read-write</td>
<td>no readonly attrib.</td>
</tr>
<tr>
<td>div:empty</td>
<td>element with no children</td>
</tr>
<tr>
<td>p::first-letter</td>
<td>first letter in p</td>
</tr>
<tr>
<td>p::first-line</td>
<td>first line in p</td>
</tr>
<tr>
<td>p:first-of-type</td>
<td>first of some type</td>
</tr>
<tr>
<td>p:last-of-type</td>
<td>last of some type</td>
</tr>
<tr>
<td>p:lang(en)</td>
<td>p with en language attribute</td>
</tr>
<tr>
<td>:not(span)</td>
<td>element that's not a span</td>
</tr>
<tr>
<td>p:first-child</td>
<td>first child of its parent</td>
</tr>
<tr>
<td>p:last-child</td>
<td>last child of its parent</td>
</tr>
<tr>
<td>p:nth-child(2)</td>
<td>second child of its parent</td>
</tr>
<tr>
<td>p:nth-child(3n+1)</td>
<td>nth-child (an + b) formula</td>
</tr>
<tr>
<td>p:nth-last-child(2)</td>
<td>second child from behind</td>
</tr>
<tr>
<td>p:nth-of-type(2)</td>
<td>second p of its parent</td>
</tr>
<tr>
<td>p:nth-last-of-type(2)</td>
<td>...from behind</td>
</tr>
<tr>
<td>p:only-of-type</td>
<td>unique of its parent</td>
</tr>
<tr>
<td>p:only-child</td>
<td>only child of its parent</td>
</tr>
<tr>
<td>:root</td>
<td>documents root element</td>
</tr>
<tr>
<td>::selection</td>
<td>portion selected by user</td>
</tr>
<tr>
<td>:target</td>
<td>highlight active anchor</td>
</tr>
<tr>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<h2 id="attribute-selectors" tabindex="-1"><a class="header-anchor" href="#attribute-selectors"><span>Attribute Selectors</span></a></h2>
<table>
<thead>
<tr>
<th>a[target]</th>
<th>links with a target attribute</th>
</tr>
</thead>
<tbody>
<tr>
<td>a[target=&quot;_blank&quot;]</td>
<td>links which open in new tab</td>
</tr>
<tr>
<td>[title~=&quot;chair&quot;]</td>
<td>title element containing a word</td>
</tr>
<tr>
<td>[class^=&quot;chair&quot;]</td>
<td>class starts with chair</td>
</tr>
<tr>
<td>[class|=&quot;chair&quot;]</td>
<td>class starts with the chair word</td>
</tr>
<tr>
<td>[class*=&quot;chair&quot;]</td>
<td>class contains chair</td>
</tr>
<tr>
<td>[class$=&quot;chair&quot;]</td>
<td>class ends with chair</td>
</tr>
<tr>
<td>input[type=&quot;button&quot;]</td>
<td>specified input type</td>
</tr>
</tbody>
</table>
<!-- CSV for Flashcards -->
<!-- a:link, link in normal state
a:active, link in clicked state
a:hover, link with mouse over it
a:visited, visited link
p::after{content:"yo";}, add content after p
p::before, add content before p
input:checked, checked inputs
input:disabled, disabled inputs
input:enabled, enabled inputs
input:focu, sinput has focus
input:in-range, value in range
input:out-of-range,input value out of range
input:valid,input with valid value
input:invalid,input with invalid value
input:optional, no required attribute
input:required, input with requred attribute
input:read-only, with readonly attribute
input:read-write, no readonly attrib.
div:empty, element with no children
p::first-letter, first letter in p
p::first-line, first line in p
p:first-of-type, first of some type
p:last-of-type, last of some type
p:lang(en), p with en language attribute
:not(span), element that's not a span
p:first-child, first child of its parent
p:last-child, last child of its parent
p:nth-child(2), second child of its parent
p:nth-child(3n+1), nth-child (an + b) formula
p:nth-last-child(2), second child from behind
p:nth-of-type(2), second p of its parent
p:nth-last-of-type(2), ...from behind
p:only-of-type, unique of its parent
p:only-child, only child of its parent
:root, documents root element
::selection, portion selected by user
:target, highlight active anchor


Selector, description
*,all elements
div,all div tags
divpall, divs and paragraphs
div pparagraphs inside divs
div > p,all p tags one level deep in div
div + p,p tags immediately after div
div ~ p,p tags preceded by div
.classname,all elements with class
#idname, element with ID
div.classname, divs with certain classname
div#idname, div with certain ID
#idname *,all elements inside #idname


a[target], links with a target attribute
a[target="_blank"], links which open in new tab
[title~="chair"], title element containing a word
[class^="chair"], class starts with chair
[class|="chair"], class starts with the chair word
[class*="chair"], class contains chair
[class$="chair"], class ends with chair
input[type="button"], specified input type --></div></template>


