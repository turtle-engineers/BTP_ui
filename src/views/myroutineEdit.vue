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
            <h1>마이 루틴 리스트</h1>
            <div class="listbox-content">
              <h2 class="listbox-timer">
                총 <span>{{ results.totalTimeMin }}</span
                >분 <span>{{ results.totalTimeSec }}</span
                >초
              </h2>
              <button class="listbox-button">저장하기</button>
              <div class="basic-scroll">
                <draggable
                  class="draggable-list"
                  :list="routineArray"
                  group="my-group"
                >
                  <div
                    class="list-item"
                    v-for="element, index in routineArray"
                    :key="index"
                  >
                    <myroutineList
                    :routineInfo="element"
                    ></myroutineList>
                  </div>
                </draggable>
              </div>
            </div>
          </section>
          <section class="stretch-container">
            <article class="category">
              <button class="category-btn on">
                전체 스트레칭
              </button>
              <button class="category-btn off">
                변수
              </button>
              <button class="category-btn off">
                변수
              </button>
              <button class="category-btn off">
                변수
              </button>
              <button class="category-btn off">
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
import myroutineList from "../components/myroutineList.vue";
import draggable from "vuedraggable";
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
      results: {
        totalTimeMin: "00",
        totalTimeSec: "00",
      },
      response: "",
      num: 0,
      backNum: 0,
      cardNum: 0,

      list1: [{ name: "Drag Me!" }, { name: "Drag Me Too!" }],
      routineArray: [],
    };
  },
  created() {
    this.create();
  },
  components: {
    simpleheader,
    myroutineList,
    draggable,
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
      await axios({
        method: "get",
        url: "http://127.0.0.1:3000/my-routine/list",
        params: { userId: this.user.id },
      }).then((res) => {
        if (res.data.result == "OK") {
          this.routineArray = res.data.results;
          console.log(this.routineArray);
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
