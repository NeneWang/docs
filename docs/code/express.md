---
title: Express
lang: en-US
tags: [ "lab"]
---

# {{ $frontmatter.title }}

<TagBadge />

&nbsp;
&nbsp;
- Credit and Sources:
  - [Devhints - Express](https://devhints.io/express)
  - [Objectrocket.com - Mongoose](https://kb.objectrocket.com/mongo-db/the-mongoose-cheat-sheet-225)


&nbsp;
Table of Contents:
[[toc]]

## 🎯 Practice
- [Mongoose Practice (Hard) - forevernitch ](https://quizlet.com/484787929/mongoose-flash-cards/)

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


## 💾 Mongoose Quick Tables

<table-code>

<table-row-code title="Product Schema"  
code='
var mongoose = require("mongoose");
var Schema = mongoose.Schema;
var ProductSchema = new Schema({ 
  name: {
    type: String,
    required: true
  },
  brand: {
    type: String,
    required: false
  },
  order: {
    type: Schema.Types.ObjectId,
    ref: "Order"
  }
});
var Product = mongoose.model("Product", ProductSchema);
// Export the Article model
module.exports = Product;
' />

<table-row-code title="Product Schema"  
code="
res.json({ a: 2 })
" />

<table-row-code title="Creating Documents based on the model" 
code='
var mongoose = require("mongoose");
var db = require("./models");
mongoose.connect("mongodb://localhost:27017/grocerydb", { useNewUrlParser: true });
' />



<table-row-code title="Creating Documents | with an array" 
code='
var product = { name: "Soda", brand: "demoBrand" };
db.Product.create(product)
.then(function(dbProduct) {
    console.log(dbProduct);
})
.catch(function(err) {
    console.log(err);
});
' />


<table-row-code title="Finding documents" 
code='
var mongoose = require("mongoose");
var db = require("./models");
mongoose.connect("mongodb://localhost:27017/grocerydb", { useNewUrlParser: true });
' />

<table-row-code title="Updating" 
code="
db.Product.updateOne({ name: 'Soda' }, { brand: 'newBrand' });
db.Product.updateMany({ brand: 'demoBrand' }, { quantity: 500 });
" />

<table-row-code title="Delete Documents" 
code="
 db.Product.deleteOne({ name: 'Soda' });
 db.Product.deleteMany({ quantity: { $gte: 100 } });
" />

</table-code>