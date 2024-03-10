<template><div>
<p>Examples From:</p>
<ul>
<li><a href="https://websitesetup.org/javascript-cheat-sheet/" target="_blank" rel="noopener noreferrer">Javascript Cheatsheet<ExternalLinkIcon/></a></li>
<li><a href="https://javascript.info/array-methods" target="_blank" rel="noopener noreferrer">Array Methods (Javascript.info)<ExternalLinkIcon/></a></li>
<li><a href="https://javascript.info/string" target="_blank" rel="noopener noreferrer">Strings (Javascript.info)<ExternalLinkIcon/></a></li>
</ul>
<p>Table of Contents:</p>
<nav class="table-of-contents"><ul><li><router-link to="#variables">Variables</router-link></li><li><router-link to="#array-methods">Array Methods</router-link></li><li><router-link to="#string-methods">String Methods</router-link></li><li><router-link to="#number-methods">Number Methods</router-link></li></ul></nav>
<h2 id="variables" tabindex="-1"><a class="header-anchor" href="#variables"><span>Variables</span></a></h2>
<table>
<thead>
<tr>
<th>Description</th>
<th>Code</th>
</tr>
</thead>
<tbody>
<tr>
<td>var</td>
<td>&quot;Can be reassigned but only accessed within a function. Variables defined with var move to the top when code is executed.&quot;</td>
</tr>
<tr>
<td>const</td>
<td>&quot;Cannot be reassigned and not accessible before they appear within the code&quot;</td>
</tr>
<tr>
<td>Let</td>
<td>&quot;Similar to const let variable can be reassigned but not re-declared&quot;</td>
</tr>
</tbody>
</table>
<h2 id="array-methods" tabindex="-1"><a class="header-anchor" href="#array-methods"><span>Array Methods</span></a></h2>
<ul>
<li><a href="https://javascript.info/array-methods" target="_blank" rel="noopener noreferrer">Array Methods<ExternalLinkIcon/></a></li>
</ul>
<table-code>
<table-row-code title="adds items to the end," code='arr.push(...items)
' />
<table-row-code title="splice" sub=" Delete element from array" 
code='let arr = ["I", "study", "JavaScript"];
arr.splice(1, 1); // from index 1 remove 1 element
alert( arr ); // ["I", "JavaScript"]
' />
<table-row-code title="slice" 
code='let arr = ["t", "e", "s", "t"];
alert( arr.slice(1, 3) ); // e,s (copy from 1 to 3)
alert( arr.slice(-2) ); // s,t (copy from -2 till the end)
'/>
<table-row-code title="concat" sub=" The method arr.concat creates a new array that includes values from other arrays and additional items." 
code='let arr = [1, 2];
<p>// create an array from: arr and [3,4]
alert( arr.concat([3, 4]) ); // 1,2,3,4</p>
<p>// create an array from: arr and [3,4] and [5,6]
alert( arr.concat([3, 4], [5, 6]) ); // 1,2,3,4,5,6</p>
<p>// create an array from: arr and [3,4], then add values 5 and 6
alert( arr.concat([3, 4], 5, 6) ); // 1,2,3,4,5,6
' /&gt;</p>
<table-row-code title="Iterate: forEach" sub=" Delete element from array" 
code='
arr.forEach(function(item, index, array) {
  // ... do something with item
});
<p>' /&gt;</p>
<table-row-code title="indexOf/lastIndexOf" 
code='let arr = [1, 0, false];
<p>alert( arr.indexOf(0) ); // 1
alert( arr.indexOf(false) ); // 2
alert( arr.indexOf(null) ); // -1</p>
<p>alert( arr.includes(1) ); // true
' /&gt;</p>
<tre  title="filter"  sub="filter returns an array of all matching elements:" >
<pre><code>let users = [
    {id: 1, name: &quot;John&quot;},
    {id: 2, name: &quot;Pete&quot;},
    {id: 3, name: &quot;Mary&quot;}
];
let someUsers = users.filter(item =&gt; item.id &lt; 3);
</code></pre>
</tre>
</table-code>
<h2 id="string-methods" tabindex="-1"><a class="header-anchor" href="#string-methods"><span>String Methods</span></a></h2>
<ul>
<li><a href="https://javascript.info/string" target="_blank" rel="noopener noreferrer">Strings (Javascript.info)<ExternalLinkIcon/></a></li>
</ul>
<h2 id="number-methods" tabindex="-1"><a class="header-anchor" href="#number-methods"><span>Number Methods</span></a></h2>
<ul>
<li><a href="https://www.w3schools.com/js/js_number_methods.asp" target="_blank" rel="noopener noreferrer">Number (Mozilla)<ExternalLinkIcon/></a></li>
<li><a href="https://www.w3schools.com/js/js_number_methods.asp" target="_blank" rel="noopener noreferrer">Number Methods (w3school)<ExternalLinkIcon/></a></li>
</ul>
</div></template>


