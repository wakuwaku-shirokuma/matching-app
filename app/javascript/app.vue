<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>birth</th>
          <th>gender</th>
          <th>joined_date</th>
          <th>note</th>
        </tr>
        <tr v-for="e in users" :key="e.id">
          <td>{{ e.id }}</td>
          <td>{{ e.name }}</td>
          <td>{{ e.birth }}</td>
          <td>{{ e.gender }}</td>
          <td>{{ e.joined_date }}</td>
          <td>{{ e.note }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      users: []
    }
  },
  mounted () {
    axios
      .get('/api/v1/users.json')
      .then(response => (this.users = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
