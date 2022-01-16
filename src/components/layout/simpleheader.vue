<template>
  <header id="header">
    <div id="header-box">
      <nav>
        <ul>
         <router-link to="/stretchingGuide" class="nav-item">
            <li class="nav-text">스트레칭 가이드</li>
         </router-link>
          <router-link to="/myroutine" class="nav-item">
            <li class="nav-text">마이 루틴</li>
          </router-link>
          <router-link to="/story" class="nav-item">
            <li class="nav-text">프로젝트 소개</li>
          </router-link>
        </ul>
      </nav>
      <a href="/"><img class="logo" src="..\..\assets\images\logo\logo.svg"/></a>
      <div class="my-menu">
        <a href="#"><img src="../../assets/icon/mypage.svg"/></a>
        <a href="#"><img src="../../assets/icon/notification.svg"/></a>
      </div>
    </div>
  </header>
  <!-- 현재 페이지에  id="now-page" -->
</template>

<script>
export default {};
</script>

<style lang="scss">
@import '../../assets/scss/variables.scss';
@import '../../assets/scss/common.scss';
@import 'simpleheader.scss';
</style>
