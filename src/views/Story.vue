<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <!-- 타이틀 -->
      <div class="btp-title">
        <h1>BTP PROJECT</h1>
        <p>
          BTP 프로젝트는 인류 종족을 위한 프로젝트로 이 프로젝트에 참여함으로서 인류에 이바지를 할 수 있습니다. <br />
          물론, 스스로의 몸에 가장 크게 이바지합니다. 프로젝트가 시작된 이유는 아래와 같습니다.
        </p>
      </div>
      <VueSlickCarousel class="slick" v-bind="settings">
        <div class="slide-content">
          <img src="../assets/images/story/1.png" alt="1번 그림" />
          <h1>2021년... 인류의 진화를 연구하던 과학자들은 충격적인 발견을 하게된다.</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/2.png" alt="12번 그림" />
          <h1>최근 잡아온 거북이와 인류의 DNA가 일치했던 것!</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/3.png" alt="3번 그림" />
          <h1>거북이와 인류를 계속해서 연구하던 과학자들은 깨닫게 된다.</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/4.png" alt="4번 그림" />
          <h1>이 거북이는 인류의 미래의 모습이라는 사실을!!</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/5.png" alt="5번 그림" />
          <h1>그리고 자신들 또한 거북이가 되어가고 있다는 사실을-!!</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/6.png" alt="6번 그림" />
          <h1>그들은 거북이가 되지 않기위해<br />과학자들은 하나의 프로젝트를 비밀리에 진행하게 된다.</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/7.png" alt="87번 그림" />

          <h1>[Back to the People..] 이름하여 BTP 프로젝트!</h1>
        </div>
        <div class="slide-content">
          <img src="../assets/images/story/8.png" alt="8번 그림" />
          <img src="../assets/images/story/yellow.png" alt="훈련 button" class="y-btn" />
          <h1>인류가 거북이가 되는 것을 막기 위해 프로젝트에 참여하세요!</h1>
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
      <router-link to="/stretchingGuide">
        <button type="button" class="go-stretching-btn">훈련하러 가기</button>
      </router-link>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/story.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
import VueSlickCarousel from "vue-slick-carousel";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
export default {
  data() {
    return {
      settings: {
        arrows: true,
        dots: false,
        slidesToShow: 1,
        slidesToScroll: 1,
      },
    };
  },
  components: {
    simpleheader,
    VueSlickCarousel,
  },
};
</script>
