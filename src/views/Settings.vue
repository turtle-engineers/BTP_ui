<template>
  <div>
    <div v-if="showWrap"></div>
    <h1>마이 프로필 설정</h1>
    <div>
      <table style="width:400px">
        <tr>
          <td>
            <p style="font-size:15px">프로필</p>
          </td>
          <td>
            <p style="font-size:15px">닉네임</p>
          </td>
        </tr>
        <tr>
          <td rowspan="3">
            <button @click="selectUploadFile()">
              <img
                v-bind:src="results.picture"
                width="100px"
                height="100px"
                style="border-radius: 50px;"
              />
            </button>
            <br />
            <button class="button button-close" @click="putUser()">
              저장
            </button>
          </td>
          <td>
            <input class="input" v-model="results.nickname" />
          </td>
        </tr>
        <tr>
          <td>
            <p style="font-size:15px">나의 다짐</p>
          </td>
        </tr>
        <tr>
          <td>
            <input class="input" v-model="results.title" />
          </td>
        </tr>
        <tr>
          <td colspan="2" style="text-align: right">
            <button>
              탈퇴하기
            </button>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>
<style scoped>
.button {
  border: white;
  border-style: solid;
  border-radius: 15px;
  width: 100px;
  height: 30px;
}
.button-close {
  background-color: greenyellow;
}

.input {
  border: black;
  border-style: solid;
  border-radius: 10px;
  width: 200px;
  height: 30px;
  background-color: white;
}
</style>
<script>
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
      newData: {
        newNickname: "",
        newTitle: "",
      },
      response: "",
    };
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
