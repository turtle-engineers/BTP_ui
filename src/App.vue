<template>
  <div id="app">
    <Header />
    <musicbar></musicbar>
    <div id="content" class="content">
      <router-view></router-view>
    </div>
    <Footer />
  </div>
</template>

<script>
import Footer from '@/components/common/Footer'; //import 푸터 추가
import musicbar from '@/components/layout/musicbar.vue';

export default {
  name: 'App',
  components: {
    musicbar,
    Footer // 푸터 컴포넌트 추가
  },
};
</script>
