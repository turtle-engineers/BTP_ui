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
      <section class="attendance-wrap">
        <!-- week check -->
        <div class="weekcheck">
          <!-- TODO : month 추가 -->
          <h1>11월 둘째 주</h1>
          <article class="weekcheck" onclick="return false;">
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
      </section>
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
    return {};
  },
  components: {
    simpleheader,
  },
};
</script>
