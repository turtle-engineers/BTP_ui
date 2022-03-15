<template>
  <div>
    <simpleheader></simpleheader>
    <div>
      <h1>프로젝트 참여표</h1>
      <p>스트레칭을 완료했어요!</p>
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
