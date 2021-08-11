---
title: PHP
lang: en-US
tags: ["practice", "lab"]
---

# {{ $frontmatter.title }}

<TagBadge />

&nbsp;
&nbsp;
- Credit and Sources:
  - [Front Line PHP - Cheatsheet](https://front-line-php.com/cheat-sheet)
  - [Codemy - php-Sheet](https://codemy.com/php-sheet.pdf)


&nbsp;
Table of Contents:
- [{{ $frontmatter.title }}](#-frontmattertitle-)
  - [🎯 Practice](#-practice)
  - [💻 Quick tables](#-quick-tables)

## 🎯 Practice
- [W3School Excercise | PHP ](https://www.w3schools.com/php/exercise.asp)


## 💻 Quick tables
<table-code>



<table-row-code title="If/Else/Elseif"  
code='if (condition) {
// do something
} elseif (condition) {
// do something
} else {
// do something
}' />

<table-row-code title="Arrays"  
code='
// Numeric Array
$my_array = array("Blue", "Red", "Green", "Purple");
Echo $my_var[0]; // echoes out Blue
// Using the list syntax:

list($a, $b, $c) = $array;

// Or the shorthand syntax:
[$a, $b, $c] = $array;
'/>

<table-row-code title="For Loop"  
code='
for ($counter = 1; $counter < 10; $counter++){
echo $counter;
}

'/>

<table-row-code title="Functions"  
code='
Function namer($names) {
echo "Hello, my name is " . $names;
}
namer("John Elder"); // call the function
'/>

<table-row-code title="Random Numbers"  
code='
echo rand(1, 100); // creates random number between 1 and 100
'/>

<table-row-code title="Date Function"  
code="
echo date ('l js \of F, Y); // echoes out date in format Tuesday 26th of January 2018
"/>

<table-row-code title="String Manipulation"  
code='
$variable = "John Elder is a Dork";
str_replace("Dork", "God", $variable); // replace Dork with God
echo strtoupper($variable); // Capitalize all letters
echo ucwords($variable); // Capitalize first letter of all words
echo strtolower($variable); // Lowercase all letters
echo lcfirst($variable); // Lowercase only first word
'/>

<table-row-code title="Include"  
code="
Include('whatever.php');
"/>
</table-code>