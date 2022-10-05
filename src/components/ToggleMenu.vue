<template>
  <div id="sidemenu">
    <div id="top">
      <img id="logo" src="../assets/images/logo/logo.png" />
      <!-- <button @click="toggleOnOff"><img id ="toggleBtn" src="../assets/icon/menu.png"></button> -->
    </div>
    <div id="line"></div>
    <ul id="nav-left">
      <router-link to="/stretchingGuide" class="menu-item">
        <li class="toggle-menu-text">스트레칭 가이드</li>
      </router-link>
      <router-link to="/myroutine" class="menu-item">
        <li class="toggle-menu-text">마이 루틴</li>
      </router-link>
      <router-link to="/story" class="menu-item">
        <li class="toggle-menu-text">프로젝트 소개</li>
      </router-link>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    toggleOnOff() {
      this.toggleOn = !this.toggleOn;
    },
  },
};
</script>

<style>
a {
  text-decoration: none;
}

#sidemenu {
  position: fixed;
  top: 0px;
  left: 0px;
  width: 410px;
  height: 30px;
  height: 100%;
  background-color: white;
  z-index: 99;
}

#top {
  display: flex;
  justify-content: space-between;
  margin: 67px 33px 20px 33px;
}

#logo {
  width: 140px;
}

#toggleBtn {
  height: 41px;
}

#line {
  background-color: #d5d5d5;
  height: 1px;
  width: 90%;
  margin: 0 auto;
}

#nav-left {
  margin-top: 43px;
  margin-left: 43px;
}

#nav-left li:before {
  content: '';
  width: 20px;
  height: 20px;
  left: 30px;
  margin-top: 3px;
  position: absolute;
  /* 흰 아이콘으로 수정*/
  background-image: url('../assets/icon/circle-green.png'); 
  background-size: cover;
  background-position: center;
}

.toggle-menu-text {
  text-align: left;
  font-size: 24px;
  line-height: 24px;
  margin-bottom: 43px;
  color: #343a40;
}
</style>
