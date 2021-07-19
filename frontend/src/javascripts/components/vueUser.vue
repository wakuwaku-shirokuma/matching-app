<template>
  <div>
    <div>{{message}}</div>
    <div>
      <!-- usersに格納された配列を元に表示する -->
      <!-- idとnameを子コンポーネントに渡す -->
      <!-- keyはあったほうがいいと思われる -->
      <vue-user-item v-for="user in users" 
        v-bind:key="user.id"
        v-bind:name="user.name"
        v-bind:id="user.id" 
      >
      </vue-user-item>
    </div>
  </div>
</template>
<script>
import vueUserItem from './vueUserItem';

export default {
  name: 'vueUser',
  data: function(){
    return {
      //usersがデータを入れる配列
      //この配列を編集すると自動的に表示に反映される
      users: [
        {
          id: 1,
          name: 'sample1'
        },
        {
          id: 2,
          name: 'sample2'
        },
        {
          id: 3,
          name: 'Sample3'
        }
     ],
      //表示したいメッセージ
      message: 'Message'
    }
  },
  //子コンポーネントを指定する
  components: {
    'vue-user-item': vueUserItem
  }
}
</script>