<template>
   <button class="gulu-switch" :class="{'gulu-checked': value}" @click="toggle"><span></span> </button>
</template>

<script lang="ts">
export default {
   props: {
       value: Boolean
   },
   setup(props,context) {
       const toggle = () => {
           context.emit('update:value',!props.value)
       }
       return {toggle}
   }
}
</script>

<style lang="scss" scoped>
    $h : 22px;
    $h2 : $h - 4px;
    .gulu-switch {
        height: $h;
        width: $h * 2;
        border: none;
        background: whitesmoke;
        border-radius: $h2 / 2;
        position: relative;
    }
    span {
        position: absolute;
        top: 2px;
        left: 2px;
        height: $h2;
        width: $h2;
        border-radius: $h2 / 2;
        background: rgb(141, 130, 130);
        transition: left 250ms;
    }
    button.gulu-checked {
        background: skyblue;
        > span {
            background: snow;
        }
    }
    button.gulu-checked > span {
       left: calc(100% - #{$h2} - 2px);
    }
    button:focus {
        outline: none;
    }
</style>
