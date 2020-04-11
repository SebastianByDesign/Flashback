<template>
  <div class="kids">
    <b-container>
    <KidsNav />
    
      <KidsPage />
    </b-container>
  </div>
</template>

<script>
// @ is an alias to /src
import KidsPage from '@/components/KidsPage.vue';
import KidsNav from '@/components/partials/KidsNav.vue';

export default {
  name: 'Kids',
  components: {
    KidsPage,
    KidsNav
  }
}
</script>
