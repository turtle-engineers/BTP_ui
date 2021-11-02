<template>
  <body>
    <!-- 검은색 바 -->
    <div class="bar">
        <div class="music-player">▶ This is playing music</div>
        <div class="clock"> 10 : 50 AM </div>
    </div>
    <!-- 헤더(흰색) -->
  <header class="header">
    <div class="header-logo"><a href="#"><img src="..\assets\images\logo\logo.png"></a></div>
    <nav>
      <ul>
        <a href="#" class="menu-item">
          <li class="menu-text">스트레칭 가이드</li>
          <img src="..\assets\icon\menu.png">
        </a> 
        <a href="#" class="menu-item">
          <li class="menu-text">마이 루틴</li>
          <img src="..\assets\icon\menu.png">
        </a> 
        <a href="#" class="menu-item">
          <li class="menu-text"> 랜덤 챌린지</li>
          <img src="..\assets\icon\menu.png">
        </a> 
        <a href="#" class="menu-item">
          <li class="menu-text">이용안내</li>
          <img src="..\assets\icon\menu.png">
        </a> 
      </ul>

      <div class ="my-menu">
        <a href="#" class="menu-text"><img src="../assets/icon/mypage.png"></a>
        <a href="#" class="menu-text"><img src="../assets/icon/notification.png"></a>
      </div>
    </nav>
  </header>
  
   <!-- banner -->
  <div class="banner">
  </div>
  <!-- main -->
  <div class="main">
  </div>
  <!-- 모래부분 -->
  <footer class="foot">
  </footer>

  </body>
</template>
<style lang="scss" scoped>
    @import '../assets/scss/components/main.scss';
    @import '../assets/scss/components/header.scss';
    @import '../assets/scss/variables.scss';
    @import '../assets/scss/common.scss';
</style>
<script>
export default {
    data() {
    },
};
</script>