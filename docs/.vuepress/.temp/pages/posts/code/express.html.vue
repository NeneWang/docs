<template><div>
<p> 
 </p>
<ul>
<li>Credits:
<ul>
<li><a href="https://devhints.io/express" target="_blank" rel="noopener noreferrer">Devhints - Express<ExternalLinkIcon/></a></li>
<li><a href="https://kb.objectrocket.com/mongo-db/the-mongoose-cheat-sheet-225" target="_blank" rel="noopener noreferrer">Objectrocket.com - Mongoose<ExternalLinkIcon/></a></li>
</ul>
</li>
</ul>
<p> 
Table of Contents:</p>
<nav class="table-of-contents"><ul><li><router-link to="#🎯-practice">🎯 Practice</router-link></li><li><router-link to="#💻-quick-tables">💻 Quick tables</router-link></li><li><router-link to="#💾-mongoose-quick-tables">💾 Mongoose Quick Tables</router-link></li></ul></nav>
<h2 id="🎯-practice" tabindex="-1"><a class="header-anchor" href="#🎯-practice"><span>🎯 Practice</span></a></h2>
<ul>
<li><a href="https://quizlet.com/484787929/mongoose-flash-cards/" target="_blank" rel="noopener noreferrer">Mongoose Practice (Hard) - forevernitch <ExternalLinkIcon/></a></li>
</ul>
<h2 id="💻-quick-tables" tabindex="-1"><a class="header-anchor" href="#💻-quick-tables"><span>💻 Quick tables</span></a></h2>
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
<h2 id="💾-mongoose-quick-tables" tabindex="-1"><a class="header-anchor" href="#💾-mongoose-quick-tables"><span>💾 Mongoose Quick Tables</span></a></h2>
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
</table-code></div></template>


