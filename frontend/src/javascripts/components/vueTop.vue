<template>
  <div>
    <div>{{message}}</div>
  </div>
</template>
<script>

export default {
  name: 'vueTop',
  data: function(){
    return {
      //表示したいメッセージ
      message: 'ここはTopです'
    }
  }
}
</script>