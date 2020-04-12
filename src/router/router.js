import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Home from '../views/Home.vue'
import Signup from '../views/Signup.vue'
import Profile from '../views/Profile.vue'

Vue.use(VueRouter)

// const ifAuthenticated = (to, from, next) => {
//   if(localStorage.isAuthenticated == true) {
//     next();
//     return;
//   }
//   router.push({
//     path: '/Login',
//   })
// }

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
      //beforeEnter: ifAuthenticated
    },
    {
      path: '/Login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/Signup',
      name: 'Signup',
      component: Signup,
    },
    {
      path: '/Profile',
      name: 'Profile',
      component: Profile,
    }
  ]
})

export default router
