(window.webpackJsonp=window.webpackJsonp||[]).push([[4,14],{319:function(t,r,n){},320:function(t,r,n){"use strict";n.r(r);var s={props:{tags:Array},data:function(){return{tags_to_colors:{practice:"lit",lab:"warning",development:"error",next:"warning"}}},methods:{get_tag_color:function(t){return t in this.tags_to_colors?this.tags_to_colors[t]:""}}},a=n(47),e=Object(a.a)(s,(function(){var t=this,r=t.$createElement,n=t._self._c||r;return n("div",t._l(t.tags,(function(r){return n("router-link",{key:r,attrs:{to:{path:"/tags.html#"+r}}},[n("Badge",{staticClass:"mr-3",attrs:{text:r,type:t.get_tag_color(r)}}),t._v(" "),n("span")],1)})),1)}),[],!1,null,null,null);r.default=e.exports},323:function(t,r,n){"use strict";n(319)},349:function(t,r,n){"use strict";n.r(r);var s={components:{TagBadgeList:n(320).default},props:{title:String,description:String,link:String,tags:Array}},a=(n(323),n(47)),e=Object(a.a)(s,(function(){var t=this,r=t.$createElement,n=t._self._c||r;return n("div",{staticClass:"small-card"},[n("tag-badge-list",{attrs:{tags:t.tags}}),t._v(" "),n("router-link",{attrs:{to:{path:t.link}}},[n("h2",[t._v(t._s(t.title))]),t._v(" "),n("p",[t._v(t._s(t.description))])])],1)}),[],!1,null,null,null);r.default=e.exports}}]);