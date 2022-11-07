<template>
  <div id='modal' onselectstart='return false' >
    <div class="black-bg" @click="$emit('close-modal')"></div>
    <div class="content mg-wh ms-m">
      <div class="video-wrap">
        <youtube 
          style="width:100%; height: 100%; position:absolute; top:0; left:0;"
          :video-id="`${videoId}`"
          :player-vars="playerVars"
          @ready="ready"
          @playing="playing"
          @ended="ended"
          @error="error"
          ref="youtube" />
      </div>
      
      <div class="modal-body">
        <h1>{{ contentInfo.title }}</h1>
        <h3 v-html="contentInfo.description"></h3>
        <div class="m-stretching-time">
          <button class="minus" @click="timeMinus">
            <img src="@/assets/icon/btn-minus.png" />
          </button>
          <div class="time">{{ viewTime }}</div>
          <button class="plus" @click="timePlus">
            <img src="@/assets/icon/btn-plus.png" />
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
            <button @click="modalActionSelect">
              {{ btnText }}
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
import Vue from "vue";
import VueYoutube from "vue-youtube";
Vue.use(VueYoutube);
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
    modalAction: {
      type: String,
      default: 'emitStretchData'
    }
  },
  data() {
    return {
      viewTime: '00 : 00',
      repeatCnt: 1,
    };
  },
  created() {
    this.timeEnit();
  },
  computed: {
    playerVars() {
      return {
        controls: 0,
        player3: Object,
        rel: 0,
        autoplay: 1,
        enablejsapi: 1,
        fs: 0,
        playsinline: 1,
        ivLoadPolicy2: 1,
        playlist: this.videoId,
        muted: 1,
        loop: 1,
        // iv_load_policy:3,
        start: this.start,
        end: this.end
      };
    },
    imgUrl: function () {
      return this.contentInfo.imgUrl ? this.contentInfo.imgUrl : 'sample/' + this.contentInfo.category + '.png';
    },
    videoId: function () {
      var url = "";
      console.log(this.contentInfo)
      if(this.contentInfo.videoUrl){
        console.log("testset")
        var urlSplit = this.contentInfo.videoUrl.split("/");
        url = urlSplit[urlSplit.length - 1];
      }else{
        console.log("testsetdaa")
        url = "UnKPaWC5zDg";
      }
      return url;
    },
    btnText: function () {
      return this.modalAction == 'emitStretchData' ? '추가하기' : '시작하기';
    }
  },
  watch: {
    repeatCnt: function () {
      let time = this.contentInfo.playTime * this.repeatCnt;
      let min = parseInt((time%3600)/60);
      let sec = time%60;
      this.viewTime = String(min).padStart(2,'0') + ' : ' + String(sec).padStart(2,'0');
    }
  },
  methods: {
    ready(){},
    playing(){},
    ended(){},
    error(){},
    modalActionSelect() {
      this.contentInfo.repeatCnt = this.repeatCnt;
      this.modalAction == 'emitStretchData' ? this.$emit('stretchData', this.contentInfo) : this.goStretchingVideo();
    },
    goStretchingVideo() {
      this.$router.push({
          name: '/stretchingVideo',
          params: { 
            title:this.contentInfo.title,
            category:this.contentInfo.category,
            imgName:this.contentInfo.imgUrl,
            videoName:this.contentInfo.videoUrl
          }
        });
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