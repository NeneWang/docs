---
title: Shell
lang: en-US
tags: ["lab"]
---

# {{ $frontmatter.title }}

<TagBadge />

&nbsp;
&nbsp;

<!-- - Credit and Sources:
  - [htmlcheatsheet.com](https://htmlcheatsheet.com/) -->


&nbsp;
Table of Contents:
[[toc]]


##  Quick Examples
<br>

Shell Script Examples
- Shell Script Examples

<table-code>

<table-row-pre title="Set Permissions"  
code='
chmod a+x name.sh
'/>

<table-row-code title="Hello World"  
code='
#!/bin/sh
echo "Hello world"
'/>

<table-row-code title="Shell Script Arguments" sub="./name.sh Hans-Wolfgang Loidl"  
code='
#!/bin/bash
# example of using arguments to a script
echo "My first name is $1"
echo "My surname is $2"
echo "Total number of arguments is $#" 
'/>

</table-code>