<template>  
    <div>示例1</div>
    <Diglog v-model:visible="x" :ok="f1" :cancel="f2">
        <template v-slot:content>
            <strong>div1</strong>
            <h2>div2</h2>
        </template>
        <template v-slot:title>
            <strong>加粗的标题</strong>
        </template>
    </Diglog>
    <Button @click="toggle" >点击显示和隐藏</Button>
</template>
<script>
import Diglog from '../lib/Diglog.vue'
import Button from '../lib/Button.vue'
import Demo from '../components/Demo.vue'
import {ref} from 'vue'
export default {
    components: {
        Diglog,
        Button,
        Demo
    },
    setup() {
        const x = ref(false)
        const toggle = () => {
           x.value = !x.value
        }
        const f1 = () => {
            return false
        }
        const f2 = () => {

        }
        return {x,toggle,f1,f2}
    },
}
</script>