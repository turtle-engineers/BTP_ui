<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section>
        <div class="progress-time">
          <h1>마이루틴 스트레칭 진행률</h1>
          <p>{{ TimerStr }} / {{ totalTime.minutes }} : {{ totalTime.seconds }}</p>
        </div>
        <!-- 마이루틴 진행률-->
        <div class="progress">
          <progress value="0" max="100"
            v-for="(videoArray, i) in routineArray"
            :key="i">
          </progress>
        </div>
      </section>
      <section class="btp-title">
        <h3>{{ titleChange }} 스트레칭</h3>
        <h1>{{ videoTitle }}</h1>
      </section>
      <div class="video-view">
        <div class="video-wrap">
          <youtube 
            style="width:100%; height: 100%; position:absolute; top:0; left:0;"
            :video-id="videoId"
            :player-vars="playerVars"
            @ready="ready"
            @playing="playing"
            @ended="ended"
            @error="error"
            ref="youtube" />
        </div>
        <div class="robot">
          <div class="speech-bubble">인간이 될 준비는 끝났나요?<br>20초 후에 스트레칭이 시작합니다.</div>
          <img :src="require(`@/assets/images/robot.png`)" />
        </div>
      </div>

      <h2>다른 스트레칭 살펴보기</h2>
      <!-- 스트레칭 메뉴 -->
      <StretchList></StretchList>
      <section class="timeCategoryList">
        <stretchingMinute></stretchingMinute>
      </section>
    </div>
  </div>
</template>

<script>
import simpleheader from "../components/layout/simpleheader.vue";
import stretchingMinute from "../components/Stretching_minute.vue";
import StretchList from "../components/StretchList.vue";
import Vue from "vue";
import axios from 'axios';
import VueYoutube from "vue-youtube";
Vue.use(VueYoutube);
export default {
  name: "Timer",
  data() {
    return {
      category: ["eye", "neck", "shoulder", "wrist"],
      user: {
        id: '',
      },
      totalTime: {
        minutes: '0',
        seconds: '0',
      },
      totalTimeSec: '0',
      videoId: 'UnKPaWC5zDg',
      videoTitle: '기지개 켜기',
      playNum: 0,
      routineArray: [],
      Timer: null,
      TimeCounter: 180,
      TimerStr: "00 : 00"
    };
  },
  async created() {
    await this.getUser();
    await this.getMyRoutine();
  },
  components: {
    simpleheader,
    StretchList,
    stretchingMinute,
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
        // loop: 1,
        // iv_load_policy:3,
        start: this.start,
        end: this.end
      };
    },
    player() {
      return this.$refs.youtube.player
    },
    titleChange: function () {
      const name = { 'eye' : '눈', 'neck' : '목', 'shoulder' : '어깨', 'wrist' : '손목' };
      return name[this.$route.params.category];
    }
  },
  mounted: function() {
    //문자발송성공시 호출
    if(this.Timer != null){
    	this.timerStop(this.Timer);
        this.Timer = null;
    }
    this.Timer = this.timerStart();
  },
  methods: {
    timerStart: function() {
      // 1초에 한번씩 start 호출
      this.TimeCounter = 0;
      var interval = setInterval(() => {
        this.TimeCounter++; //1초씩 증가
        this.TimerStr = this.prettyTime();
        if (this.TimeCounter >= this.totalTimeSec) this.timerStop(interval);
      }, 1000);
      return interval;
    },
    timerStop: function(Timer) {
      clearInterval(Timer);
      this.TimeCounter = 0;
    },
    prettyTime: function() {
      // 시간 형식으로 변환 리턴
      let time = this.TimeCounter / 60;
      let minutes = parseInt(time);
      let secondes = Math.round((time - minutes) * 60);
      return (
        minutes.toString().padStart(2, "0") +
        " : " +
        secondes.toString().padStart(2, "0")
      );
    },
    ready(){
      if(this.routineArray){
        var urlSplit = this.routineArray[0].videoUrl.split("/");
        this.videoId = urlSplit[urlSplit.length - 1];
      }
    },
    playing(){},
    ended(){
      this.playVideo();
    },
    error(){},
    getUser() {
      axios.get(process.env.VUE_APP_URL + '/user/info').then((res) => {
        if (res.data.results != null) {
          this.user.id = res.data.results.id;
        } else {
          window.location.replace(process.env.VUE_APP_URL + '/oauth/kakao');
        }
      });
    },
    playVideo() {
      this.playNum++;
      if(this.routineArray.length > this.playNum) {
        var url = this.routineArray[this.playNum].videoUrl;
        if(!url) {
          url = "https://www.youtube.com/embed/UnKPaWC5zDg";
        }else{
          var urlSplit = url.split("/");
          this.videoId = urlSplit[urlSplit.length - 1];
          this.videoTitle = this.routineArray[this.playNum].title;
        }
        this.player.playVideo();
      }
    },
    getMyRoutine() {
      axios.all([
        axios({
          method: 'get',
          url: process.env.VUE_APP_URL + '/my-routine/list',
          params: { userId: this.user.id },
        }),
        axios({
          method: 'get',
          url: process.env.VUE_APP_URL + '/stretch/category/list'
        })
      ]).then(axios.spread((res1, res2) => {
        if (res1.data.result == 'OK' && res2.data.result == 'OK') {
          let routineArray = res1.data.results;
          const categoryList = res2.data.results;

          const timeResult = { minutes: routineArray.totalTimeMin, seconds: routineArray.totalTimeSec };
          this.totalTime = timeResult;
          this.totalTimeSec = routineArray.totalTimeMin * 60 + routineArray.totalTimeSec;

          routineArray.myRoutineList.forEach((content) => {
            content["category"] = categoryList[content.stretchCategoryId].title;
          });

          this.routineArray = routineArray.myRoutineList;
          // console.log(this.routineArray);
        }
      }));
    },
  }
};
</script>

<style lang="scss" scoped>
@import "../assets/scss/variables.scss";
@import "../assets/scss/common.scss";
@import "../assets/scss/components/StretchingSection.scss";
@import '../assets/scss/components/stretchingVideo.scss';
</style>
