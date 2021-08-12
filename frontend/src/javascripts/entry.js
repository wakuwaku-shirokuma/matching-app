import Vue from 'vue';
import vueUser from './components/vueUser';
import vueTop from './components/vueTop';
import vuetify from "./plugins/vuetify.js";

document.addEventListener("DOMContentLoaded", function(event) {
  new Vue({
    el: '#app',
    data: {
      name: 'aaa'
    },
    components: {
      'vue-user': vueUser,
      'vue-top': vueTop
    },
    vuetify
  });
});