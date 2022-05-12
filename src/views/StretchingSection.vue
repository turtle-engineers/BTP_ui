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
      <section class="moreStretching">
        <h1>다른 스트레칭 살펴보기</h1>
        <div class="category-wrap">
          <article class="category">
            <button class="category-btn on" data-category="all">전체 스트레칭</button>
            <button class="category-btn off" data-category="eye">눈</button>
            <button class="category-btn off" data-category="neck">목</button>
            <button class="category-btn off" data-category="shoulder">어깨</button>
            <button class="category-btn off" data-category="wrist">손목</button>
            <button class="category-btn off" data-category="time">시간 별 스트레칭</button>
          </article>
          <!-- on off버튼 -->
          <article class="bookmark">
            <span>북마크만 보기</span>
            <div v-on:change="stretchingOnOff" class="onoff-button">
              <input type="checkbox" id="stretching-switch" />
              <label for="stretching-switch"></label>
            </div>
          </article>
        </div>
        <div class="stretchList">
          <listContent class="st-item" data-category="eye" />
          <listContent class="st-item" data-category="neck" />
          <listContent class="st-item" data-category="neck" />
          <listContent class="st-item" data-category="shoulder" />
          <listContent class="st-item" data-category="neck" />
          <listContent class="st-item" data-category="shoulder" />
          <listContent class="st-item" data-category="eye" />
          <listContent class="st-item" data-category="wrist" />
          <listContent class="st-item" data-category="shoulder" />
          <listContent class="st-item" data-category="wrist" />
          <listContent class="st-item" data-category="shoulder" />
        </div>
      </section>
      <!-- <section>
        <stretchingMinute></stretchingMinute>
      </section> -->
    </div>
  </div>
</template>

<script>
import simpleheader from '../components/layout/simpleheader.vue';
import listContent from '../components/listContent.vue';
// import stretchingMinute from '../components/Stretching_minute.vue';
export default {
  components: {
    simpleheader,
    listContent,
    // stretchingMinute,
  },
  mounted() {
    this.categoryFilter();
  },
  methods: {
    categoryFilter() {
      const categoryBtn = document.querySelectorAll('.category-btn');
      const listItem = document.querySelectorAll('.st-item');

      categoryBtn.forEach((button) =>
        button.addEventListener('click', (e) => {
          e.preventDefault();
          const filter = e.target.dataset.category;

          listItem.forEach((item) => {
            if (filter === 'all') {
              item.style.display = 'inline';
            } else {
              if (item.dataset.category === filter) {
                item.style.display = 'block';
              } else {
                item.style.display = 'none';
              }
            }
          });
        })
      );
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/StretchingSection.scss';
</style>
