<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section>
        <div class="progress-time">
          <h1>마이루틴 스트레칭 진행률</h1>
          <p>00 : 00 / 99 : 99</p>
        </div>
        <!-- 마이루틴 진행률-->
        <div class="progress">
          <progress value="100" max="100"></progress>
          <progress value="100" max="100"></progress>
          <progress value="100" max="100"></progress>
          <progress value="0" max="100"></progress>
          <progress value="0" max="100"></progress>
          <progress value="0" max="100"></progress>
        </div>
      </section>
      <section class="btp-title">
        <p>목 스트레칭</p>
        <h1>목돌리기 스트레칭</h1>
      </section>
      <!-- 스트레칭 메뉴 -->
      <StretchList></StretchList>
      <section class="timeCategoryList">
        <stretchingMinute></stretchingMinute>
      </section>
    </div>
  </div>
</template>

<script>
import simpleheader from "../components/layout/simpleheader.vue";
import stretchingMinute from "../components/Stretching_minute.vue";
import StretchList from "../components/StretchList.vue";
export default {
  data() {
    return {
      // 여기에 전달할 컴포넌트 데이터 담기
      category: ["eye", "neck", "shoulder", "wrist"],
      stretchCategoryList: {},
      stretchContentList: [],
    };
  },
  components: {
    simpleheader,
    StretchList,
    stretchingMinute,
  },
};
</script>

<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/StretchingSection.scss";
</style>
