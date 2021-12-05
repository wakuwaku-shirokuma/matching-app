<template>
    <v-main>
        <v-container class="py-8 px-6" fluid>
          <v-row>
            <v-col v-for="card in cards" :key="card" cols="12">
              <v-card>
                <v-subheader>{{ card }}</v-subheader>
                <v-list two-line>
                  <template v-for="n in 3">
                    <v-list-item :key="n">
                      <v-list-item-avatar color="grey darken-1"></v-list-item-avatar>
                      <v-list-item-content>
                        <v-list-item-title>Message {{ n }}</v-list-item-title>
                        <v-list-item-subtitle>
                          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil repellendus distinctio similique
                        </v-list-item-subtitle>
                      </v-list-item-content>
                    </v-list-item>
                    <v-divider v-if="n !== 3" :key="`divider-${n}`" inset></v-divider>
                  </template>
                </v-list>
              </v-card>
            </v-col>
          </v-row>
          <!-- usersに格納された配列を元に表示する -->
          <!-- idとnameを子コンポーネントに渡す -->
          <!-- keyはあったほうがいいと思われる -->
          <vue-user-item v-for="user in users" v-bind:key="user.id" v-bind:name="user.name" v-bind:id="user.id"></vue-user-item>
        </v-container>
    </v-main>
</template>

<script>

import vueUserItem from './vueUserItem';

export default {
  name: 'vuePartner',
  data: function(){
    return {
      //usersがデータを入れる配列
      //この配列を編集すると自動的に表示に反映される
      users: [ {id: 1, name: 'ユーザー１'}, {id: 2, name: 'ユーザー２'}, {id: 3, name: 'ユーザー３'}],
      //表示したいメッセージ
      message: 'Message',
      cards: ['Today', 'Yesterday'],
    }
  },
  //子コンポーネントを指定する
  components: {
    'vue-user-item': vueUserItem
  }
}
</script>