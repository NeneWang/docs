---
title: Makefile
lang: en-US
tags: ["lab"]
---

# {{ $frontmatter.title }}

<TagBadge />

&nbsp;
&nbsp;

<!-- - Credits:
  - [htmlcheatsheet.com](https://htmlcheatsheet.com/) -->


&nbsp;
Table of Contents:
[[toc]]


##  Quick Examples

- [Github Make examples](https://github.com/NeneWang/CISC3140-make)

<table-code>


<table-row-code title="Hello World"  
code='
say_hello:
	echo "Hello World"
'/>


<table-row-code title="Class Folders Creator"  
code='
explain_code:
	@echo "This program will create the folders for your classess: ${FOLDERS}"
	@echo "plese input -  make generate  CN=[class Name] - to create the folders"
generate:
	@echo "Creating class folders for ${CN}..."
	mkdir ${CN}
	mkdir ${CN}/assigments
	mkdir ${CN}/lectures
	mkdir ${CN}/exams
	mkdir ${CN}/miscellaneous
clean:
	@echo "removing folders for ${CN}..."
	rm -r ${CM}/
'/>

</table-code>