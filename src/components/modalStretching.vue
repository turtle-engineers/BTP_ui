<template>
  <div id='modal' onselectstart='return false' >
    <div class="black-bg" @click="$emit('close-modal')"></div>
    <div class="content mg-wh ms-m">
      <img src="../assets/images/ex-img.png">
      
      <div class="modal-body">
        <h1>{{ contentInfo.title }}</h1>
        <h3>{{ contentInfo.description }}</h3>

        <div class="m-stretching-time">
          <button class="minus" @click="timeMinus">
            <img src="../assets/icon/btn-minus.png" />
          </button>
          <div class="time">{{ viewTime }}</div>
          <button class="plus" @click="timePlus">
            <img src="../assets/icon/btn-plus.png" />
          </button>
        </div>
      </div>

      <div class="modal-bottom">
        <b-row class="m-str-btn">
          <b-col>
            <button @click="timeEnit">
              초기화
            </button>
          </b-col>
          <b-col>
            <button @click="emitStretchData">
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
export default {
  props: {
    contentInfo: {
      type: Object,
      default: () => {
        return {
          id: '0',
          title: 'SAMPLE TITLE',
          description: '스트레칭 설명',
          playTime: 0,
        };
      },
    },
  },
  data() {
    return {
      viewTime: '00 : 00'
    };
  },
  created() {
    this.timeEnit();
  },
  methods: {
    emitStretchData() {
      this.$emit("stretchData", this.contentInfo);
    },
    timeMinus() {
      let time = this.viewTime.split(':');
      let min = Number(time[0]) * 60;
      let minusTime = min + Number(time[1]) - this.contentInfo.playTime;

      if(0 >= minusTime) {
        return;
      }

      min = parseInt((minusTime%3600)/60);
      let sec = minusTime%60;
      this.viewTime = String(min).padStart(2,'0') + " : " + String(sec).padStart(2,'0');
    },
    timePlus() {
      let time = this.viewTime.split(':');
      let min = Number(time[0]) * 60;
      let plusTime = min + Number(time[1]) + this.contentInfo.playTime;

      min = parseInt((plusTime%3600)/60);
      let sec = plusTime%60;
      this.viewTime = String(min).padStart(2,'0') + " : " + String(sec).padStart(2,'0');
    },
    timeEnit() {
      this.viewTime = '00 : ' + this.contentInfo.playTime;
    }
  },
};
</script>