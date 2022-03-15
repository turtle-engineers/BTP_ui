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
            <h1>11월 둘째 주</h1>
            <article class="weekcheck">
              <!-- v-on:change="updateIsChecked" -->
              <input type="checkbox" value="0" id="mon" name="dayAlarmOnOff" />
              <label class="weekday" for="mon">월</label>
              <input type="checkbox" value="1" id="tue" name="dayAlarmOnOff" />
              <label class="weekday" for="tue">화</label>
              <input type="checkbox" value="2" id="wed" name="dayAlarmOnOff" />
              <label class="weekday" for="wed">수</label>
              <input type="checkbox" value="3" id="thu" name="dayAlarmOnOff" />
              <label class="weekday" for="thu">목</label>
              <input type="checkbox" value="4" id="fri" name="dayAlarmOnOff" />
              <label class="weekday" for="fri">금</label>
              <input type="checkbox" value="5" id="sat" name="dayAlarmOnOff" />
              <label class="weekday" for="sat">토</label>
              <input type="checkbox" value="6" id="sun" name="dayAlarmOnOff" />
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
          <img src="../assets/images/attendance-balloon.png" alt="말풍선: 육지로 돌아갈 날이 얼마 남지 않았어!" />
          <img src="../assets/images/attendance-scientist.png" alt="과학자" />
          <img src="../assets/images/attendance-science.png" alt="유리돔" />
          <img :src="require(`../assets/images/level${level}.png`)" alt="단계별 거북이 이미지" />
        </section>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/ProjectAttendance.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
export default {
  data() {
    return {
      progress: 50,
      level: 1,
    };
  },
  components: {
    simpleheader,
  },
};
</script>
