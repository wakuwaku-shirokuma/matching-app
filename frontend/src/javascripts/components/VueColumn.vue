<template>
  <v-main>
    <v-container class="py-8 px-6" fluid>
      <v-row>
        <v-col v-for="n in 24" :key="n" cols="4">
          <v-card height="200"></v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>  
</template>