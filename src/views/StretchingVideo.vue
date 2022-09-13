<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section class="btp-title">
        <h3>{{ titleChange }} 스트레칭</h3>
        <h1>{{ $route.params.title }}</h1>
      </section>
      <div class="video-view">
        <div class="video-wrap">
          <iframe 
            :src='`${videoUrl}`' 
            title="Stretching video player" 
            frameborder="0" 
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen>
          </iframe>
        </div>
        <!-- <video controls playsinline autoplay muted loop poster='`@/assets/images/stretch/${imgUrl}`'>
          <source :src='require(`@/assets/videos/stretching/${videoUrl}`)' type='video/mp4'>
        </video> -->
        <div>
          <div class="speech-bubble">인간이 될 준비는 끝났나요?<br>20초 후에 스트레칭이 시작합니다.</div>
          <img :src="require(`@/assets/images/robot.png`)" />
        </div>
      </div>
      
      <h2>다른 스트레칭 살펴보기</h2>
      <!-- 스트레칭 메뉴 -->
      <StretchList></StretchList>
    </div>
  </div>
</template>
<script>
import simpleheader from '../components/layout/simpleheader.vue';
import StretchList from "../components/StretchList.vue";
export default {
  name: "Params",
  props: {
    title: {
      type: String,
      default: ""
    },
    category: {
      type: String,
      default: ""
    },
    imgName: {
      type: String,
      default: ""
    },
    videoName: {
      type: String,
      default: ""
    },
  },
  components: {
    simpleheader,
    StretchList,
  },
  computed: {
    titleChange: function () {
      const name = { 'eye' : '눈', 'neck' : '목', 'shoulder' : '어깨', 'wrist' : '손목' };
      return name[this.$route.params.category];
    },
    imgUrl: function () {
      return this.$route.params.imgName ? this.$route.params.imgName : 'sample/' + this.$route.params.category + '.png';
    },
    videoUrl: function () {
      return this.$route.params.videoName ? this.$route.params.videoName + '?autoplay=1&loop=1&controls=0&mute=1&iv_load_policy=3' : 'https://www.youtube.com/embed/UnKPaWC5zDg?autoplay=1&loop=1&playlist=UnKPaWC5zDg&controls=0&mute=1&iv_load_policy=3';
    }
  },
};
</script>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/stretchingVideo.scss';
</style>