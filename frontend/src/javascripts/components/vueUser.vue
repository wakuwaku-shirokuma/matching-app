<template>
  <v-app id="inspire">

    <!-- SideBar -->
    <v-navigation-drawer v-model="drawer" app>
      <vue-profile></vue-profile>
      <v-divider></v-divider>
      <v-list>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('1')">プロフィール詳細・編集</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('2')">お相手一覧</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('3')">お役立ちコラム</v-list-item-title>
          </v-list-item-content>    
        </v-list-item>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title @click="isSelect('4')">現在のつながり</v-list-item-title>
          </v-list-item-content> 
        </v-list-item>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>ログアウト</v-list-item-title>
          </v-list-item-content> 
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <!-- ProfileDetail -->
    <div v-if="isActive === '1'">
      <vue-profile-detail></vue-profile-detail>
    </div>  

    <!-- Partner -->
    <div v-if="isActive === '2'">
      <vue-partner></vue-partner>
    </div>  

    <!-- Column -->
    <div v-else-if="isActive === '3'">
      <vue-column></vue-column>
    </div>

    <div v-else-if="isActive === '4'">
      <v-main>
        <v-container class="py-8 px-6" fluid>
          その４
        </v-container>
      </v-main>
    </div>

  </v-app>
</template>

<script>

import vueProfile from './vueProfile';
import vueProfileDetail from './vueProfileDetail';
import vuePartner from './vuePartner';
import vueColumn from './vueColumn';

export default {
  name: 'vueUser',
  data: function(){
    return {
      drawer: null,
      isActive: "1"
    }
  },
  methods: {
    isSelect: function (num) {
      this.isActive = num;
    }
  },
  //子コンポーネントを指定する
  components: {
    'vue-profile': vueProfile,
    'vue-profile-detail': vueProfileDetail,
    'vue-partner': vuePartner,
    'vue-column': vueColumn
  }
}
</script>