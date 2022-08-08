<template>
  <div class="app-container">
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section class="btp-title">
        <h3>{{ $route.params.category }} 스트레칭</h3>
        <h1>{{ $route.params.title }}</h1>
      </section>
      <video controls playsinline autoplay muted loop poster='`@/assets/images/stretch/${imgUrl}`'>
        <source :src='require(`@/assets/videos/stretching/${videoUrl}`)' type='video/mp4'>
      </video>
      
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
    imgUrl: function () {
      return this.$route.params.imgName ? this.$route.params.imgName : 'sample/' + this.$route.params.category + '.png';
    },
    videoUrl: function () {
      return this.$route.params.videoName ? this.$route.params.videoName : 'sample/' + this.$route.params.category + '.mp4';
    }
  },
};
</script>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/stretchingVideo.scss';
</style>