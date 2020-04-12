<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="dark">
      <b-container>

        <b-navbar-brand v-if="restricted != 'true'" href="/">FlashBack</b-navbar-brand>
        <b-navbar-brand v-else href="/">FlashBack <span class="kids">Kids</span></b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-form>
              <b-form-input size="sm" class="mr-sm-2 hdn" placeholder="Search titles or people"></b-form-input>
              <div class="h4 mb-0">
                <b-icon icon="search" v-on:click="showSearch"></b-icon>
              </div>
            </b-nav-form>
          </b-navbar-nav>

          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">

            <b-nav-item-dropdown v-show="restricted != 'true'" text="Genres" right>
              <div class="row">
                <b-dropdown-item class="all">
                  <p v-on:click="showAll()">All</p>
                  <!-- <a>All</a> -->
                </b-dropdown-item>
                <b-dropdown-item class="genre" v-for="{ genre_id, genre_name } in genres" :key="genre_id">
                  <p :class="genre_name" v-on:click="showByGenre(genre_name)">{{ genre_name }}</p>
                  <!-- <a :class="genre_name">{{ genre_name }}</a> -->
                </b-dropdown-item>
              </div>
            </b-nav-item-dropdown>

            <b-nav-item href="#" active>Movies</b-nav-item>
            <b-nav-item href="#">Music</b-nav-item>

            <b-nav-item-dropdown right>
              <!-- Using 'button-content' slot -->
              <template v-slot:button-content>
                <b-icon icon="person-fill"></b-icon>
              </template>
              <b-dropdown-item v-show="restricted != 'true'" href="/Profile">Profile</b-dropdown-item>
              <b-dropdown-item @click="logOut();" href="#">Sign Out</b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>
        </b-collapse>
      </b-container>
    </b-navbar>
  </div>
</template>

<script>
import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import { BootstrapVue, BIcon, BIconSearch, BIconPersonFill } from 'bootstrap-vue'

Vue.use(VueAxios, axios, BootstrapVue)

Vue.component('BIcon', BIcon)
Vue.component('BIconSearch', BIconSearch)
Vue.component('BIconPersonFill', BIconPersonFill)

import { serverBus } from '../../main';

export default {
  name: 'Nav',
  data: function() {
    return {
      genres: null,
      movies: null,
      authenticated: null,
      restricted: null
    };
  },
  created: function() {
    Vue.axios.get('/api/movie_genres.php').then(
      response => {
        //console.log(response);
        this.genres = response.data;
        this.restricted = localStorage.isRestricted;
      },
      err => {
        console.log(err);
      }
    );
  },
  methods: {
    showSearch: function() {
      document.querySelector('.form-control-sm').classList.toggle('hdn');
    },
    showAll() {
      const dropdown = document.querySelectorAll('.genre a');

      dropdown.forEach(function(item){
        item.classList.remove('active');
      });
      
      document.querySelector('.all a').classList.add('active');

      Vue.axios.get('/api/index.php').then(
        response => {
          this.movies = response.data;
          serverBus.$emit('showAll()', this.movies)
        },
        err => {
          console.log(err);
        }
      );
    },
    showByGenre(genre) {
      const dropdown = document.querySelectorAll('.genre a');

      dropdown.forEach(function(item){
        item.classList.remove('active');
      })

      document.querySelector('.all a').classList.remove('active');
      
      document.querySelector('.'+genre).parentElement.classList.add('active');

      Vue.axios.get('/api/index.php?filter='+genre).then(
        response => {
          this.movies = response.data;
          serverBus.$emit('showByGenre(genre)', this.movies)
        },
        err => {
          console.log(err);
        }
      )
    },
    logOut() {
      Vue.axios.get('/api/user_logout.php')
      .then((response) => {
        localStorage.isAuthenticated = response.data;
        this.$router.push('/LogIn');
      })
      .catch((err) => {
        console.log(err);
      });
    }
  }
}

</script>

<style scoped lang="scss">

.navbarkids {
  background-color: rgb(8, 99, 204) !important;
}

.form-control-sm {
  transition: all .3s ease-in-out;
  width: 200px;

  &.hdn {
    width: 0;
    padding: 0;
    margin: 0;
    border: none;
  }
}

.bi-search {
  color: white;
}

.bi-person-fill {
  font-size: 1.5em !important;
}

.row {
  width: 290px;
  padding: 0 5px;
  margin-right: 0;
  margin-left: 0;

  li {
    width: 140px;

    p {
      margin: 0;
    }
  }
}

</style>