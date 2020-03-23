<template>
  <b-row>
    <b-col cols="2" align="center" v-for="{ movie_id, movie_cover, movie_title, movie_year } in movies" :key="movie_id">
      <div class="crop">
        <img :src="'/api/images/' + movie_cover" v-bind:alt="movie_title">
      </div>
      <p>{{ movie_title }}<br>{{ movie_year }}</p>
    </b-col>
  </b-row>
</template>

<script>
import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import { serverBus } from '../main';

Vue.use(VueAxios, axios)

export default {
  name: 'HelloWorld',
  data: function() {
    return {
      movies: null
    }
  },
  created: function() {

    Vue.axios.get('/api/index.php').then(
      response => {
        //console.log(response);
        this.movies = response.data;
      },
      err => {
        console.log(err);
      }
    );

    serverBus.$on('showByGenre(genre)', (movies) => {
      this.movies = movies;
    });

    serverBus.$on('showAll()', (movies) => {
      this.movies = movies;
    });

  },
  methods: {

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  .row {
    margin-top: 2.5vh;

    .crop {
      position: relative;
      width: 210px;
      height: 280px;
      overflow: hidden;
      border: 5px solid #343a40;
      margin-bottom: 1vh;
    }

    p {
      text-align: left;
      font-weight: 600;
    }
  }
</style>
