<template>
  <div>Button 示例</div>
    <Demo :component="Button1Demo"></Demo>
    <Demo :component="Button2Demo"></Demo>
    <Demo :component="Button3Demo"></Demo>
    <Demo :component="Button4Demo"></Demo>
    <h3>以上所列按钮可以同时设置多种属性</h3>
</template>
<script lang="ts">
import Button1Demo from './Button1.Demo.vue'
import Button2Demo from './Button2.Demo.vue'
import Button3Demo from './Button3.Demo.vue'
import Button4Demo from './Button4.Demo.vue'
import Button from "../lib/Button.vue";
import Demo from './Demo.vue'
export default {
  components: {
     Button,
     Demo
  },
  setup() {
    return {Button1Demo,Button2Demo,Button3Demo,Button4Demo}
  },
};
</script>