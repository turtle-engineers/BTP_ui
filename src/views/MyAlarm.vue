<template>
  <body>
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section class="btp-title">
        <h1>알람 설정</h1>
        <p>
          하루동안 받을 스트레칭 알람을 설정해보세요. <br />
          알람이 울리면 스트레칭을 하고 거북목과 어깨를 쭉쭉 펴주세요.
        </p>
      </section>
      <!-- 알람 (초록) -->
      <div class="alarm-wrap">
        <section class="alarm-stretching alarm-container">
          <dl>
            <dt>스트레칭 알림</dt>
            <dd>설정한 시간 동안 매 정각마다 알림이 울립니다.</dd>
          </dl>
          <!-- on off버튼 -->
          <div v-on:change="onoff" class="onoff-button">
            <input type="checkbox" id="stretching-switch" />
            <label for="stretching-switch"></label>
          </div>
          <div class="weekcheck">
            <h2>요일 선택</h2>
            <article>
              <p class="weekday" :class="isChecked ? 'true' : 'true'">월</p>
              <p class="weekday" :class="isChecked ? 'true' : 'false'">화</p>
              <p class="weekday" :class="isChecked ? 'true' : 'false'">수</p>
              <p class="weekday" :class="isChecked ? 'true' : 'false'">목</p>
              <p class="weekday" :class="isChecked ? 'true' : 'false'">금</p>
              <p class="weekday" :class="isChecked ? 'true' : 'false'">토</p>
              <p class="weekday" :class="isChecked ? 'true' : 'false'">일</p>
            </article>
          </div>

          <form>
            <fieldset>
              <legend>시작 시각</legend>
              <select name="start-clock">
                <option value="">00:00</option>
                <option value="">01:00</option>
                <option value="">02:00</option>
                <option value="">03:00</option>
                <option value="">04:00</option>
              </select>
            </fieldset>
            <fieldset>
              <legend>종료 시각</legend>
              <select name="end-clock">
                <option value="">00:00</option>
                <option value="">01:00</option>
                <option value="">02:00</option>
                <option value="">03:00</option>
                <option value="">04:00</option>
              </select>
            </fieldset>
          </form>
        </section>
        <!-- 알람(파랑) -->
        <section class="alarm-challenge alarm-container">
          <dl>
            <dt>랜덤 챌린지 알림</dt>
            <dd>
              스트레칭 알림을 받기로 설정한 시간동안 <br />
              매 정각마다 알림이 울립니다.
            </dd>
          </dl>
          <div v-on:change="onoff" class="onoff-button">
            <input type="checkbox" id="challenge-switch" />
            <label for="challenge-switch"></label>
          </div>
          <dl class="sub-title">
            <dt>랜덤 챌린지란?</dt>
            <dd>
              아래의 예시처럼 잠깐 동안의 휴식을<br />
              상기 시켜주는 알림입니다.
            </dd>
          </dl>
          <div class="random-challenge">
            <span>
              💦(예시) 1시간이 지났어요. 💦<br />
              물을 한잔 마셔 볼까요?
            </span>
          </div>
        </section>
        <img
          class="alarm-scientist"
          src="../assets/images/alarm-scientist.png"
          alt="알람 과학자"
        />
      </div>
    </div>
  </body>
</template>
<style lang="scss" scoped>
@import "@/assets/scss/variables.scss";
@import "@/assets/scss/common.scss";
@import "@/assets/scss/components/myAlarm.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
export default {
  data() {
    return {
      isChecked: false,
    };
  },
  components:{
    simpleheader
  },
  methods: {
    onoff() {
      console.log(document.getElementById('stretching-switch').checked);
      console.log(document.getElementById('challenge-switch').checked);
    }
  }
};
</script>
