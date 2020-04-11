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
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;

  .container {
    max-width: 1400px;
  }
    @media only screen 
  and (min-device-width: 320px) 
  and (max-device-width: 568px)
  and (-webkit-min-device-pixel-ratio: 2) {

.splashback .rightsplash{
  display: none !important;
}

.leftsplash{
  flex: none;
  max-width: none;
}

.container{
  display:flex;
  flex-direction: column;
}
// .row{

// margin-top: 2.5vh;
//     display: flex;
//     flex-direction: column;
//     min-width: 2000px;
//     margin: auto;

// }
}

@media only screen 
  and (min-device-width: 768px) 
  and (max-device-width: 1024px) 
  and (-webkit-min-device-pixel-ratio: 1) {
.splashback .rightsplash{
  display: none !important;
}

.leftsplash{
  flex: none;
  max-width: none;
}
}
}
</style>
