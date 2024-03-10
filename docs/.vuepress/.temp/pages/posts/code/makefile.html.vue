<template><div>
<p> 
 </p>
<!-- - Credits:
  - [htmlcheatsheet.com](https://htmlcheatsheet.com/) -->
<p> 
Table of Contents:</p>
<nav class="table-of-contents"><ul><li><router-link to="#quick-examples">Quick Examples</router-link></li></ul></nav>
<h2 id="quick-examples" tabindex="-1"><a class="header-anchor" href="#quick-examples"><span>Quick Examples</span></a></h2>
<ul>
<li><a href="https://github.com/NeneWang/CISC3140-make" target="_blank" rel="noopener noreferrer">Github Make examples<ExternalLinkIcon/></a></li>
</ul>
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
</table-code></div></template>


