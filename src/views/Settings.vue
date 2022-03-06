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

            <button @click="selectUploadFile()">
              <img
                class="profile-pic"
                :src="results.picture"
                alt="현재 프로필 이미지"
              />
            </button>
            <button type="submit" class="savebtn on" @click="putUser()">
              저장
            </button>
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
                v-model="results.nickname"
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
                v-model="results.title"
              />
            </div>
          </div>
        </section>
        <div class="quit-bottom">
          <hr class="setting-hr" />
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
import Vue from "vue";
import Toast from "vue-toastification";
import "vue-toastification/dist/index.css";
Vue.use(Toast, {
  transition: "Vue-Toastification__bounce",
  maxToasts: 20,
  newestOnTop: true,
});
export default {
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
      newData: {
        newNickname: "",
        newTitle: "",
      },
      response: "",
    };
  },
  components: {
    simpleheader,
  },
  created() {
    this.create();
  },
  methods: {
    create() {
      this.getUser();
    },
    getUser() {
      axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.data != null) {
          this.results = res.data.results;
        }
      });
    },
    async putUser() {
      this.newData.newNickname = this.results.nickname;
      this.newData.newTitle = this.results.title;
      await axios
        .put("http://127.0.0.1:3000/user/info", this.newData)
        .then((res) => {
          if (res.data.result == "OK") {
            // console.log(this.results);
            this.getUser();
            this.$toast("저장되었습니다!", {
              position: "top-right",
              timeout: 5000,
              closeOnClick: true,
              pauseOnFocusLoss: true,
              pauseOnHover: true,
              draggable: true,
              draggablePercent: 0.6,
              showCloseButtonOnHover: false,
              hideProgressBar: true,
              closeButton: "button",
              icon: true,
              rtl: false,
            });
          } else {
            // console.log("Ok", res);
            this.$toast(res.data.message, {
              position: "top-right",
              timeout: 5000,
              closeOnClick: true,
              pauseOnFocusLoss: true,
              pauseOnHover: true,
              draggable: true,
              draggablePercent: 0.6,
              showCloseButtonOnHover: false,
              hideProgressBar: true,
              closeButton: "button",
              icon: true,
              rtl: false,
            });
          }
        });
    },
    selectUploadFile() {
      var vue = this;
      let elem = document.createElement("input");
      // 이미지 파일 업로드 / 동시에 여러 파일 업로드
      elem.id = "image";
      elem.type = "file";
      elem.accept = "image/*";
      elem.multiple = true;
      // 클릭
      elem.click();
      // 이벤트 감지
      elem.onchange = function() {
        const formData = new FormData();
        for (var index = 0; index < this.files.length; index++) {
          formData.append("uploadFile", this.files[index]);
        }
        axios
          .post("http://127.0.0.1:3000/user/profile", formData, {
            headers: { "Content-Type": "multipart/form-data" },
          })
          .then((response) => {
            vue.results.picture = response.data.data.newPicture;
            vue.$toast(response.data.message, {
              position: "top-right",
              timeout: 5000,
              closeOnClick: true,
              pauseOnFocusLoss: true,
              pauseOnHover: true,
              draggable: true,
              draggablePercent: 0.6,
              showCloseButtonOnHover: false,
              hideProgressBar: true,
              closeButton: "button",
              icon: true,
              rtl: false,
            });
          })
          .catch((error) => {
            vue.response = error.message;
          });
      };
    },
  },
  toast() {},
};
</script>
