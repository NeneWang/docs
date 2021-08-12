---
title: Command Line Libraries
lang: en-US
tags: ["lab"]
---

# {{ $frontmatter.title }}

<TagBadge />

&nbsp;
&nbsp;
- Credit and Sources:
  - [cUrl Cheatsheet](https://devhints.io/curl)
  - 


&nbsp;
Table of Contents:
[[toc]]


## AWK

<br>

- [Official Documentation | AWK](https://www.gnu.org/software/gawk/manual/gawk.html)

<table-code>

<table-row-code title="IN"  
code="
SELECT * FROM users WHERE dept IN ('design', 'sales');
" />


<table-row-code title="Multipart File Upload"  
code='
curl -v -include --form key1=value1 --form upload=@localfilename URL
'/>


</table-code>

## cURL

<br>

- [Official Documentation | Curl](https://curl.se/docs/)
- [Cheatsheet | Curl](https://devhints.io/curl)

<table-code>

<table-row-code title="Post Data"  
code="
curl -d password=x http://x.com/y
" />

<table-row-code title="Auth Data"  
code='curl -u user:pass -d status="Hello" http://twitter.com/statuses/update.xml'/>

<table-row-code title="Multipart File Upload"  
code='
curl -v -include --form key1=value1 --form upload=@localfilename URL
'/>

<table-row-code title="multipart form" sub="Send data from text field and upload file"  
code='
curl -F person=anonymous -F secret=@file.txt http://example.com/submit.cgi
'/>

<table-row-code title="Use Curl to Check if a remote resource is available"  
code='
curl -o /dev/null --silent -Iw "%{http_code}" https://example.com/my.remote.tarball.gz
'/>





</table-code>