(window.webpackJsonp=window.webpackJsonp||[]).push([[4,5,19],{321:function(t,n,r){},324:function(t,n,r){"use strict";r.r(n);var e={props:{tags:Array},data:function(){return{tags_to_colors:{practice:"lit",lab:"warning",development:"error",next:"warning"}}},methods:{get_tag_color:function(t){return t in this.tags_to_colors?this.tags_to_colors[t]:""}}},a=r(47),s=Object(a.a)(e,(function(){var t=this,n=t.$createElement,r=t._self._c||n;return r("div",t._l(t.tags,(function(n){return r("router-link",{key:n,attrs:{to:{path:"/tags.html#"+n}}},[r("Badge",{staticClass:"mr-3",attrs:{text:n,type:t.get_tag_color(n)}}),t._v(" "),r("span")],1)})),1)}),[],!1,null,null,null);n.default=s.exports},327:function(t,n,r){"use strict";r(321)},328:function(t,n,r){"use strict";r.d(n,"a",(function(){return a}));r(33),r(34),r(10),r(50),r(12),r(15),r(98);var e=r(65);function a(t,n){var r="undefined"!=typeof Symbol&&t[Symbol.iterator]||t["@@iterator"];if(!r){if(Array.isArray(t)||(r=Object(e.a)(t))||n&&t&&"number"==typeof t.length){r&&(t=r);var a=0,s=function(){};return{s:s,n:function(){return a>=t.length?{done:!0}:{done:!1,value:t[a++]}},e:function(t){throw t},f:s}}throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}var i,o=!0,l=!1;return{s:function(){r=r.call(t)},n:function(){var t=r.next();return o=t.done,t},e:function(t){l=!0,i=t},f:function(){try{o||null==r.return||r.return()}finally{if(l)throw i}}}}},356:function(t,n,r){"use strict";r.r(n);var e={components:{TagBadgeList:r(324).default},props:{title:String,description:String,link:String,tags:Array}},a=(r(327),r(47)),s=Object(a.a)(e,(function(){var t=this,n=t.$createElement,r=t._self._c||n;return r("div",{staticClass:"small-card"},[r("tag-badge-list",{attrs:{tags:t.tags}}),t._v(" "),r("router-link",{attrs:{to:{path:t.link}}},[r("h2",[t._v(t._s(t.title))]),t._v(" "),r("p",[t._v(t._s(t.description))])])],1)}),[],!1,null,null,null);n.default=s.exports},393:function(t,n,r){var e=r(1),a=r(394);e({target:"Array",proto:!0,forced:a!==[].lastIndexOf},{lastIndexOf:a})},394:function(t,n,r){"use strict";var e=r(14),a=r(49),s=r(13),i=r(36),o=Math.min,l=[].lastIndexOf,u=!!l&&1/[1].lastIndexOf(1,-0)<0,c=i("lastIndexOf"),f=u||!c;t.exports=f?function(t){if(u)return l.apply(this,arguments)||0;var n=e(this),r=s(n.length),i=r-1;for(arguments.length>1&&(i=o(i,a(arguments[1]))),i<0&&(i=r+i);i>=0;i--)if(i in n&&n[i]===t)return i||0;return-1}:l},404:function(t,n,r){"use strict";r.r(n);var e=r(328),a=(r(33),r(34),r(393),r(32),r(180),{components:{FeatureCard:r(356).default},mounted:function(){console.log("mounted"),this.getPagesInCurrentFolder();var t,n=[],r=Object(e.a)(this.pagesInCurrentFolder);try{for(r.s();!(t=r.n()).done;){var a,s,i=t.value;i.path!=this.folder_path&&n.push({name:i.title,description:null!==(a=i.description)&&void 0!==a?a:"",link:i.path,tags:null!==(s=i.frontmatter.tags)&&void 0!==s?s:[]})}}catch(t){r.e(t)}finally{r.f()}this.projects=n},data:function(){return{folder_path:"/projects/",projects:[],pagesInCurrentFolder:[]}},methods:{getPagesInCurrentFolder:function(){var t=this.$route.path.substring(0,this.$route.path.lastIndexOf("/"));this.pagesInCurrentFolder=this.$site.pages.filter((function(n){return n.path.startsWith(t)}))}}}),s=r(47),i=Object(s.a)(a,(function(){var t=this.$createElement,n=this._self._c||t;return n("div",{staticClass:"features row"},this._l(this.projects,(function(t){return n("div",{key:t.name,staticClass:"feature col-sm-6"},[n("feature-card",{attrs:{title:t.name,link:t.link,description:t.description,tags:t.tags}})],1)})),0)}),[],!1,null,null,null);n.default=i.exports}}]);