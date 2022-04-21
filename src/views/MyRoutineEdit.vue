<template>
  <div>
    <simpleheader></simpleheader>
    <div class="app-container">
      <div class="btp-container">
        <section class="btp-title">
          <h1>마이 루틴 편집</h1>
          <p>
            어떤 실험 동작을 넣어 볼까요? 원하는 스트레칭을 리스트에 담아
            보세요.
          </p>
        </section>
        <div class="myroutine-container">
          <section class="listbox">
            <h1>
              마이 루틴 리스트
            </h1>
            <div class="listbox-content">
              <img src="../assets/images/routineListBox.png" alt="" />
              <div class="listbox-timer">
                <h1>
                  총 {{ results.totalTimeMin }} 분 {{ results.totalTimeSec }} 초
                </h1>
              </div>
              <button class="listbox-button">
                <img src="../assets/images/button/routineSaveBtn.png" alt="" />
              </button>
              <div class="basic-scroll">
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
                <div class="routineComponent">
                  <img src="../assets/images/routineComponent.png" alt="" />
                </div>
              </div>
            </div>
          </section>
          <section class="stretch-container">
            <article class="category">
              <button class="category-btn-on">
                전체 스트레칭
              </button>
              <button class="category-btn-off">
                변수
              </button>
              <button class="category-btn-off">
                변수
              </button>
              <button class="category-btn-off">
                변수
              </button>
              <button class="category-btn-off">
                변수
              </button>
            </article>
            <article class="stretch-card">
              <button class="stretching-card">
                <img :src="require(`../assets/images/card0.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card1.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card2.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card1.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card2.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card3.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card0.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card1.png`)" />
              </button>
              <button class="stretching-card">
                <img :src="require(`../assets/images/card2.png`)" />
              </button>
            </article>
          </section>
        </div>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/myRoutineEdit.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
import axios from "axios";
export default {
  data() {
    return {
      sessionId: "",
      user: {
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
      results: {},
      response: "",
      num: 0,
      backNum: 0,
      cardNum: 0,
    };
  },
  created() {
    this.create();
  },
  components: {
    simpleheader,
  },
  methods: {
    create() {
      this.getUser();
    },
    getUser() {
      axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.data.results != null) {
          this.user = res.data.results;
          this.getMyRoutine();
        } else {
          window.location.replace("http://127.0.0.1:3000/oauth/kakao");
        }
      });
    },
    async getMyRoutine() {
      await axios
        .get("http://127.0.0.1:3000/my-routine/list", this.user.id)
        .then((res) => {
          if (res.data.result == "OK") {
            this.results = res.data.results;
            if (this.results.listLen < 4) {
              console.log(this.results.listLen);
              while (this.results.listLen < 4) {
                this.results.myRoutineList.push({ imageUrl: "" });
                this.results.listLen += 1;
              }
            }
            console.log(this.results.myRoutineList);
          }
        });
    },
    nextList(preNum, preCardNum, direction) {
      if (direction) {
        this.num = (preNum + 1) % this.results.listLen;
        this.cardNum = (preCardNum + 1) % 4;
      } else {
        this.num =
          preNum - 1 < 0
            ? this.results.listLen - 1
            : (preNum - 1) % this.results.listLen;
        this.cardNum = preCardNum - 1 < 0 ? 3 : (preCardNum - 1) % 4;
      }
      //   if (this.num > this.results.listLen) {
      //     this.num = 0;
      //   }
      //   if (this.num > this.results.listLen) {
      //     this.num = 0;
      //   }
    },
    // getBackground(preNum) {
    //   return require(this.cards[preNum]);
    // },
  },
};
</script>
