<template>
  <section class="moreStretching">
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
      <listContent
        class="st-item"
        v-for="(contentInfo, i) in stretchContentList"
        :key="i"
        :contentInfo="contentInfo"
        :category="contentInfo.category"
        v-bind:data-category="makeBindAttribute(contentInfo.category)"
      />
    </div>
  </section>
</template>

<script>
import listContent from '../components/listContent.vue';
import axios from 'axios';
export default {
  data() {
    return {
      // 여기에 전달할 컴포넌트 데이터 담기
      category: ['eye', 'neck', 'shoulder', 'wrist'],
      stretchCategoryList: {},
      stretchContentList: [],
    };
  },
  components: { listContent },
  created() {
    this.getCategoryId();
  },
  updated() {
    this.categoryFilter();
  },
  methods: {
    getCategoryId() {
      axios.get('http://127.0.0.1:3000/stretch/category/list').then((res) => {
        if (res.data.results != null) {
          this.stretchCategoryList = res.data.results;
          this.getEachCategoryContent();
        } else {
          console.log(res.data);
        }
      });
    },
    getEachCategoryContent() {
      for (const list in this.stretchCategoryList) {
        const nowList = this.stretchCategoryList[list];
        this.getStretchContent(nowList);
      }
    },
    getStretchContent(nowList) {
      //   console.log(nowList.id, nowList.title);
      axios({
        method: 'get',
        url: 'http://127.0.0.1:3000/stretch/contents/list',
        params: { cid: nowList.id },
      }).then((res) => {
        if (res.data.result == 'OK') {
          const eachStretch = res.data.results;

          eachStretch.forEach((content) => {
            const stretchData = {
              category: nowList.title,
              id: content.id,
              title: content.title,
            };
            this.stretchContentList.push(stretchData);
          });
        } else {
          console.log(res.data);
        }
      });
    },
    categoryFilter() {
      let categoryBtn = document.querySelectorAll('input[name=categoryFilter]');
      const listItem = document.querySelectorAll('.st-item');
      const timeCategoryList = document.querySelector('.timeCategoryList');
      const bookmarkToggle = document.querySelector('#stretching-switch');
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
          if (btn.id === 'f6') {
            bookmarkToggle.checked = false;
            bookmarkToggle.nextSibling.style.pointerEvents = 'none';
            timeCategoryList.style.display = 'block';
          } else {
            bookmarkToggle.nextSibling.style.pointerEvents = 'auto';
            timeCategoryList.style.display = 'none';
          }
        });
      });
    },
    makeBindAttribute(item) {
      return item;
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/StretchList.scss';
</style>
