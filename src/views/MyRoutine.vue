<template>
  <div class="app-container">
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
            총 <span>{{ totalTime.minutes }}</span>분 
            <span>{{ totalTime.seconds }}</span>초
          </p>
          <router-link to="/myroutine/stretching">
            <button type="button">마이 루틴 시작</button>
          </router-link>
        </article>
      </div>
      <article class="routine-menu">
        <h1>마이루틴 리스트</h1>
        <router-link to="/myroutine/edit">
          <button type="button">리스트 편집 ></button>
        </router-link>
      </article>
      <!-- 캐러셀 -->
      <Carousel :is="componentLoader" :routineArray="routineArray"></Carousel>
    </div>
  </div>
</template>
<script>
import simpleheader from '../components/layout/simpleheader.vue';
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
    };
  },
  async created() {
    await this.getUser();
    await this.getMyRoutine();
  },
  components: {
    simpleheader,
  },
  computed: {
    componentLoader() {
      return () =>import(`@/components/Carousel.vue`);
    }
  },
  methods: {
    getUser() {
      axios.get(process.env.VUE_APP_URL + '/user/info').then((res) => {
        if (res.data.results != null) {
          this.user.id = res.data.results.id;
        } else {
          window.location.replace(process.env.VUE_APP_URL + '/oauth/kakao');
        }
      });
    },
    getMyRoutine() {
      axios.all([
        axios({
          method: 'get',
          url: process.env.VUE_APP_URL + '/my-routine/list',
          params: { userId: this.user.id },
        }),
        axios({
          method: 'get',
          url: process.env.VUE_APP_URL + '/stretch/category/list'
        })
      ]).then(axios.spread((res1, res2) => {
        if (res1.data.result == 'OK' && res2.data.result == 'OK') {
          let routineArray = res1.data.results;
          const categoryList = res2.data.results;

          const timeResult = { minutes: routineArray.totalTimeMin, seconds: routineArray.totalTimeSec };
          this.totalTime = timeResult;

          routineArray.myRoutineList.forEach((content) => {
            content["category"] = categoryList[content.stretchCategoryId].title;
          });

          this.routineArray = routineArray.myRoutineList;
          // console.log(this.routineArray);
        }
      }));
    },
  },
};
</script>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/myroutine.scss';
</style>
