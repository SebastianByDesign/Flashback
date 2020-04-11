<template>
  
</template>

<script>
import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import { serverBus } from '../main';

Vue.use(VueAxios, axios)

export default {
  name: 'UserPage',
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
    @media only screen 
  and (min-device-width: 320px) 
  and (max-device-width: 480px)
  and (-webkit-min-device-pixel-ratio: 2) {

.container{
  display: none;
}
  }
  }
</style>
