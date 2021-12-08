<demo>
按钮种类
</demo>
<template>
    <Button level="main">主要按钮</Button>
      <Button>普通按钮</Button>
      <Button level="danger">危险按钮</Button>
</template>
<script>
import Button from '../lib/Button.vue'
export default {
    components: {
           Button
       },
    setup() {
       
    },
}
</script>