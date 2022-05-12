<template>
  <div id='modal' onselectstart='return false' >
      <div class="black-bg" @click="$emit('close-modal')"></div>
      <div class="content mg-bk ms-l">
        <h1>BTP Project : 거북이 진행도</h1>
        <img src="../assets/images/modal_turtle.png">
        <h3>※ 인류의 거북이화 진행도를 표기한 도표. 자세한 설명은 사건파일 정리(프로젝트 소개)를 참고</h3>
        <button type="button" class="btn-x" @click="$emit('close-modal')">✕</button>
      </div>
    </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/modalTurtle.scss";
</style>
<script>
export default {};
</script>

<style>
</style>