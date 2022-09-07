<template>
  <div id='modal' onselectstart='return false' >
    <div class="black-bg" @click="$emit('close-modal')"></div>
    <div class="content mg-wh ms-s">
      <div class="modal-body">
        <h1>마이 루틴 저장하기</h1>
        <h3>마이 루틴을 이 상태로 저장하시겠습니까?</h3>
      </div>

      <div class="modal-bottom">
        <b-row class="m-str-btn">
          <b-col @click="$emit('close-modal')">취소</b-col>
          <b-col @click="$emit('saveMyroutine')">저장</b-col>
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