<template>
  <div class="body">
    <!-- 헤더(흰색) -->
    <header class="header">
      <div class="header-logo">
        <a href="#"><img src="..\assets\images\logo\logo.svg"/></a>
      </div>
      <button @click="toggleOnOff" :class="[toggleOn ? 'toggleClose' : 'toggleOpen']">
        <img src="../assets/icon/menu.svg" />
      </button>
      <div class="toggle-menu" v-if="toggleOn">
        <ToggleMenu></ToggleMenu>
      </div>
      <div class="nav-container">
        <nav>
          <ul>
            <router-link to="/stretchingGuide" class="menu-item">
              <li class="menu-text">스트레칭 가이드</li>
            </router-link>
            <router-link to="/myroutine" class="menu-item">
              <li class="menu-text">마이 루틴</li>
            </router-link>
            <router-link to="/story" class="menu-item">
              <li class="menu-text">프로젝트 소개</li>
            </router-link>
          </ul>
        </nav>
        <div class="my-menu">
          <img src="../assets/icon/mypage.svg" @click="loginAtBackServer('/account')" />
          <img src="../assets/icon/notification.svg" @click="loginAtBackServer('/alarm')"/>
        </div>
      </div>
    </header>

    <!-- banner -->
    <div class="banner">
      <div class="banner-text">
        <h1>BTP PROJECT</h1>
        <p>
          현대사회 사람은 지속해서 스트레칭 하지 않으면 거북이가 되어버립니다.<br />
          거북이가 되면 육지를 떠나야한다는 사실을 알고 계십니까?<br />
          BTP 프로젝트는 인류의 거북이화를 예방하기 위한 프로젝트로서<br />
          당신은 이 프로젝트에 자유롭게 참여할 수 있습니다.<br />
        </p>
      </div>
      <!-- <img class="banner-img" src="../assets/images/banner.png"> -->
    </div>

    <!-- main -->
    <div class="btp-container">
      <div class="main">
        <!-- 브랜드 소개 -->
        <div class="brand">
          <h1>PROJECT STORY</h1>
          <img src="../assets/images/brand.svg" />
          <p>
            인류는 새로운 진화의 국면에 접어들었습니다. 본 프로젝트의 과학자들은<br />
            인류가 거북이로 진화하는 것을 막기위한 새로운 프로젝트:[Back to the people project…]를 시행,<br />
            이는 인류에게 알려질 시 큰일이 날 수 있는 프로젝트, 비밀리에 시행되는 프로젝트에 당신은 선발되었습니다.<br />
            프로젝트를 좀 더 알고 싶다면 아래 버튼을 클릭하세요.
          </p>
          <router-link to="/story">
            <div class="showMore">MORE</div>
          </router-link>
        </div>


        <!-- 나의 거북이, 오늘의 목표 -->
        <b-container :class="[loginStatus ? 'loginOpen' : 'loginClose']">
          <b-row class="myturtle" align-h="between">
            <b-col class="myturtle-title">
              <h1>BTP<br />PROJECT</h1>
              <img :src="require('@/assets/images/main_arrow.png')" />
            </b-col>
            <b-col class="turtle">
              <div class="view card-w">
                <cm-t>나의 거북이</cm-t>
                <img :src="require('@/assets/images/turtle.png')" />
                <cm-b>
                  <f1>LV.</f1>
                  <f2>00</f2>
                </cm-b>
              </div>
            </b-col>
            <b-col class="goal">
              <div class="view card-g">
                <cm-t>오늘의 목표</cm-t>
                <cm-m>
                  <input type="checkbox" id="g1" name="today-goal" disabled />
                  <label for="g1"><span></span>스트레칭 시작하기</label><br />
                  <input type="checkbox" id="g2" name="today-goal" disabled />
                  <label for="g2"><span></span>오늘 목표치의 50% 달성하기</label><br />
                  <input type="checkbox" id="g3" name="today-goal" disabled />
                  <label for="g3"><span></span>오늘 목표치 100% 달성하기</label>
                </cm-m>
                <cm-b>
                  <f1>실험 참여 횟수</f1>
                  <f2>00</f2>
                </cm-b>
              </div>
            </b-col>
          </b-row>
        </b-container>


        <!-- 메인 프로젝트 -->
        <div class="btp-menu">
          <div class="title title-g">
            <img src="../assets/icon/circle-green.png" />
            <h1>MAIN PROJECT</h1>
            <p>본 프로젝트로 계획된 플랜을 살펴볼 수 있습니다.</p>
          </div>
          <!-- 상세 메뉴 -->
          <div class="project-menu">
            <div :class="[side1 ? 'project-item-front' : 'project-item-back']">
              <!-- <div class="project-item-front"> -->
              <img class="project-icon" :src="require(`../assets/images/stretching${imgName1}.png`)" />

              <div class="container">
                <div class="project-title">
                  <h1>스트레칭 가이드</h1>
                  <h2>Stretching Guide</h2>
                </div>
                <p class="project-text">
                  <b>스트레칭가이드 사용방법 예시</b><br />
                  1. 스트레칭을 할 부위를 고릅니다.<br />
                  2. 지속 시간을 선택해주세요.<br />
                  3. 진행에 맞추어 스트레칭 해주세요.
                </p>
              </div>
              <button class="showbtn" @click="showDesc1">
                <img src="../assets/icon/question-btn.png" />
              </button>
              <router-link to="/stretchingGuide">
                <div class="start">START</div>
              </router-link>
            </div>
            <div :class="[side2 ? 'project-item-front' : 'project-item-back']">
              <!-- <div class="project-item-back"> -->
              <img class="project-icon" :src="require(`../assets/images/myroutine${imgName2}.png`)" />
              <div class="container">
                <div class="project-title">
                  <h1>마이 루틴</h1>
                  <h2>My Stretching Routine</h2>
                </div>
                <p class="project-text">
                  <b>마이 루틴 사용방법 예시</b><br />
                  1. 선호하는 스트레칭을 고릅니다.<br />
                  2. 마이 루틴에 추가해주세요.<br />
                  3. 진행에 맞추어 스트레칭 해주세요.
                </p>
              </div>
              <button class="showbtn" @click="showDesc2">
                <img src="../assets/icon/question-btn.png" />
              </button>
              <router-link to="/myroutine">
                <div class="start">START</div>
              </router-link>
            </div>
            <div :class="[side3 ? 'project-item-front' : 'project-item-back']">
              <!-- <div class="project-item-back"> -->
              <img class="project-icon" :src="require(`../assets/images/random_challenge${imgName3}.png`)" />
              <div class="container">
                <div class="project-title">
                  <h1>랜덤 챌린지</h1>
                  <h2>Random Challenge</h2>
                </div>
                <p class="project-text">
                  <b>랜덤 챌린지 사용방법 예시</b><br />
                  1. 랜덤 챌린지 알람을 켜주세요.<br />
                  2. 정각마다 프로젝트가 제공됩니다.<br />
                  3. 제공된 내용에 맞춰 진행하면 성공!
                </p>
              </div>
              <button class="showbtn" @click="showDesc3">
                <img src="../assets/icon/question-btn.png" />
              </button>
              <router-link to="/alarm">
                <div class="start">START</div>
              </router-link>
            </div>
          </div>
        </div>


        <!-- 스트레칭 캘린더 -->
        <div :class="[loginStatus ? 'loginOpen' : 'loginClose']">
          <div class="title title-g">
            <img />
            <h1>RESEARCH RECORD</h1>
            <p>지금까지 진행한 현황을 볼 수 있습니다.</p>
          </div>
          <div class="calender-menu">
            <b-row class="calendar-top" align-v="end">
              <img
                class="calendar-pad-img"
                :src="require('@/assets/images/ipad_top.png')"
              />
            </b-row>
            <b-row class="calendar-middle">
              <img
                class="calendar-pad-img"
                :src="require('@/assets/images/ipad_middle.png')"
              />
              <div class="calendar-body">
                <img
                  class="calendar-logo"
                  :src="require('@/assets/images/logo/process_logo.png')"
                />
                <hr />

                <div class="title title-w">
                  <img />
                  <h1>STRETCHING CALENDAR</h1>
                </div>
                <Calendar></Calendar>

                <!-- <div class="calendar-title title-w">
                            <img><h1>MISSION TEN TIMES</h1>
                        </div>
                        <div class="mission-card">
                            <table>
                                <tr>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                    <td><div class="circle"><span>C</span></div></td>
                                </tr>
                            </table>
                        </div> -->
              </div>
            </b-row>
            <b-row class="calendar-bottom">
              <img class="calendar-pad-img" :src="require('@/assets/images/ipad_bottom.png')" />
            </b-row>
          </div>
        </div>


      </div>
    </div>



    <button id="topBtn">
      <a href="#"><img src="../assets/icon/to-up-btn.png"/></a>
    </button>
  </div>
</template>
<style lang="scss" scoped>
@import "@/assets/scss/components/home.scss";
@import "@/assets/scss/components/header.scss";
@import "@/assets/scss/components/brand.scss";
@import "@/assets/scss/variables.scss";
@import "@/assets/scss/common.scss";
@import "@/assets/scss/components/login.scss";
</style>
<script src="{{ asset('js/app.js') }}" defer></script>
<script>
import axios from "axios";
import ToggleMenu from "../components/ToggleMenu.vue";
import Calendar from "../components/Calendar.vue";
axios.defaults.withCredentials = true;

export default {
  components: {
    ToggleMenu,
    Calendar,
  },
  data() {
    return {
      side1: true,
      imgName1: "",

      side2: true,
      imgName2: "",

      side3: true,
      imgName3: "",

      toggleOn: false, //이따 false
      loginStatus: false,

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
  async created() {
    await this.getUser();
  },
  methods: {
    getUser() {
      axios.get('http://127.0.0.1:3000/user/info').then((res) => {
        if (res.data.results != null) {
          this.loginStatus = true;
        } else {
          this.loginStatus = false;
        }
      });
    },
    async loginAtBackServer(link) {
      await axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.status == 200) {
          if (res.data.result != "FAIL") {
            console.log(res.data.result);
            window.location.replace(link);
          } else {
            window.location.replace("http://127.0.0.1:3000/oauth/kakao");
          }
        }
      });
    },
    showDesc1() {
      if (this.side1) {
        this.imgName1 = "_back";
      } else {
        this.imgName1 = "";
      }
      this.side1 = !this.side1;
    },
    showDesc2() {
      if (this.side2) {
        this.imgName2 = "_back";
      } else {
        this.imgName2 = "";
      }
      this.side2 = !this.side2;
    },
    showDesc3() {
      if (this.side3) {
        this.imgName3 = "_back";
      } else {
        this.imgName3 = "";
      }
      this.side3 = !this.side3;
    },
    toggleOnOff() {
      this.toggleOn = !this.toggleOn;
    },
  },
};
</script>
