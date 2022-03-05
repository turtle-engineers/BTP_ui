//settings.vue
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
            <img
              class="profile-pic"
              :src="imgsrc"
              alt="현재 프로필 이미지"
            />
            <button type="submit" class="savebtn on">저장</button>
          </div>
          <div id="naming">
            <div class="input-container">
              <label for="firstname" class="profile-label">닉네임</label>
              <input
                type="text"
                name="firstname"
                maxlength="16"
                placeholder="닉네임을 입력해주세요."
                class="input-default name"
                required
              />
            </div>
            <div class="input-container">
              <label for="title" class="profile-label">나의 다짐</label>
              <input
                type="text"
                name="title"
                maxlength="40"
                placeholder="닉네임을 입력해보세요."
                class="input-default promise"
              />
            </div>
          </div>
        </section>
        <div class="quit-bottom">
          <hr class="setting-hr"/>
          <button type="submit">
            <span class="quit">탈퇴하기</span>
          </button>
          </div>
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
  },
};
</script>
