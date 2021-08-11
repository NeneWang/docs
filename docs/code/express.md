---
title: Express
lang: en-US
tags: ["practice", "lab"]
---

# {{ $frontmatter.title }}

<TagBadge />

&nbsp;
&nbsp;
- Credit and Sources:
  - [Devhints](https://devhints.io/express)


&nbsp;
Table of Contents:
- [{{ $frontmatter.title }}](#-frontmattertitle-)
  - [🎯 Practice](#-practice)
  - [💻 Quick tables](#-quick-tables)
- [📖 Expanded Cheat Sheet](#-expanded-cheat-sheet)

## 🎯 Practice
- W3School Excercise | PHP 

## 💻 Quick tables

<table-code>

<table-row-code title="Settings"  
code="
app.set('x', 'yyy')
app.get('x') ..'yyy'
app.enable('trust proxy')
app.disable('trust proxy')
app.enabled('trust proxy')  // true
" />

<table-row-code title="Request"  
code="
// GET  /user/tj
req.path         ///user/tj
req.url          ///user/tj
req.xhr          //rue|fals
req.method       //GET
req.params
req.params.name  //tj
req.params[0]
" />

<table-row-code title="Settings"  
code="
app.set('x', 'yyy')
app.get('x') ..'yyy'
app.enable('trust proxy')
app.disable('trust proxy')
app.enabled('trust proxy')  // true
" />

<table-row-code title="Request"  
code="
// GET /search?q=tobi+ferret
req.query.q // tobi ferret
" />

<table-row-code title="Cookies"  
code="
req.cookies
" />

<table-row-code title="Response | Redirect"  
code="
res.redirect('/')
res.redirect(301, '/')
" />

<table-row-code title="Response | Set"  
code="
res.set('Content-Type', 'text/html')
" />

<table-row-code title="Response | Send"  
code="
res.send('hi')
res.send(200, 'hi')
" />

<table-row-code title="Response | json"  
code="
res.json({ a: 2 })
" />

</table-code>

# 📖 Expanded Cheat Sheet