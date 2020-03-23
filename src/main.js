import Vue from 'vue'
import App from './App.vue'

// import store from './store/store'
import router from './router/router'

Vue.config.productionTip = false
export const serverBus = new Vue();

new Vue({
  router,
  // store,
  render: h => h(App)
}).$mount('#app')