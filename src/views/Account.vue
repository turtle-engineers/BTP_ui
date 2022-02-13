<template>
  <div>
    <simpleheader></simpleheader>
    <body>
      <div class="btp-container">
        <section class="btp-title">
          <h1>마이 페이지</h1>
          <!-- <button type="button" v-on:click="getUser">getUser</button> -->
        </section>

        <section class="mypage">
          <!-- green profile -->
          <div class="mypage-profile">
            <!-- <div > -->
            <img class="profile-pic" :src="imgsrc" />
            <!-- </div> -->
            <p id="name">{{ name }}</p>
            <p id="email">{{ email }}</p>
            <button type="button" class="user-btn">설정</button>
            <button type="button" class="user-btn">로그아웃</button>

            <hr />
            <p id="cal-title">이번 달 훈련 횟수 {{ stretch }}회</p>
            <div id="cal">달력</div>
          </div>

          <div class="mypage-turtle">
            <img src="../assets/images/turtle-progress.png" />
            <div id="progress">
              <h2>오늘의 거북이 진행도</h2>
              <h1>{{ progress }}</h1>
              <h3>%</h3>
              <progress v-bind:value="progress" max="100"></progress>
            </div>
            <button type="button" class="turtle-btn">마이 루틴</button>
            <button type="button" class="turtle-btn">스트레칭 가이드</button>
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
      imgsrc: require("../assets/images/turtle.svg"),
      name: "Sample",
      email: "Sample@sample.btp",
      stretch: 0,
      progress: 50,
    };
  },
  components: {
    simpleheader,
  },
  methods: {
    login() {
      //VueCookies.set("connect.sid", this.sessionId)
      axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.data != null) {
          this.results = res.data.results;
          //   this.$router.push("/");
        }
        //   console.log(res);
      });
    },
    getUser() {
      // promise 기반 객체
      axios
        .get("http://localhost:3000/user/info")
        .then(function(response) {
          console.log(response);
        })
        .catch(function(error) {
          console.log(error);
        });
    },
  },
};
</script>
