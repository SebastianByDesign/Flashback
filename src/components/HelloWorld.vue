<template>
  <div>
    <h4 class=title>Movies</h4>
    <b-row>
      <b-col cols="2" align="center" v-for="{ movie_id, movie_cover, movie_title, movie_synopsis, movie_trailer } in movies" :key="movie_id">
        <!-- <div class="crop">
          <img :src="'/api/images/' + movie_cover" v-bind:alt="movie_title">
        </div>
        <p>{{ movie_title }}<br>{{ movie_year }}</p> -->
        <b-card overlay :title="movie_title" v-bind:img-src="'/api/images/' + movie_cover" v-bind:img-alt="movie_title">
          <b-card-text>
            {{ movie_synopsis }}
          </b-card-text>
          <b-button v-b-modal="movie_id" variant="primary">
            Watch now
          </b-button>

          <b-modal :id="movie_id" :title="movie_title">
            <iframe width="100%" height="315" v-bind:src="movie_trailer" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </b-modal>
        </b-card>
      </b-col>
    </b-row>
  </div>
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
  .title {
    padding: 10px 0;
  }

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

    .card-img-overlay {
      opacity: 0;

      &:hover {
        opacity: 1;
      }
    }

    h4 {
      color: white;
    }

    p {
      color: white;
      text-align: left;
      font-weight: 600;
    }

    .card-body {
      background-color: rgba(0,0,0,0.7);
    }
  }
</style>
