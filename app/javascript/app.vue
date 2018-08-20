<template>
  <div id="app">
    <p v-bind:title="titleString">{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
        message: "Hello Vue!",
        titleString: "Hello Title string"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
