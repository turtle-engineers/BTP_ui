<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <!-- 타이틀 -->
      <div class="btp-title">
        <p>스트레칭을 완료했어요!</p>
        <h1>프로젝트 참여표</h1>
      </div>
      <!-- 참여표 -->
      <div class="attendance-container">
        <section class="attendance-wrap">
          <!-- week check -->
          <div class="weekcheck">
            <!-- TODO : month 추가 -->
            <h1>{{ this.month }}월 둘째 주</h1>
            <article class="weekcheck">
              <!-- v-on:change="updateIsChecked" -->
              <input type="checkbox" value="0" id="mon" name="dayAttendance" />
              <label class="weekday" for="mon">월</label>
              <input type="checkbox" value="1" id="tue" name="dayAttendance" />
              <label class="weekday" for="tue">화</label>
              <input type="checkbox" value="2" id="wed" name="dayAttendance" />
              <label class="weekday" for="wed">수</label>
              <input type="checkbox" value="3" id="thu" name="dayAttendance" />
              <label class="weekday" for="thu">목</label>
              <input type="checkbox" value="4" id="fri" name="dayAttendance" />
              <label class="weekday" for="fri">금</label>
              <input type="checkbox" value="5" id="sat" name="dayAttendance" />
              <label class="weekday" for="sat">토</label>
              <input type="checkbox" value="6" id="sun" name="dayAttendance" />
              <label class="weekday" for="sun">일</label>
            </article>
          </div>
          <hr />
          <!-- 거북이 진행도 -->
          <h1>오늘의 거북이 진행도</h1>
          <div id="progress">
            <h1>{{ progress }}</h1>
            <h2>%</h2>
            <progress v-bind:value="progress" max="100"></progress>
          </div>
        </section>
        <!-- 거북이 이미지 -->
        <section class="attendance-scientist">
          <img
            src="../assets/images/attendance-balloon.png"
            alt="말풍선: 육지로 돌아갈 날이 얼마 남지 않았어!"
          />
          <img src="../assets/images/attendance-scientist.png" alt="과학자" />
          <img src="../assets/images/attendance-science.png" alt="유리돔" />
          <img :src="require(`../assets/images/level${level}.png`)" alt="단계별 거북이 이미지" />
        </section>
      </div>
      <div class="bottom"></div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/ProjectAttendance.scss";
</style>
<script>
import axios from "axios";
import simpleheader from "../components/layout/simpleheader.vue";
export default {
  data() {
    return {
      month: 0,
      progress: 0,
      level: 1,
    };
  },
  components: {
    simpleheader,
  },
  created: function() {
    //이번 달
    const date = new Date();
    this.month = date.getMonth() + 1;
    this.getAttendance();
  },
  methods: {
    getAttendance() {
      axios.get("http://127.0.0.1:3000/user/info").then((res) => {
        if (res.status == 200) {
          if (res.data.result != "FAIL") {
            const doneDay = res.data.results.dd;
            //이번주 월~금 일수를 구한다.
            const date = new Date();
            const monday = date.getDate() - (date.getDay() - 1);
            const sunday = date.getDate() + (7 - date.getDay());
            //이번주 달력
            let week = [];
            for (let i = monday; i <= sunday; i++) {
              week.push(i);
            }
            //for each를 통해 dd에서 있는지 살핀다.
            week.forEach((element, index) => {
              //만약 dd안에 있다면, el의 index가 value값인 체크박스를 체크한다.
              if (doneDay.includes(element)) {
                document.querySelectorAll("input[name=dayAttendance]")[index].checked = true;
              }
            });
          }
        }
      });
    },
  },
};
</script>
