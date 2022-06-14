<template>
  <div class="app-container">
    <modalStretching v-if="isModalViewed" @close-modal="closeModal"></modalStretching>
    <simpleheader></simpleheader>
    <div class="btp-container">
      <!-- 상단 타이틀 + 시간/시작 -->
      <div class="routine-title">
        <section class="btp-title">
          <h1>마이 루틴</h1>
          <p>
            나만의 스트레칭 리스트를 짜고 알림이 울리면 <br />
            리스트의 스트레칭을 따라해보세요. <br />
            프로젝트에 참여할 수록 점점 내 몸이 <br />
            거북이에서 인간이 되가는걸 느낄 수 있을 거예요.
          </p>
        </section>
        <!-- 시간, 시작 -->
        <article class="routine-starter">
          <p>
            총 <span>{{ minutes }}</span
            >분 <span>{{ seconds }}</span
            >초
          </p>
          <router-link to="/myroutine/stretching">
            <button type="button">마이 루틴 시작</button>
          </router-link>
        </article>
      </div>
      <article class="routine-menu">
        <router-link to="/myroutine/edit">
          <button type="button">마이루틴 리스트 편집하기 ></button>
        </router-link>
      </article>
      <!-- 캐러셀 -->
      <VueSlickCarousel ref="c2" :arrows="true" :asNavFor="$refs.c1" :slidesToShow="4" :infinite="false">
        <div class="slide-content" v-for="item in list()" v-bind:key="item.id">
          <div class="content-img">
            <img class="turtle_grow" src="@/assets/icon/question-mark.png" v-on:click="isModalViewed = true" />
            <listContent />
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
  </div>
</template>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
import listContent from "../components/listContent.vue";
import modalStretching from "../components/modalStretching";
import VueSlickCarousel from "vue-slick-carousel";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
export default {
  data() {
    return {
      minutes: 0,
      seconds: 0,
      isModalViewed: false,
      list: function () {
                var list = [];
                for (var i = 1; i < 8; i += 1) list.push(i);
                return list
            },
    };
  },
  components: {
    simpleheader,
    VueSlickCarousel,
    listContent,
    modalStretching,
  },
  methods: {
    closeModal() {
      this.isModalViewed = false;
    },
  },
};
</script>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/myroutine.scss";
@import "../assets/scss/components/carousel.scss";
</style>
