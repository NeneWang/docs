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
- [usessionbuddy - Awk Cheatsheet](https://www.usessionbuddy.com/post/Awk-Cheatsheet-And-Examples/)

cat cars.csv | head -2
> mpg, cylinders, cubicinches, hp, weightlbs, time-to-60, year, brand
> 14,8,350,165,4209,12,1972, US.

### Print Columns in AWK

<br>

```awk 'BEGIN {FS=","} {print $2}' < cars.csv | head -2```
 > cylinders
 > 8


<br>

```awk 'BEGIN {FS=","} {print $2,$3,$4}' < cars.csv | head -2```
 > cylinders  cubicinches  hp
 > 8 350 165

 ### Arrays In AWK

<br>

```awk 'BEGIN {a[1]=2;print a[1]}'```
 > cylinders
 > 8

 ````
awk 'BEGIN {
      for (i=0 ;i <5; i++) {
          b[i] = 1
      }
      #Loop through awk array b
      for (elem in b) {
          print elem
      }
  }'
````
> 4
> 0
> 1
> 2
> 3

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