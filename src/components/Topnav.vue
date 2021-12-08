<template>
    <div class="topnav">
            <router-link to="/" class="logo">
              <svg class="icon" v-if="toggleMenuButtonVisible">
                  <use xlink:href="#icon-huangguan"></use>
              </svg>
            </router-link>
            <ul class="menu">
               <li>
                 <router-link to="/doc">文档</router-link>
               </li>
            </ul>
            <svg class="toggleAside" @click="toggleMenu" v-if="toggleMenuButtonVisible">
              <use xlink:href="#icon-daohanglan"></use>
            </svg>
        </div>
</template>
<script lang="ts">
import { inject, Ref } from 'vue'
export default {
  props: {
    toggleMenuButtonVisible:{
      type: Boolean,
      default: false
    }
  },
   setup(props){
    const menuVisible = inject<Ref<boolean>>('menuVisible') // get
    const toggleMenu = ()=>{
      menuVisible.value = !menuVisible.value
    }
    return {toggleMenu}
  } 
}
</script>
<style lang="scss" scoped>
 .topnav {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 20;
  display: flex;
  padding: 16px;
  justify-content: center;
  align-items: center;
  > .logo {
    max-width: 6em;
    margin-right: auto;
    >.icon {
      height: 32px;
      width: 32px;
    }
  }
  > .menu {
    display: flex;
    white-space: nowrap;
    flex-wrap: nowrap;
    > li {
      margin: 0 1em;
    }
  }
   > .toggleAside {
    width: 24px;
    height: 24px;
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    display: none;
  }
 
  @media (max-width:500px) {
    > .menu{display: none;}
    > .logo{margin: 0 auto;}
    > .toggleAside{display: inline-block}
  }
 }
</style>