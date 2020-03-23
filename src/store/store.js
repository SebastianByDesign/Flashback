import Vuex from 'vuex'
import Vue from 'vue'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    movies: []
  },

  actions: {
    getMovies({commit}) {
      Vue.axios.get('/api/index').then(
        response => {
          //console.log(response);
          commit('UPDATE_MOVIES', response.data);
        },
        err => {
          console.log(err);
        }
      );
    }
  },
  
  getters: {
    // Here we will create a getter
  },
  
  mutations: {
    UPDATE_MOVIES(state, payload) {
      state.movies = payload;
    }
  }
  
});