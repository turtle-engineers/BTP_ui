<template>
  <div>
    <simpleheader></simpleheader>
    <div>
      <div class="btp-container">
        <div>
          <section class="btp-title">
            <div style="width:100%;">
              <div style="width:60%; float: left;">
                <h1>마이 루틴</h1>
                <br />
                <p style="font-size:15px">
                  나만의 스트레칭 리스트를 짜고 알림이 울리면 리스트의<br />
                  스트레칭을 따라해보세요. 프로젝트에 참여할 수록 점점 내
                  몸이<br />
                  거북이에서 인간이 되가는걸 느낄 수 있을 거예요.
                </p>
              </div>
              <div style="width:40%; float: right; position: relative; ">
                <img src="../assets/images/timeBox.png" alt="" />
                <div style="position: absolute; top: 10%; left: 100px; ">
                  <h1 style="font-size: 30px">
                    총 {{ results.totalTimeMin }} 분
                    {{ results.totalTimeSec }} 초
                  </h1>
                </div>
                <div style="position: absolute; top: 55%; left: 60px;">
                  <button>
                    <img
                      src="../assets/images/button/myRoutineStart.png"
                      alt=""
                    />
                  </button>
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
        <div style="width:100%;">
          <section class="btp-title">
            <div>
              <router-link to="/myroutineedit">
                <button type="button">
                  <h2
                    style="font-size:30px; display:block; color: rgb(0, 0, 0)"
                  >
                    마이 루틴 리스트 편집하기 >
                  </h2>
                </button>
              </router-link>
              <table>
                <tr>
                  <td style="padding:10px" rowspan="2">
                    <button @click="nextList(num, cardNum, false)">
                      <img src="../assets/images/button/left.png" alt="" />
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      <div style="position: relative;">
                        <img
                          :src="
                            require(`../assets/images/card${cardNum % 4}.png`)
                          "
                        />
                        <div style="position: absolute; top: 0%; left: 0%;">
                          <img
                            :src="
                              `${
                                results.myRoutineList[num % results.listLen]
                                  .imageUrl
                              }`
                            "
                          />
                        </div>
                      </div>
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      <div style="position: relative;">
                        <img
                          :src="
                            require(`../assets/images/card${(cardNum + 1) %
                              4}.png`)
                          "
                        />
                        <div style="position: absolute; top: 0%; left: 0%;">
                          <img
                            :src="
                              `${
                                results.myRoutineList[
                                  (num + 1) % results.listLen
                                ].imageUrl
                              }`
                            "
                          />
                        </div>
                      </div>
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      <div style="position: relative;">
                        <img
                          :src="
                            require(`../assets/images/card${(cardNum + 2) %
                              4}.png`)
                          "
                        />
                        <div style="position: absolute; top: 0%; left: 0%;">
                          <img
                            :src="
                              `${
                                results.myRoutineList[
                                  (num + 2) % results.listLen
                                ].imageUrl
                              }`
                            "
                          />
                        </div>
                      </div>
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      <div style="position: relative;">
                        <img
                          :src="
                            require(`../assets/images/card${(cardNum + 3) %
                              4}.png`)
                          "
                        />
                        <div style="position: absolute; top: 0%; left: 0%;">
                          <img
                            :src="
                              `${
                                results.myRoutineList[
                                  (num + 3) % results.listLen
                                ].imageUrl
                              }`
                            "
                          />
                        </div>
                      </div>
                    </button>
                  </td>
                  <td style="padding:10px" rowspan="2">
                    <button @click="nextList(num, cardNum, true)">
                      <img src="../assets/images/button/right.png" />
                    </button>
                  </td>
                </tr>
                <tr>
                  <td style="padding:10px">
                    <button>
                      순서:
                      {{
                        results.myRoutineList[num % results.listLen]
                          .contentsOrder
                      }}
                      <p>
                        {{ results.myRoutineList[num % results.listLen].title }}
                      </p>
                      {{
                        results.myRoutineList[num % results.listLen].playTimes
                      }}
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      순서:
                      {{
                        results.myRoutineList[(num + 1) % results.listLen]
                          .contentsOrder
                      }}
                      <p>
                        {{
                          results.myRoutineList[(num + 1) % results.listLen]
                            .title
                        }}
                      </p>
                      {{
                        results.myRoutineList[(num + 1) % results.listLen]
                          .playTimes
                      }}
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      순서:
                      {{
                        results.myRoutineList[(num + 2) % results.listLen]
                          .contentsOrder
                      }}
                      <p>
                        {{
                          results.myRoutineList[(num + 2) % results.listLen]
                            .title
                        }}
                      </p>
                      {{
                        results.myRoutineList[(num + 2) % results.listLen]
                          .playTimes
                      }}
                    </button>
                  </td>
                  <td style="padding:10px">
                    <button>
                      순서:
                      {{
                        results.myRoutineList[(num + 3) % results.listLen]
                          .contentsOrder
                      }}
                      <p>
                        {{
                          results.myRoutineList[(num + 3) % results.listLen]
                            .title
                        }}
                      </p>
                      {{
                        results.myRoutineList[(num + 3) % results.listLen]
                          .playTimes
                      }}
                    </button>
                  </td>
                </tr>
              </table>
            </div>
          </section>
        </div>
      </div>
    </div>
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
