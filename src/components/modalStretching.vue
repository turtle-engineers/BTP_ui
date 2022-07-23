<template>
  <div id='modal' onselectstart='return false' >
    <div class="black-bg" @click="$emit('close-modal')"></div>
    <div class="content mg-wh ms-m">
      <img src="../assets/images/ex-img.png">
      
      <div class="modal-body">
        <h1>{{ contentInfo.title }}</h1>
        <h3 v-html="contentInfo.description"></h3>

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
      viewTime: '00 : 00',
      repeatCnt: 1
    };
  },
  created() {
    this.timeEnit();
  },
  watch: {
    repeatCnt: function () {
      let time = this.contentInfo.playTime * this.repeatCnt;
      let min = parseInt((time%3600)/60);
      let sec = time%60;
      this.viewTime = String(min).padStart(2,'0') + " : " + String(sec).padStart(2,'0');
    }
  },
  methods: {
    emitStretchData() {
      this.contentInfo.repeatCnt = this.repeatCnt;
      this.$emit("stretchData", this.contentInfo);
    },
    timeMinus() {
      if(0 >= this.repeatCnt-1) {
        return;
      }
      this.repeatCnt -= 1;
    },
    timePlus() {
      this.repeatCnt += 1;
    },
    timeEnit() {
      this.repeatCnt = 1;
      this.viewTime = '00 : ' + this.contentInfo.playTime;
    }
  },
};
</script>