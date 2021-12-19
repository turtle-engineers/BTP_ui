<template>
  <div id="app">
    <Header />
    <div id="content" class="content">
      <router-view></router-view>
    </div>
    <Footer />
  </div>
</template>

<script>
import Footer from '@/components/common/Footer'; //import 푸터 추가

export default {
  name: 'App',

  components: {
    Footer // 푸터 컴포넌트 추가
  },

  data: () => ({
    //
  }),
};
</script>
