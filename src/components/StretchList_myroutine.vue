<template>
  <section class="moreStretching">
    <modalStretching
      v-if="isModalViewed"
      :contentInfo="modalInfo"
      @stretchData="emitStretchData"
      @close-modal="closeModal"
    />
    <div class="category-wrap">
      <article class="category" @change="getEachCategoryContent">
        <input type="radio" id="all" name="categoryFilter" checked />
        <label class="category-btn" for="all">전체 스트레칭</label>
        <input type="radio" id="1" name="categoryFilter" />
        <label class="category-btn" for="1">눈</label>
        <input type="radio" id="2" name="categoryFilter" />
        <label class="category-btn" for="2">목</label>
        <input type="radio" id="3" name="categoryFilter" />
        <label class="category-btn" for="3">어깨</label>
        <input type="radio" id="4" name="categoryFilter" />
        <label class="category-btn" for="4">손목</label>
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
        class="st-item st-3"
        v-for="(contentInfo, i) in stretchContentList"
        :key="i"
        :contentInfo="contentInfo"
        @open-modal="openModal"
      />
    </div>
    <div class="timeCategoryList">
      <stretching-minute></stretching-minute>
    </div>
  </section>
</template>

<script>
import listContent from './listContent.vue';
import stretchingMinute from './Stretching_minute.vue';
import modalStretching from '../components/modalStretching';
import axios from 'axios';

export default {
  data() {
    return {
      // 여기에 전달할 컴포넌트 데이터 담기
      category: ['eye', 'neck', 'shoulder', 'wrist'],
      modalInfo: {},
      stretchCategoryList: {},
      stretchContentList: [],
      isModalViewed: false,
    };
  },
  components: { listContent, stretchingMinute, modalStretching },
  created() {
    this.getCategoryId();
  },
  methods: {
    openModal(data) {
      this.modalInfo = data;
      this.isModalViewed = true;
    },
    closeModal() {
      this.isModalViewed = false;
    },
    emitStretchData(data) {
      this.$emit('stretchData', data);
      this.isModalViewed = false;
    },
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
    resetStretchCategoryList() {
      this.stretchContentList = [];
    },
    getEachCategoryContent() {
      let categoryId = document.querySelector('input[name=categoryFilter]:checked').id;
      this.resetStretchCategoryList();
      if (categoryId === 'all') {
        this.stretchCategoryList.forEach((element) => {
          this.getStretchContent(element);
        });
      } else {
        this.getStretchContent(this.stretchCategoryList[categoryId - 1]);
      }
    },
    getStretchContent(category) {
      axios({
        method: 'get',
        url: 'http://127.0.0.1:3000/stretch/contents/list',
        params: { cid: category.id },
      }).then((res) => {
        if (res.data.result == 'OK') {
          const eachStretch = res.data.results;
          eachStretch.forEach((content) => {
            axios
              .all([
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/contents/playtime',
                  params: { id: content.id },
                }),
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/contents/description',
                  params: { id: content.id },
                }),
              ])
              .then(
                axios.spread((res1, res2) => {
                  const stretchData = {
                    category: category.title,
                    id: content.id,
                    title: content.title,
                    description: res2.data.results.description,
                    playTime: res1.data.results.playTime,
                    imgUrl: content.image_url,
                  };

                  this.stretchContentList.push(stretchData);
                })
              );
          });
        } else {
          console.log(res.data);
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/StretchList.scss';
.timeCategoryList {
  display: none;
}
</style>
