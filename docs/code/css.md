# CSS 
<Badge text="Lab"/> <Badge type="warning" text="Practice"/>

- Examples Extracted from:
  - [CSS Cheat Sheet](https://htmlcheatsheet.com/css/)


Table of contents:
- [CSS](#css)
  - [🎯 Practice Sets](#-practice-sets)
  - [Selectors](#selectors)
  - [Pseudo Classes](#pseudo-classes)
  - [Attribute Selectors](#attribute-selectors)

## 🎯 Practice Sets 

- [W3 School Excercises](https://www.w3schools.com/css/exercise.asp)



## Selectors

| Selector                    | description                      |
| --------------------------- | -------------------------------- |
| *                           | all elements                     |
| div                         | all div tags                     |
| div, pall                   | divs and paragraphs              |
| div pparagraphs inside divs |                                  |
| div > p                     | all p tags one level deep in div |
| div + p                     | p tags immediately after div     |
| div ~ p                     | p tags preceded by div           |
| .classname                  | all elements with class          |
| #idname                     | element with ID                  |
| div.classname               | divs with certain classname      |
| div#idname                  | div with certain ID              |
| #idname *                   | all elements inside #idname      |

## Pseudo Classes

| a:link                  | link in normal state         |
| ----------------------- | ---------------------------- |
| a:active                | link in clicked state        |
| a:hover                 | link with mouse over it      |
| a:visited               | visited link                 |
| p::after{content:"yo";} | add content after p          |
| p::before               | add content before p         |
| input:checked           | checked inputs               |
| input:disabled          | disabled inputs              |
| input:enabled           | enabled inputs               |
| input:focu              | sinput has focus             |
| input:in-range          | value in range               |
| input:out-of-range      | input value out of range     |
| input:valid             | input with valid value       |
| input:invalid           | input with invalid value     |
| input:optional          | no required attribute        |
| input:required          | input with requred attribute |
| input:read-only         | with readonly attribute      |
| input:read-write        | no readonly attrib.          |
| div:empty               | element with no children     |
| p::first-letter         | first letter in p            |
| p::first-line           | first line in p              |
| p:first-of-type         | first of some type           |
| p:last-of-type          | last of some type            |
| p:lang(en)              | p with en language attribute |
| :not(span)              | element that's not a span    |
| p:first-child           | first child of its parent    |
| p:last-child            | last child of its parent     |
| p:nth-child(2)          | second child of its parent   |
| p:nth-child(3n+1)       | nth-child (an + b) formula   |
| p:nth-last-child(2)     | second child from behind     |
| p:nth-of-type(2)        | second p of its parent       |
| p:nth-last-of-type(2)   | ...from behind               |
| p:only-of-type          | unique of its parent         |
| p:only-child            | only child of its parent     |
| :root                   | documents root element       |
| ::selection             | portion selected by user     |
| :target                 | highlight active anchor      |
|                         |                              |

## Attribute Selectors

| a[target]            | links with a target attribute    |
| -------------------- | -------------------------------- |
| a[target="_blank"]   | links which open in new tab      |
| [title~="chair"]     | title element containing a word  |
| [class^="chair"]     | class starts with chair          |
| [class\|="chair"]    | class starts with the chair word |
| [class*="chair"]     | class contains chair             |
| [class$="chair"]     | class ends with chair            |
| input[type="button"] | specified input type             |


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
input[type="button"], specified input type -->