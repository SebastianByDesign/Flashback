<template>
  <div class="home">
    <Nav />
    <b-container>
      <HelloWorld />
    </b-container>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'
import Nav from '@/components/partials/Nav.vue';

export default {
  name: 'Home',
  components: {
    HelloWorld,
    Nav
  }
}
</script>
