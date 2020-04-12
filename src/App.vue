<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)


export default {
  name: 'app',
  components: {

  }
}
</script>

<style lang="scss">

.kidsSite {
  background-color: rgb(11, 11, 37);

  .title {
    color: white;
  }

  .card {
    border-radius: 1.5rem;
  }

  .card-img, .card-img-bottom {
      border-bottom-right-radius: calc(1.5rem - 1px) !important;
      border-bottom-left-radius: calc(1.5rem - 1px) !important;
    }

    .card-img, .card-img-top {
      border-top-left-radius: calc(1.5rem - 1px) !important;
      border-top-right-radius: calc(1.5rem - 1px) !important;
    }
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  height: 100vh;

  .container {
    max-width: 1400px;
  }
}
</style>
