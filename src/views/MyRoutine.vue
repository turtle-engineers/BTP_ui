<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <div class="routine-title">
        <section class="btp-title">
          <h1>마이 루틴</h1>
          <p>
            나만의 스트레칭 리스트를 짜고 알림이 울리면 <br />
            리스트의 스트레칭을 따라해보세요. <br />
            프로젝트에 참여할 수록 점점 내 몸이 <br />
            거북이에서 인간이 되가는걸 느낄 수 있을 거예요.
          </p>
        </section>

        <!-- 시간, 시작 -->
        <article class="routine-starter">
          <p>
            총 <span>{{ minutes }}</span
            >분 <span>{{ seconds }}</span
            >초
          </p>
          <router-link to="/MyRoutineStretching">
            <button type="button">마이 루틴 시작</button>
          </router-link>
        </article>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/myroutine.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
export default {
  data() {
    return {
      minutes: 0,
      seconds: 0,
    };
  },
  components: {
    simpleheader,
  },
};
</script>
