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
      <article class="bookmark" @change="doBookmarkFilter">
        <span>북마크만 보기</span>
        <div class="onoff-button">
          <input type="checkbox" id="stretching-switch" ref="bookmarkOnOffBtn" />
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
      axios.get(process.env.VUE_APP_URL + '/stretch/category/list').then((res) => {
        if (res.data.results != null) {
          this.stretchCategoryList = res.data.results;
          this.getEachCategoryContent();
        } else {
          console.log(res.data);
        }
      });
    },
    resetStretchList() {
      this.stretchContentList = [];
    },
    getEachCategoryContent() {
      let categoryId = document.querySelector('input[name=categoryFilter]:checked').id;
      this.resetStretchList();
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
        url: process.env.VUE_APP_URL + '/stretch/contents/list',
        params: { cid: category.id },
      }).then((res) => {
        if (res.data.result == 'OK') {
          const eachStretch = res.data.results;
          eachStretch.forEach((content) => {
            axios
              .all([
                axios({
                  method: 'get',
                  url: process.env.VUE_APP_URL + '/stretch/contents/playtime',
                  params: { id: content.id },
                }),
                axios({
                  method: 'get',
                  url: process.env.VUE_APP_URL + '/stretch/contents/description',
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

          let result = this.$refs.bookmarkOnOffBtn.checked;
          if (result) {
            this.getBookmark(1);
          }
        } else {
          console.log(res.data);
        }
      });
    },
    doBookmarkFilter() {
      let result = this.$refs.bookmarkOnOffBtn.checked;
      if (result) {
        this.getBookmark(1);
      }
      if (!result) {
        this.getEachCategoryContent();
      }
      // todo : 여기에 1 대신 user id 넣으면 됨
    },
    getBookmark(userId) {
      axios({
        method: 'get',
        url: process.env.VUE_APP_URL + '/bookmark/list',
        params: { uid: userId },
      }).then((res) => {
        if (res.data.results != null) {
          const bookMarkList = res.data.results;

          let filtered = this.stretchContentList.filter((contentList) =>
            bookMarkList.some((eachBookmark) => contentList.id == eachBookmark.StretchContentId)
          );
          this.resetStretchList();
          this.stretchContentList = filtered;
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
