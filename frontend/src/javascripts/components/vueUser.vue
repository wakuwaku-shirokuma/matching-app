<template>
  <v-app id="inspire">

    <v-system-bar app>
      <v-spacer></v-spacer>
      <v-icon>mdi-square</v-icon>
      <v-icon>mdi-circle</v-icon>
      <v-icon>mdi-triangle</v-icon>
    </v-system-bar>

    <v-navigation-drawer v-model="drawer" app>
      <v-sheet color="grey lighten-4" class="pa-4">
        <v-avatar class="mb-4" color="grey darken-1" size="64">
        </v-avatar>
        <div>john@vuetifyjs.com</div>
      </v-sheet>
      <v-divider></v-divider>
      <v-list>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('1')">お相手一覧</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('2')">お役立ちコラム</v-list-item-title>
          </v-list-item-content>    
        </v-list-item>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('3')">現在のつながり</v-list-item-title>
          </v-list-item-content> 
        </v-list-item>
      </v-list>
      <!-- usersに格納された配列を元に表示する -->
      <!-- idとnameを子コンポーネントに渡す -->
      <!-- keyはあったほうがいいと思われる -->
      <vue-user-item v-for="user in users" v-bind:key="user.id" v-bind:name="user.name" v-bind:id="user.id"></vue-user-item>
    </v-navigation-drawer>

    <div v-if="isActive === '1'">
      <v-main>
        <v-container class="py-8 px-6" fluid>
          <v-row>
            <v-col v-for="card in cards" :key="card" cols="12">
              <v-card>
                <v-subheader>{{ card }}</v-subheader>
                <v-list two-line>
                  <template v-for="n in 6">
                    <v-list-item :key="n">
                      <v-list-item-avatar color="grey darken-1"></v-list-item-avatar>
                      <v-list-item-content>
                        <v-list-item-title>Message {{ n }}</v-list-item-title>
                        <v-list-item-subtitle>
                          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil repellendus distinctio similique
                        </v-list-item-subtitle>
                      </v-list-item-content>
                    </v-list-item>
                    <v-divider v-if="n !== 6" :key="`divider-${n}`" inset></v-divider>
                  </template>
                </v-list>
              </v-card>
            </v-col>
          </v-row>
        </v-container>
      </v-main>
    </div>  

    <div v-else-if="isActive === '2'">
      <v-main>
        <v-container class="py-8 px-6" fluid>
          その２
        </v-container>
      </v-main>  
    </div>

    <div v-else-if="isActive === '3'">
      <v-main>
        <v-container class="py-8 px-6" fluid>
          その３
        </v-container>
      </v-main>
    </div>

  </v-app>
</template>

<script>

import vueUserItem from './vueUserItem';

export default {
  name: 'vueUser',
  data: function(){
    return {
      //usersがデータを入れる配列
      //この配列を編集すると自動的に表示に反映される
      users: [ {id: 1, name: 'sample1'}, {id: 2, name: 'sample2'}, {id: 3, name: 'Sample3'}],
      //表示したいメッセージ
      message: 'Message',
      cards: ['Today', 'Yesterday'],
      drawer: null,
      isActive: "1",
      //links: [
      //  ['1', 'その１'],
      //  ['2', 'その２'],
      //  ['3', 'その３'],
      //]
    }
  },
  methods: {
    isSelect: function (num) {
      this.isActive = num;
    }
  },
  //子コンポーネントを指定する
  components: {
    'vue-user-item': vueUserItem
  }
}
</script>