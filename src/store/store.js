import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isAuthenticated: false
  },

  // You can use it as a state getter function (probably the best solution)
  getters: {
    isAuthenticated () {
      return vueAuth.isAuthenticated()
    }
  },

  // Mutation for when you use it as state property
  mutations: {
    isAuthenticated (state, payload) {
      state.isAuthenticated = payload.isAuthenticated
    }
  },

  actions: {

    // Perform VueAuthenticate login using Vuex actions
    login (context, payload) {

      vueAuth.login(payload.user, payload.requestOptions).then((response) => {
        context.commit('isAuthenticated', {
          isAuthenticated: vueAuth.isAuthenticated()
        })
      })

    }
  }
});