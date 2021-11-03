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
        <div>always-together@tsunagaru.love</div>
      </v-sheet>
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
      <!-- usersに格納された配列を元に表示する -->
      <!-- idとnameを子コンポーネントに渡す -->
      <!-- keyはあったほうがいいと思われる -->
      <vue-user-item v-for="user in users" v-bind:key="user.id" v-bind:name="user.name" v-bind:id="user.id"></vue-user-item>
    </v-navigation-drawer>

    <div v-if="isActive === '1'">
      <v-main>
        <v-container class="py-8 px-6" fluid>
            <v-card flat>
              <v-snackbar v-model="snackbar" absolute top right color="success">
                <span>Registration successful!</span>
                <v-icon dark>
                  mdi-checkbox-marked-circle
                </v-icon>
              </v-snackbar>
              <v-form ref="form" @submit.prevent="submit">
                <v-container fluid>
                  <v-row>
                    <v-col cols="12" sm="6">
                      <v-text-field v-model="form.first" :rules="rules.name" color="purple darken-2" label="First name" required>
                      </v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6">
                      <v-text-field v-model="form.last" :rules="rules.name" color="blud darken-2" label="Last name" required>
                      </v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-textarea
                        v-model="form.bio"
                        color="teal"
                      >
                        <template v-slot:label>
                          <div>
                            Bio <small>(optional)</small>
                          </div>
                        </template>
                      </v-textarea>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                    >
                      <v-select
                        v-model="form.favoriteAnimal"
                        :items="animals"
                        :rules="rules.animal"
                        color="pink"
                        label="Favorite animal"
                        required
                      ></v-select>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                    >
                      <v-slider
                        v-model="form.age"
                        :rules="rules.age"
                        color="orange"
                        label="Age"
                        hint="Be honest"
                        min="1"
                        max="100"
                        thumb-label
                      ></v-slider>
                    </v-col>
                    <v-col cols="12">
                      <v-checkbox
                        v-model="form.terms"
                        color="green"
                      >
                        <template v-slot:label>
                          <div @click.stop="">
                            Do you accept the
                            <a
                              href="#"
                              @click.prevent="terms = true"
                            >terms</a>
                            and
                            <a
                              href="#"
                              @click.prevent="conditions = true"
                            >conditions?</a>
                          </div>
                        </template>
                      </v-checkbox>
                    </v-col>
                  </v-row>
                </v-container>
                <v-card-actions>
                  <v-btn
                    text
                    @click="resetForm"
                  >
                    Cancel
                  </v-btn>
                  <v-spacer></v-spacer>
                  <v-btn
                    :disabled="!formIsValid"
                    text
                    color="primary"
                    type="submit"
                  >
                    Register
                  </v-btn>
                </v-card-actions>
              </v-form>
              <v-dialog
                v-model="terms"
                width="70%"
              >
                <v-card>
                  <v-card-title class="text-h6">
                    Terms
                  </v-card-title>
                  <v-card-text
                    v-for="n in 5"
                    :key="n"
                  >
                    {{ content }}
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                      text
                      color="purple"
                      @click="terms = false"
                    >
                      Ok
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
              <v-dialog
                v-model="conditions"
                width="70%"
              >
                <v-card>
                  <v-card-title class="text-h6">
                    Conditions
                  </v-card-title>
                  <v-card-text
                    v-for="n in 5"
                    :key="n"
                  >
                    {{ content }}
                  </v-card-text>
                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                      text
                      color="purple"
                      @click="conditions = false"
                    >
                      Ok
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </v-card>

        </v-container>
      </v-main> 
    </div>  

    <div v-if="isActive === '2'">
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

import vueUserItem from './vueUserItem';

export default {
  name: 'vueUser',
  data: function(){
    const defaultForm = Object.freeze({
        first: '',
        last: '',
        bio: '',
        favoriteAnimal: '',
        age: null,
        terms: false,
      })
    return {
      //usersがデータを入れる配列
      //この配列を編集すると自動的に表示に反映される
      users: [ {id: 1, name: 'ユーザー１'}, {id: 2, name: 'ユーザー２'}, {id: 3, name: 'ユーザー３'}],
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
      form: Object.assign({}, defaultForm),
        rules: {
          age: [
            val => val < 10 || `I don't believe you!`,
          ],
          animal: [val => (val || '').length > 0 || 'This field is required'],
          name: [val => (val || '').length > 0 || 'This field is required'],
        },
        animals: ['Dog', 'Cat', 'Rabbit', 'Turtle', 'Snake'],
        conditions: false,
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc.',
        snackbar: false,
        terms: false,
        defaultForm
    }
  },
  computed: {
    formIsValid () {
      return (
        this.form.first &&
        this.form.last &&
        this.form.favoriteAnimal &&
        this.form.terms
      )
    },
  },
  methods: {
    isSelect: function (num) {
      this.isActive = num;
    },
    resetForm () {
      this.form = Object.assign({}, this.defaultForm)
      this.$refs.form.reset()
    },
    submit () {
      this.snackbar = true
      this.resetForm()
    }
  },
  //子コンポーネントを指定する
  components: {
    'vue-user-item': vueUserItem
  }
}
</script>