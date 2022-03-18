<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    
      <div id="desc">
        <h1>BTP PROJECT</h1>
        <p>
          BTP 프로젝트는 인류 종족을 위한 프로젝트로 이 프로젝트에
          참여함으로서 인류에 이바지를 할 수 있습니다. <br />
          물론, 스스로의 몸에 가장 크게 이바지합니다. 프로젝트가 시작된 이유는 아래와 같습니다.
        </p>
      </div>
<div class="story-page">
      <div id="story-container">
        <button class="slide-btn" id="prev" @click="prev">
          <img src="../assets/icon/left_square.png" />
        </button>
        <div id="slider">
          <div :class="`card${index}`"></div>
        </div>
        <button class="slide-btn" id="next" @click="next">
          <img src="../assets/icon/right_square.png" />
        </button>
      </div>

      <button id="go-stretching">훈련하러 가기</button>
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
export default {
  data() {
    return {
      index: 1,
    };
  },
  components: {
    simpleheader,
  },

  methods: {
    prev() {
      if (this.index == 1) {
        this.index = 8;
      } else {
        this.index = this.index - 1;
      }
      // alert(this.index);
    },
    next() {
      if (this.index == 8) {
        this.index = 1;
      } else {
        this.index = this.index + 1;
      }
      // alert(this.index);
    },
  },
};
</script>
