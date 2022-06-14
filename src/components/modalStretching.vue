<template>
  <div id='modal' onselectstart='return false' >
    <div class="black-bg" @click="$emit('close-modal')"></div>
    <div class="content mg-wh ms-m">
      <img src="../assets/images/ex-img.png">
      
      <div class="modal-body">
        <h1>어깨돌리기 스트레칭</h1>
        <h3>스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명</h3>

        <div class="m-stretching-time">
          <button class="minus" @click="minus">
            <img src="../assets/icon/btn-minus.png" />
          </button>
          <div class="time">00:20</div>
          <button class="plus" @click="plus">
            <img src="../assets/icon/btn-plus.png" />
          </button>
        </div>
      </div>

      <div class="modal-bottom">
        <b-row class="m-str-btn">
          <b-col>초기화</b-col>
          <b-col>추가하기</b-col>
        </b-row>
      </div>
      
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