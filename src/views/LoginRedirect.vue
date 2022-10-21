<template>
  <div class="loginCheck">
    {{ results }}
    <br />
    <h1>{{ results.nickname }}</h1>
    <img :src="results.picture" />
  </div>
</template>

<script>
import axios from "axios";
axios.defaults.withCredentials = true;
export default {
  created() {
    this.create();
  },
  data() {
    return {
      sessionId: "",
      results: {
        id: "",
        provider: "",
        providerId: "",
        picture: "",
        nickname: "",
        title: "",
        level: "",
        point: "",
        createdAt: "",
        updatedAt: "",
        alarmValid: "",
        monthTimes: "",
        dd: "",
        todayTimes: "",
      },
    };
  },
  methods: {
    create() {
      this.codes = this.$route.query.code;
      // this.getUser();
      this.login();
    },
    // getUser() {
    //   axios
    //     .get(
    //       "http://127.0.0.1:30ks00/oauth/kakao/callback?authorize_code=" +
    //         this.codes
    //     )
    //     .then((res) => {
    //       //   console.log(res);
    //       document.cookie = `connect.sid=${res.data}`;
    //       this.login();
    //     });
    // },
    login() {
      //VueCookies.set("connect.sid", this.sessionId)
      axios.get(process.env.VUE_APP_URL + "user/info").then((res) => {
        if (res.data != null) {
          this.results = res.data.results;
          //   this.$router.push("/");
        }
        //   console.log(res);
      });
    },
  },
};
</script>
