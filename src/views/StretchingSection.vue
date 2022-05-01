<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section class="btp-title">
        <p>목 스트레칭</p>
        <h1>목돌리기 스트레칭</h1>
      </section>
      <section class="moreStretching">
        <h1>다른 스트레칭 살펴보기</h1>
        <article class="category">
          <button class="category-btn on">
            전체 스트레칭
          </button>
          <button class="category-btn off">
            변수
          </button>
          <button class="category-btn off">
            변수
          </button>
          <button class="category-btn off">
            변수
          </button>
          <button class="category-btn off">
            변수
          </button>
        </article>
        <div class="stretchList">
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
          <listContent class="st-item" />
        </div>
      </section>
    </div>
  </div>
</template>

<script>
import simpleheader from "../components/layout/simpleheader.vue";
import listContent from "../components/listContent.vue";
export default {
  components: {
    simpleheader,
    listContent,
  },
};
</script>

<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/StretchingSection.scss";
</style>
