<template>
  <div>
    <simpleheader></simpleheader>
    <body>
      <div class="btp-container">
        <section class="btp-title">
          <h1>마이 프로필 설정</h1>
        </section>
        <section class="profile-container">
          <div id="picture">
            <p class="profile-label">프로필</p>
            <img class="profile-pic" :src="imgsrc" alt="현재 프로필 이미지" />
            <button type="submit">변경</button>
          </div>
          <div>
            <div id="naming">
              <div class="name">
                <label for="firstname" class="profile-label">이름</label>
                <input type="text" name="firstname" required />
              </div>
              <div class="name">
                <label for="title" class="profile-label">성</label>
                <input type="text" name="title" />
              </div>
            </div>
            <hr />
            <button type="submit" v-on:click="putUserInfo">
              <span class="quit">탈퇴하기</span>
            </button>
          </div>
        </section>
      </div>
    </body>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/Settings.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
import axios from "axios";
export default {
  data() {
    return {
      imgsrc: require("../assets/images/turtle.svg"),
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
        }
      });
    },
    putUserInfo() {
      //임시로 이름
      const name = document.getElementsByName("firstname")[0].value;
      //임시로 타이틀
      const title =
        document.getElementsByName("title")[0].value != null
          ? document.getElementsByName("title")[0].value
          : "";
      //변경
      axios
        .put("http://127.0.0.1:3000/user/info", {
          newNickname: name,
          newTitle: title,
        })
        .then((res) => {
          console.log(res);
          location.reload(); 
          alert("수정이 완료되었습니다.");
        });
    },
  },
};
</script>
