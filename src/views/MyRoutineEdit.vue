<template>
  <div>
    <simpleheader></simpleheader>
    <div class="app-container">
      <div class="btp-container">
        <div>
          <section class="btp-title">
            <div style="width:100%;">
              <h1>마이 루틴 편집</h1>
              <br />
              <p style="font-size:15px">
                어떤 실험 동작을 넣어 볼까요? 원하는 스트레칭을 리스트에 담아
                보세요.
              </p>
            </div>
            <div style="width:100%; display:flex; ">
              <div style="padding: 0px 30px 100px 0px; float: left;">
                <h1 style="font-size: 30px">
                  마이 루틴 리스트
                </h1>
                <div style="position: relative; ">
                  <img src="../assets/images/routineListBox.png" alt="" />
                  <div style="position: absolute; top:10px; left: 80px; ">
                    <h1 style="font-size: 20px">
                      총 {{ results.totalTimeMin }} 분
                      {{ results.totalTimeSec }} 초
                    </h1>
                  </div>
                  <div style="position: absolute; top:80px; left: 75px; ">
                    <button>
                      <img
                        src="../assets/images/button/routineSaveBtn.png"
                        alt=""
                      />
                    </button>
                  </div>
                  <div
                    class="basic-scroll"
                    style="overflow-x:hidden; width:250px; height:480px; position: absolute; top:120px; left: 18px; "
                  >
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                    <div style="padding:5px 0px 5px 0px">
                      <img src="../assets/images/routineComponent.png" alt="" />
                    </div>
                  </div>
                </div>
              </div>
              <div style="flex-grow: 1; float: right; position: relative; ">
                <div>
                  <button
                    style="background-color:#61C997; height:30px; border-radius:10px; color:white; padding: 0px 20px 0px 20px; margin:20px 10px 20px 10px "
                  >
                    전체 스트레칭
                  </button>
                  <button
                    style="background-color:#ECF0F4; height:30px; border-radius:10px; padding: 0px 20px 0px 20px; margin:20px 10px 20px 0px"
                  >
                    변수
                  </button>
                  <button
                    style="background-color:#ECF0F4; height:30px; border-radius:10px; padding: 0px 20px 0px 20px; margin:20px 10px 20px 0px"
                  >
                    변수
                  </button>
                  <button
                    style="background-color:#ECF0F4; height:30px; border-radius:10px; padding: 0px 20px 0px 20px; margin:20px 10px 20px 0px"
                  >
                    변수
                  </button>
                  <button
                    style="background-color:#ECF0F4; height:30px; border-radius:10px; padding: 0px 20px 0px 20px; margin:20px 10px 20px 0px"
                  >
                    변수
                  </button>
                </div>
                <div>
                  <div>
                    <button style="margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card0.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card1.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card2.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card1.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card2.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card3.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card0.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card1.png`)" />
                    </button>
                    <button style=" margin:10px 10px 10px 10px">
                      <img :src="require(`../assets/images/card2.png`)" />
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
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
