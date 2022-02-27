<template>
  <div>
    <simpleheader></simpleheader>
    <body>
      <div class="btp-container">
        <section class="btp-title">
          <h1>마이 페이지</h1>
          <!-- <button type="button" v-on:click="login">getUser</button> -->
        </section>
        <section class="mypage">
          <!-- green profile -->s
          <div class="mypage-profile">
            <!-- <div > -->
            <img class="profile-pic" :src="imgsrc" />
            <!-- </div> -->
            <p id="name">{{ name }}</p>
            <p id="email">{{ email }}</p>
            <router-link to="/Settings">
              <button type="button" class="user-btn">설정</button>
            </router-link>
            <button type="button" class="user-btn">로그아웃</button>

            <hr />
            <p id="cal-title">이번 달 훈련 횟수 {{ todayTimes }}회</p>
            <div id="cal">달력</div>
          </div>

          <div class="mypage-turtle">
            <img src="../assets/images/turtle-progress.png" />
            <div id="progress">
              <div class="progress-title">
                <h2>오늘의 거북이 진행도</h2>
                <button type="button">
                  <img
                    class="turtle_grow"
                    src="@/assets/icon/question-mark.png"
                    alt="거북이 진행도 예시"
                  />
                </button>
              </div>
              <h1>{{ progress }}</h1>
              <h3>%</h3>
              <progress v-bind:value="progress" max="100"></progress>
            </div>
            <router-link to="/myroutine">
              <button type="button" class="turtle-btn">마이 루틴</button>
            </router-link>

            <router-link to="/stretchingGuide">
              <button type="button" class="turtle-btn">스트레칭 가이드</button>
            </router-link>
          </div>
        </section>
      </div>
    </body>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/account.scss";
</style>
<script>
import axios from "axios";
import simpleheader from "../components/layout/simpleheader.vue";
export default {
  data() {
    return {
      // 기본 샘플
      imgsrc: require("../assets/images/turtle.svg"),
      name: "Sample",
      email: "Sample@sample.btp",
      todayTimes: 0,
      progress: 50,
    };
  },
  components: {
    simpleheader,
  },
  created() {
      this.login();
    },
  methods: {
    login() {
      axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.data != null) {
          const loginData = res.data.results;
          this.imgsrc = loginData.picture;
          this.name = loginData.nickname;
          this.email = loginData.point;
          this.todayTimes = loginData.todayTimes;
          this.progress = loginData.point;
        }
      });
    },
  },
};
</script>
