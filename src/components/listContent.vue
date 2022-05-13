<template>
  <div class="content-wrap">
    <img :src="require(`@/assets/images/stretch_sample/stretching_${category}.png`)" alt="sample img" />
    <div class="caption-wrap">
      <img
        :src="require(`../assets/images/bookmark-${bookmarkChecked}.png`)"
        alt="bookmark-on"
        v-on:click="bookmarkOnOff"
      />
      <div>
        <h1>{{ category }} 스트레칭 (샘플)</h1>
        <p>00 : 00 : 00</p>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/listContent.scss';
</style>
<script>
export default {
  data() {
    return {
      bookmarkChecked: 'off',
    };
  },
  props: {
    category: {
      type: String,
      default: 'eye',
    },
  },
  methods: {
    bookmarkOnOff() {
      if (this.bookmarkChecked == 'off') {
        this.bookmarkChecked = 'on';
      } else {
        this.bookmarkChecked = 'off';
      }
    },
  },
};
</script>
