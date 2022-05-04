<template>
  <div>
    <article class="minuteStr-wrap">
      <!-- 2분 -->
      <h1>2분 스트레칭 하러가기</h1>
      <VueSlickCarousel ref="c2" :arrows="true" :asNavFor="$refs.c1" :slidesToShow="4" :infinite="false" class="carousel" >
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
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
      <!-- 5분 -->
      <h1>5분 스트레칭 하러가기</h1>
      <VueSlickCarousel ref="c2" :arrows="true" :asNavFor="$refs.c1" :slidesToShow="4" :infinite="false" class="carousel">
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
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
      <!-- 10분 -->
      <h1>10분 스트레칭 하러가기</h1>
      <VueSlickCarousel ref="c2" :arrows="true" :asNavFor="$refs.c1" :slidesToShow="4" :infinite="false" class="carousel">
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
          <div class="slide-content"><listContent /></div>
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
    </article>
  </div>
</template>

<script>
import VueSlickCarousel from "vue-slick-carousel";
import listContent from "../components/listContent.vue";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
export default {
  components: {
    VueSlickCarousel,
    listContent,
  }
};
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/Stretching_minute.scss';
@import '../assets/scss/components/carousel.scss';
</style>
