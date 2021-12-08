<template>
  <div>
  </div>
  <router-view />
</template>

<script lang="ts">
import { ref, provide } from 'vue'
import { router } from './router'

export default {
  name: 'App',
  setup(){
    const width = document.documentElement.clientWidth
    const menuVisible = ref(width <= 500? false : true)
    router.afterEach(() => {
      if(width <= 510){
        menuVisible.value = false
      }else {
        menuVisible.value = true
        console.log(menuVisible.value)
      }
    })
      provide('menuVisible', menuVisible) // set
  }
}
</script>
