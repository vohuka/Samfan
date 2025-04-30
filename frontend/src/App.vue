<template>
  <div id="app">
    <SamfanHeader />
    <router-view />
    <SamfanFooter/>
  </div>
</template>

<script>
import SamfanHeader from './components/headerSam.vue'
import SamfanFooter from './components/footerSam.vue'

export default {
  name: 'App',
  components: {
    SamfanHeader,
    SamfanFooter
  }
}
</script>
