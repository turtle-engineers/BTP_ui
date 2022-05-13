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
            <input type="radio" id="f1" data-category="all" name="categoryFilter" checked />
            <label class="category-btn" for="f1">전체 스트레칭</label>
            <input type="radio" id="f2" data-category="eye" name="categoryFilter" />
            <label class="category-btn" for="f2">눈</label>
            <input type="radio" id="f3" data-category="neck" name="categoryFilter" />
            <label class="category-btn" for="f3">목</label>
            <input type="radio" id="f4" data-category="shoulder" name="categoryFilter" />
            <label class="category-btn" for="f4">어깨</label>
            <input type="radio" id="f5" data-category="wrist" name="categoryFilter" />
            <label class="category-btn" for="f5">손목</label>
            <input type="radio" id="f6" data-category="time" name="categoryFilter" />
            <label class="category-btn" for="f6">시간 별 스트레칭</label>
          </article>
          <!-- on off버튼 -->
          <article class="bookmark">
            <span>북마크만 보기</span>
            <div class="onoff-button">
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
      let categoryBtn = document.querySelectorAll('input[name=categoryFilter]');
      const listItem = document.querySelectorAll('.st-item');
      categoryBtn.forEach((btn) => {
        btn.addEventListener('change', function(e) {
          const filter = e.target.dataset.category;
          listItem.forEach((item) => {
            if (filter === 'all') {
              item.style.display = 'inline';
            } else {
              item.style.display = item.dataset.category === filter ? 'block' : 'none';
            }
          });
        });
      });
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/StretchingSection.scss';
</style>
