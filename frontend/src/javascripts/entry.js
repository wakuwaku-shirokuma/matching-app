import Vue from 'vue';
import vueUser from './components/vueUser';

document.addEventListener("DOMContentLoaded", function(event) {
  new Vue({
    el: '#app',
    data: {
      name: 'aaa'
    },
    components: {
      'vue-user': vueUser
    }
  });
});