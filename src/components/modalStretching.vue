<template>
  <div id='modal' onselectstart='return false' >
    <modalSmall v-if="isModalViewed" @close-modal="closeModal"></modalSmall>
    <div class="black-bg" @click="$emit('close-modal')"></div>
    <div class="content mg-wh ms-m">
      <img src="../assets/images/ex-img.png">
      
      <div class="modal-body">
        <h1>{{ contentInfo.title }}</h1>
        <h3>{{ contentInfo.description }}</h3>

        <div class="m-stretching-time">
          <button class="minus" @click="minus">
            <img src="../assets/icon/btn-minus.png" />
          </button>
          <div class="time">{{ contentInfo.playTime }}</div>
          <button class="plus" @click="plus">
            <img src="../assets/icon/btn-plus.png" />
          </button>
        </div>
      </div>

      <div class="modal-bottom">
        <b-row class="m-str-btn">
          <b-col>
            <button @click="init">
              초기화
            </button>
          </b-col>
          <b-col>
            <button v-on:click="isModalViewed = true">
              추가하기
            </button>
          </b-col>
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
import modalSmall from "../components/modalSmall";
export default {
  props: {
    contentInfo: {
      type: Object,
      default: () => {
        return {
          id: '0',
          title: 'SAMPLE TITLE',
          description: '스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명스트레칭 관련 설명',
          playTime: '00:00',
        };
      },
    },
  },
  components: {
    modalSmall,
  },
  methods: {
    closeModal() {
      this.isModalViewed = false;
    },
  },
};
</script>