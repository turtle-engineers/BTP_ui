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
            총 <span>{{ totalTime.minutes }}</span
            >분 <span>{{ totalTime.seconds }}</span
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
        <div class="slide-content" v-for="(element, index) in listArray" :key="index">
          <div class="content-img">
            <img class="turtle_grow" src="@/assets/icon/question-mark.png" v-on:click="isModalViewed = true" />
            <listContent :contentInfo="element" />
          </div>
        </div>
        <template #prevArrow="">
          <button class="arrow-btn">
            <img src="../assets/icon/left_square.png" alt="arrow-left" />
          </button>
        </template>
        <template #nextArrow="">
          <button class="arrow-btn">
            <img src="../assets/icon/right_square.png" alt="arrow-right" />
          </button>
        </template>
      </VueSlickCarousel>
    </div>
  </div>
</template>
<script>
import simpleheader from '../components/layout/simpleheader.vue';
import listContent from '../components/listContent.vue';
import modalStretching from '../components/modalStretching';
import VueSlickCarousel from 'vue-slick-carousel';
import 'vue-slick-carousel/dist/vue-slick-carousel.css';
import axios from 'axios';
export default {
  data() {
    return {
      user: {
        id: '',
      },
      totalTime: {
        minutes: '0',
        seconds: '0',
      },
      routineArray: [],

      isModalViewed: false,
    };
  },
  components: {
    simpleheader,
    VueSlickCarousel,
    listContent,
    modalStretching,
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      axios.get('http://127.0.0.1:3000/user/info').then((res) => {
        if (res.data.results != null) {
          this.user.id = res.data.results.id;
          this.getMyRoutine();
        } else {
          window.location.replace('http://127.0.0.1:3000/oauth/kakao');
        }
      });
    },
    async getMyRoutine() {
      await axios({
        method: 'get',
        url: 'http://127.0.0.1:3000/my-routine/list',
        params: { userId: this.user.id },
      }).then((res) => {
        if (res.data.result == 'OK') {
          let routineArray = res.data.results;
          
          [].forEach.call(routineArray.myRoutineList, (element) => {
            const StretchContentId = element.StretchContentId;
            const stretchCategoryId = element.stretchCategoryId;
            axios
              .all([
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/contents/title',
                  params: { id: StretchContentId },
                }),
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/category/title',
                  params: { id: stretchCategoryId },
                }),
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/contents/playtime',
                  params: { id: StretchContentId },
                }),
              ])
              .then(
                axios.spread((res1, res2, res3) => {

                  let id = element.StretchContentId;
                  let title = res1.data.results.title;
                  let category = res2.data.results.title;
                  let playTime = res3.data.results.playTime;
                  console.log(res1, res2, res3);
                  
                  this.listArray.push({"id":id, "category":category, "title":title, "playTime":playTime});
                })
              );
          });
        }
      });
    },
    closeModal() {
      this.isModalViewed = false;
    },
  },
};
</script>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/myroutine.scss';
@import '../assets/scss/components/carousel.scss';
</style>
