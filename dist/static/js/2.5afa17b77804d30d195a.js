webpackJsonp([2],{506:function(t,e,r){r(578);var n=r(198)(r(544),r(565),null,null);t.exports=n.exports},513:function(t,e,r){"use strict";function n(t){var e,r;this.promise=new t(function(t,n){if(void 0!==e||void 0!==r)throw TypeError("Bad Promise constructor");e=t,r=n}),this.resolve=o(e),this.reject=o(r)}var o=r(196);t.exports.f=function(t){return new n(t)}},514:function(t,e,r){var n=r(136),o=r(49)("toStringTag"),i="Arguments"==n(function(){return arguments}()),c=function(t,e){try{return t[e]}catch(t){}};t.exports=function(t){var e,r,u;return void 0===t?"Undefined":null===t?"Null":"string"==typeof(r=c(e=Object(t),o))?r:i?n(e):"Object"==(u=n(e))&&"function"==typeof e.callee?"Arguments":u}},515:function(t,e){t.exports=function(t){try{return{e:!1,v:t()}}catch(t){return{e:!0,v:t}}}},516:function(t,e,r){var n=r(64),o=r(65),i=r(513);t.exports=function(t,e){if(n(t),o(e)&&e.constructor===t)return e;var r=i.f(t);return(0,r.resolve)(e),r.promise}},517:function(t,e,r){var n=r(64),o=r(196),i=r(49)("species");t.exports=function(t,e){var r,c=n(t).constructor;return void 0===c||void 0==(r=n(c)[i])?e:o(r)}},518:function(t,e,r){var n,o,i,c=r(197),u=r(526),s=r(200),a=r(137),f=r(33),l=f.process,p=f.setImmediate,v=f.clearImmediate,h=f.MessageChannel,m=f.Dispatch,d=0,_={},y=function(){var t=+this;if(_.hasOwnProperty(t)){var e=_[t];delete _[t],e()}},x=function(t){y.call(t.data)};p&&v||(p=function(t){for(var e=[],r=1;arguments.length>r;)e.push(arguments[r++]);return _[++d]=function(){u("function"==typeof t?t:Function(t),e)},n(d),d},v=function(t){delete _[t]},"process"==r(136)(l)?n=function(t){l.nextTick(c(y,t,1))}:m&&m.now?n=function(t){m.now(c(y,t,1))}:h?(o=new h,i=o.port2,o.port1.onmessage=x,n=c(i.postMessage,i,1)):f.addEventListener&&"function"==typeof postMessage&&!f.importScripts?(n=function(t){f.postMessage(t+"","*")},f.addEventListener("message",x,!1)):n="onreadystatechange"in a("script")?function(t){s.appendChild(a("script")).onreadystatechange=function(){s.removeChild(this),y.call(t)}}:function(t){setTimeout(c(y,t,1),0)}),t.exports={set:p,clear:v}},519:function(t,e,r){"use strict";e.a={SERVER_HOST:"http://fsociety.ink/repair"}},520:function(t,e,r){t.exports={default:r(523),__esModule:!0}},521:function(t,e,r){"use strict";e.__esModule=!0;var n=r(520),o=function(t){return t&&t.__esModule?t:{default:t}}(n);e.default=function(t){return function(){var e=t.apply(this,arguments);return new o.default(function(t,r){function n(i,c){try{var u=e[i](c),s=u.value}catch(t){return void r(t)}if(!u.done)return o.default.resolve(s).then(function(t){n("next",t)},function(t){n("throw",t)});t(s)}return n("next")})}}},522:function(t,e,r){t.exports=r(537)},523:function(t,e,r){r(202),r(203),r(204),r(534),r(535),r(536),t.exports=r(63).Promise},524:function(t,e){t.exports=function(t,e,r,n){if(!(t instanceof e)||void 0!==n&&n in t)throw TypeError(r+": incorrect invocation!");return t}},525:function(t,e,r){var n=r(197),o=r(528),i=r(527),c=r(64),u=r(201),s=r(533),a={},f={},e=t.exports=function(t,e,r,l,p){var v,h,m,d,_=p?function(){return t}:s(t),y=n(r,l,e?2:1),x=0;if("function"!=typeof _)throw TypeError(t+" is not iterable!");if(i(_)){for(v=u(t.length);v>x;x++)if((d=e?y(c(h=t[x])[0],h[1]):y(t[x]))===a||d===f)return d}else for(m=_.call(t);!(h=m.next()).done;)if((d=o(m,y,h.value,e))===a||d===f)return d};e.BREAK=a,e.RETURN=f},526:function(t,e){t.exports=function(t,e,r){var n=void 0===r;switch(e.length){case 0:return n?t():t.call(r);case 1:return n?t(e[0]):t.call(r,e[0]);case 2:return n?t(e[0],e[1]):t.call(r,e[0],e[1]);case 3:return n?t(e[0],e[1],e[2]):t.call(r,e[0],e[1],e[2]);case 4:return n?t(e[0],e[1],e[2],e[3]):t.call(r,e[0],e[1],e[2],e[3])}return t.apply(r,e)}},527:function(t,e,r){var n=r(87),o=r(49)("iterator"),i=Array.prototype;t.exports=function(t){return void 0!==t&&(n.Array===t||i[o]===t)}},528:function(t,e,r){var n=r(64);t.exports=function(t,e,r,o){try{return o?e(n(r)[0],r[1]):e(r)}catch(e){var i=t.return;throw void 0!==i&&n(i.call(t)),e}}},529:function(t,e,r){var n=r(49)("iterator"),o=!1;try{var i=[7][n]();i.return=function(){o=!0},Array.from(i,function(){throw 2})}catch(t){}t.exports=function(t,e){if(!e&&!o)return!1;var r=!1;try{var i=[7],c=i[n]();c.next=function(){return{done:r=!0}},i[n]=function(){return c},t(i)}catch(t){}return r}},530:function(t,e,r){var n=r(33),o=r(518).set,i=n.MutationObserver||n.WebKitMutationObserver,c=n.process,u=n.Promise,s="process"==r(136)(c);t.exports=function(){var t,e,r,a=function(){var n,o;for(s&&(n=c.domain)&&n.exit();t;){o=t.fn,t=t.next;try{o()}catch(n){throw t?r():e=void 0,n}}e=void 0,n&&n.enter()};if(s)r=function(){c.nextTick(a)};else if(i){var f=!0,l=document.createTextNode("");new i(a).observe(l,{characterData:!0}),r=function(){l.data=f=!f}}else if(u&&u.resolve){var p=u.resolve();r=function(){p.then(a)}}else r=function(){o.call(n,a)};return function(n){var o={fn:n,next:void 0};e&&(e.next=o),t||(t=o,r()),e=o}}},531:function(t,e,r){var n=r(51);t.exports=function(t,e,r){for(var o in e)r&&t[o]?t[o]=e[o]:n(t,o,e[o]);return t}},532:function(t,e,r){"use strict";var n=r(33),o=r(63),i=r(52),c=r(50),u=r(49)("species");t.exports=function(t){var e="function"==typeof o[t]?o[t]:n[t];c&&e&&!e[u]&&i.f(e,u,{configurable:!0,get:function(){return this}})}},533:function(t,e,r){var n=r(514),o=r(49)("iterator"),i=r(87);t.exports=r(63).getIteratorMethod=function(t){if(void 0!=t)return t[o]||t["@@iterator"]||i[n(t)]}},534:function(t,e,r){"use strict";var n,o,i,c,u=r(89),s=r(33),a=r(197),f=r(514),l=r(86),p=r(65),v=r(196),h=r(524),m=r(525),d=r(517),_=r(518).set,y=r(530)(),x=r(513),g=r(515),w=r(516),b=s.TypeError,P=s.process,j=s.Promise,R="process"==f(P),k=function(){},E=o=x.f,S=!!function(){try{var t=j.resolve(1),e=(t.constructor={})[r(49)("species")]=function(t){t(k,k)};return(R||"function"==typeof PromiseRejectionEvent)&&t.then(k)instanceof e}catch(t){}}(),O=function(t){var e;return!(!p(t)||"function"!=typeof(e=t.then))&&e},T=function(t,e){if(!t._n){t._n=!0;var r=t._c;y(function(){for(var n=t._v,o=1==t._s,i=0;r.length>i;)!function(e){var r,i,c=o?e.ok:e.fail,u=e.resolve,s=e.reject,a=e.domain;try{c?(o||(2==t._h&&F(t),t._h=1),!0===c?r=n:(a&&a.enter(),r=c(n),a&&a.exit()),r===e.promise?s(b("Promise-chain cycle")):(i=O(r))?i.call(r,u,s):u(r)):s(n)}catch(t){s(t)}}(r[i++]);t._c=[],t._n=!1,e&&!t._h&&C(t)})}},C=function(t){_.call(s,function(){var e,r,n,o=t._v,i=M(t);if(i&&(e=g(function(){R?P.emit("unhandledRejection",o,t):(r=s.onunhandledrejection)?r({promise:t,reason:o}):(n=s.console)&&n.error&&n.error("Unhandled promise rejection",o)}),t._h=R||M(t)?2:1),t._a=void 0,i&&e.e)throw e.v})},M=function(t){if(1==t._h)return!1;for(var e,r=t._a||t._c,n=0;r.length>n;)if(e=r[n++],e.fail||!M(e.promise))return!1;return!0},F=function(t){_.call(s,function(){var e;R?P.emit("rejectionHandled",t):(e=s.onrejectionhandled)&&e({promise:t,reason:t._v})})},$=function(t){var e=this;e._d||(e._d=!0,e=e._w||e,e._v=t,e._s=2,e._a||(e._a=e._c.slice()),T(e,!0))},A=function(t){var e,r=this;if(!r._d){r._d=!0,r=r._w||r;try{if(r===t)throw b("Promise can't be resolved itself");(e=O(t))?y(function(){var n={_w:r,_d:!1};try{e.call(t,a(A,n,1),a($,n,1))}catch(t){$.call(n,t)}}):(r._v=t,r._s=1,T(r,!1))}catch(t){$.call({_w:r,_d:!1},t)}}};S||(j=function(t){h(this,j,"Promise","_h"),v(t),n.call(this);try{t(a(A,this,1),a($,this,1))}catch(t){$.call(this,t)}},n=function(t){this._c=[],this._a=void 0,this._s=0,this._d=!1,this._v=void 0,this._h=0,this._n=!1},n.prototype=r(531)(j.prototype,{then:function(t,e){var r=E(d(this,j));return r.ok="function"!=typeof t||t,r.fail="function"==typeof e&&e,r.domain=R?P.domain:void 0,this._c.push(r),this._a&&this._a.push(r),this._s&&T(this,!1),r.promise},catch:function(t){return this.then(void 0,t)}}),i=function(){var t=new n;this.promise=t,this.resolve=a(A,t,1),this.reject=a($,t,1)},x.f=E=function(t){return t===j||t===c?new i(t):o(t)}),l(l.G+l.W+l.F*!S,{Promise:j}),r(90)(j,"Promise"),r(532)("Promise"),c=r(63).Promise,l(l.S+l.F*!S,"Promise",{reject:function(t){var e=E(this);return(0,e.reject)(t),e.promise}}),l(l.S+l.F*(u||!S),"Promise",{resolve:function(t){return w(u&&this===c?j:this,t)}}),l(l.S+l.F*!(S&&r(529)(function(t){j.all(t).catch(k)})),"Promise",{all:function(t){var e=this,r=E(e),n=r.resolve,o=r.reject,i=g(function(){var r=[],i=0,c=1;m(t,!1,function(t){var u=i++,s=!1;r.push(void 0),c++,e.resolve(t).then(function(t){s||(s=!0,r[u]=t,--c||n(r))},o)}),--c||n(r)});return i.e&&o(i.v),r.promise},race:function(t){var e=this,r=E(e),n=r.reject,o=g(function(){m(t,!1,function(t){e.resolve(t).then(r.resolve,n)})});return o.e&&n(o.v),r.promise}})},535:function(t,e,r){"use strict";var n=r(86),o=r(63),i=r(33),c=r(517),u=r(516);n(n.P+n.R,"Promise",{finally:function(t){var e=c(this,o.Promise||i.Promise),r="function"==typeof t;return this.then(r?function(r){return u(e,t()).then(function(){return r})}:t,r?function(r){return u(e,t()).then(function(){throw r})}:t)}})},536:function(t,e,r){"use strict";var n=r(86),o=r(513),i=r(515);n(n.S,"Promise",{try:function(t){var e=o.f(this),r=i(t);return(r.e?e.reject:e.resolve)(r.v),e.promise}})},537:function(t,e,r){var n=function(){return this}()||Function("return this")(),o=n.regeneratorRuntime&&Object.getOwnPropertyNames(n).indexOf("regeneratorRuntime")>=0,i=o&&n.regeneratorRuntime;if(n.regeneratorRuntime=void 0,t.exports=r(205),o)n.regeneratorRuntime=i;else try{delete n.regeneratorRuntime}catch(t){n.regeneratorRuntime=void 0}},544:function(t,e,r){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=r(522),o=r.n(n),i=r(521),c=r.n(i),u=r(519);e.default={data:function(){return{form:{computer_class:"",computer_on:""},rules:{computer_class:{required:!0,message:"请输入电脑机房",trigger:"blur"},computer_no:{required:!0,message:"请输入电脑座号",trigger:"blur"}}}},methods:{addComputer:function(t,e){var r=this;return c()(o.a.mark(function n(){var i;return o.a.wrap(function(n){for(;;)switch(n.prev=n.next){case 0:return n.prev=0,console.log(),n.next=4,r.$http.post(u.a.SERVER_HOST+"/api/v1/computers",{computer_class:t,computer_no:e});case 4:i=n.sent,r.form.computer_class="",r.form.computer_no="",r.$message.success("添加电脑成功"+t+" "+e),r.toComputer(),n.next=14;break;case 11:n.prev=11,n.t0=n.catch(0),console.log(n.t0);case 14:case"end":return n.stop()}},n,r,[[0,11]])}))()},toComputer:function(){this.$router.push({path:"/computer"})},onSubmit:function(){var t=this;this.$refs[this.form].validate(function(e){e&&t.addComputer(t.form.computer_class,t.form.computer_no)})}}}},551:function(t,e,r){e=t.exports=r(88)(void 0),e.push([t.i,".pagination{display:flex;justify-content:space-between;align-items:center}",""])},565:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("div",{staticClass:"computerform"},[r("div",{staticClass:"form-box"},[r("el-form",{ref:t.form,attrs:{ref:"form",model:t.form,rules:t.rules,"label-width":"80px"}},[r("el-form-item",{attrs:{label:"电脑机房",prop:"computer_class"}},[r("el-input",{attrs:{placeholder:"请输入机房号"},model:{value:t.form.computer_class,callback:function(e){t.$set(t.form,"computer_class",e)},expression:"form.computer_class"}})],1),t._v(" "),r("el-form-item",{attrs:{label:"电脑座号",prop:"computer_no"},nativeOn:{keyup:function(e){if(!("button"in e)&&t._k(e.keyCode,"enter",13,e.key))return null;t.onSubmit(e)}}},[r("el-input",{attrs:{type:"number",placeholder:"请输入电脑座号"},model:{value:t.form.computer_no,callback:function(e){t.$set(t.form,"computer_no",e)},expression:"form.computer_no"}})],1),t._v(" "),r("el-form-item",[r("el-button",{attrs:{type:"primary"},on:{click:t.onSubmit}},[t._v("添加电脑")]),t._v(" "),r("el-button",{on:{click:t.toComputer}},[t._v("取消")])],1)],1)],1)])},staticRenderFns:[]}},578:function(t,e,r){var n=r(551);"string"==typeof n&&(n=[[t.i,n,""]]),n.locals&&(t.exports=n.locals);r(199)("32452411",n,!0)}});