<template>
  <div>
    <VueSlickCarousel ref="c2" :arrows="true" :asNavFor="$refs.c1" :slidesToShow="4" :infinite="false">
      <div class="slide-content" v-for="contentInfo in routineArray" v-bind:key="contentInfo.contentsOrder">
        <div class="content-img">
          <listContent :contentInfo="contentInfo" />
        </div>
      </div>
      <template #prevArrow="">
        <button class="arrow-btn">
          <img src="../assets/icon/left_square.png" alt="arrow-left" />
        </button>
      </template>
      <template #nextArrow="">
        <button class="arrow-btn">
          <img src="../assets/icon/right_square.png" alt="arrow-left" />
        </button>
      </template>
    </VueSlickCarousel>
  </div>
</template>
<script>
import listContent from '../components/listContent.vue';
import VueSlickCarousel from 'vue-slick-carousel';
import 'vue-slick-carousel/dist/vue-slick-carousel.css';
export default {
  props: {
    routineArray: {
      type: Object,
      default: () => {
        return { 
          "contentsOrder": 0, 
          "StretchContentId": 9, 
          "repeatCount": 4, 
          "id": 9, 
          "title": "스트레칭 이름9", 
          "description": "스트레칭 설명9", 
          "playTime": 20, 
          "imgUrl": null, 
          "videoUrl": null, 
          "stretchCategoryId": 3, 
          "playTimes": 80, 
          "category": "wrist" 
          };
      },
    },
  },
  components: {
    VueSlickCarousel,
    listContent,
  },
}
</script>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/carousel.scss';
</style>