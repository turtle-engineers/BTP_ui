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
            <!-- <img src="..\assets\icon\header_menu_arrow.png"> -->
          </a> 
          <a href="#" class="menu-item">
            <li class="menu-text">마이 루틴</li>
            <!-- <img src="..\assets\icon\header_menu_arrow.png"> -->
          </a> 
          <a href="#" class="menu-item">
            <li class="menu-text"> 랜덤 챌린지</li>
            <!-- <img src="..\assets\icon\header_menu_arrow.png"> -->
          </a> 
          <a href="#" class="menu-item">
            <li class="menu-text">이용안내</li>
            <!-- <img src="..\assets\icon\header_menu_arrow.png"> -->
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
      <img class="banner-img" src="../assets/images/banner.png">
    </div>

    <!-- main -->
    <div class="main">
      <!-- 브랜드 소개 -->
      <div class="brand">
        <h1>BTP PROJECT</h1>        
        <img src="../assets/images/brand.png">
        <p>
          현대사회 사람은 지속해서 스트레칭 하지 않으면 거북이가 되어버립니다.<br>
          거북이가 되면 육지를 떠나야한다는 사실을 알고 계십니까?<br>
          BTP 프로젝트는 인류의 거북이화를 예방하기 위한 프로젝트로서<br>
          당신은 이 프로젝트에 자유롭게 참여할 수 있습니다.<br>
        </p>
        <a href="#"><div class="morebtn">MORE</div></a>
      </div>

    <!-- 메인 프로젝트 -->
    <div class="btp-menu">
    <div class="title">
        <img src="../assets/icon/circle-green.png">
        <h1>MAIN PROJECT</h1>
        <p>본 프로젝트로 계획된 플랜을 살펴볼 수 있습니다.</p>
    </div>
      <!-- 상세 메뉴 -->
    <div class="project-menu">
      <div class="project-item">
        <img class="project-icon" src="../assets/images/stretching.png">
        <h1>스트레칭 가이드</h1>
        <h2>Stretching Guide</h2>
        <img class="showbtn" src="../assets/icon/circle-down-btn.png">
        <a href="#"><div class="start">START</div></a>
      </div>
      <div class="project-item">
        <img class="project-icon" src="../assets/images/myroutine.png">
        <div class="project-desc">
          <h1>마이 루틴</h1>
          <h2>My Stretching Routine</h2>
        </div>
        <img class="showbtn" src="../assets/icon/circle-down-btn.png">
        <a href="#"><div class="start">START</div></a>
      </div>
      <div class="project-item">
        <img class="project-icon" src="../assets/images/random_challenge.png">
        <div class="project-desc">
          <h1>랜덤 챌린지</h1>
          <h2>Random Challenge</h2>
        </div>
        <img class="showbtn" src="../assets/icon/circle-down-btn.png">
        <a href="#"><div class="start">START</div></a>
      </div>
    </div>
  </div>
  </div>

  <!-- 모래부분 -->
  <footer class="foot">
  </footer>
  </body>
</template>
<style lang="scss" scoped>
    @import '../assets/scss/components/home.scss';
    @import '../assets/scss/components/header.scss';
    @import '../assets/scss/components/brand.scss';
    @import '../assets/scss/variables.scss';
    @import '../assets/scss/common.scss';
</style>
<script>
export default {
    data() {
    },
};
</script>