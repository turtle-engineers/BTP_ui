<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <!-- 상단 타이틀 + 시간/시작 -->
      <section class="btp-title">
        <h1>스트레칭 가이드</h1>
        <p>
          거북이에서 다시 인간이 되기 위해 스트레칭을 따라해보세요.
        </p>
      </section>
      <!-- 스트레칭 메뉴 -->
      <StretchList></StretchList>
    </div>
  </div>
</template>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
import StretchList from '../components/StretchList.vue';
export default {
  components: {
    simpleheader,
    StretchList,
  },
};
</script>
<style>
</style>