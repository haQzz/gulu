<template>
    <div class="gulu-tabs">
        <div class="gulu-tabs-nav" ref="container">
        <div class="gulu-tabs-nav-item" v-for="(t,index) in titles" :key="index" 
        @click="select(t)"
        :ref="el => {if (t === selected) selectedItem = el}"
        :class="{selected: t === selected}">{{t}}</div>
        <div class="gulu-tabs-nav-indicator" ref="indicator"></div>
        </div>
        <div class="gulu-tabs-content">
            <component class="gulu-tabs-content-item" v-for="c in defaults" :key="c.title"
             :class="{selected: c.props.title === selected}" :is="c"/>
        </div>
    </div>
</template>
<script lang="ts">
import { onMounted,onUpdated,ref } from 'vue'
import Tab from './Tab.vue'

export default ({
    props: {
        selected: String
    },
    components: {
        Tab
    },
    setup(props,context) {
      const selectedItem = ref<HTMLDivElement>(null)
      const indicator = ref<HTMLDivElement>(null)
      const container = ref<HTMLDivElement>(null)
      console.log(props.selected)
      const x = () => {
        const {width} = selectedItem.value.getBoundingClientRect()
        indicator.value.style.width = width + 'px'
        const {left:left1} = container.value.getBoundingClientRect()
        const {left:left2} = selectedItem.value.getBoundingClientRect()
        const left = left2 - left1
        indicator.value.style.left = left + 'px'
      }
      onMounted(x)
      onUpdated(x)
      const select = (title) => {
          context.emit('update:selected',title)
      }
      const defaults = context.slots.default()
       defaults.forEach((tag) => {
           if(tag.type !== Tab){
               throw new Error('Tabs 子标签必须是Tab')
           }
       }) 
    const titles = defaults.map((tag) => {
          return tag.props.title
       })
        return {defaults,titles,selectedItem,select,onMounted,indicator,container,x}
    }
})

</script>

<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;
.gulu-tabs {
  &-nav {
    display: flex;
    color: $color;
    position: relative;
    border-bottom: 1px solid $border-color;
    >.gulu-tabs-nav-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      width: 100px;
      transition: all 250ms;
    }
    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;
      &:first-child {
        margin-left: 0;
      }
      &.selected {
        color: $blue;
      }
    }
  }
  &-content {
    padding: 8px 0;
    &-item {
        display: none;
        &.selected {
            display: block;
        }
    }
  }
}
</style>
