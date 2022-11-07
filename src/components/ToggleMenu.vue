<template>
  <div id="sidemenu">
    <div id="top">
      <img id="logo" src="../assets/images/logo/logo.png" />
      <!-- <button @click="toggleOnOff"><img id ="toggleBtn" src="../assets/icon/menu.png"></button> -->
    </div>
    <div id="line"></div>
    <ul id="nav-left">
      <router-link to="/stretchingGuide" class="menu-item">
        <li class="toggle-menu-text"><span>스트레칭 가이드</span></li>
      </router-link>
      <router-link to="/myroutine" class="menu-item">
        <li class="toggle-menu-text"><span>마이 루틴</span></li>
      </router-link>
      <router-link to="/story" class="menu-item">
        <li class="toggle-menu-text"><span>프로젝트 소개</span></li>
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
  z-index: 300;
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
  list-style-image: url('../assets/icon/gray-circle-menu.png');
  margin-top: 43px;
  margin-left: 43px;
}
#nav-left span {
  position: relative;
  left: 20px;
}

.toggle-menu-text {
  text-align: left;
  font-size: 24px;
  line-height: 24px;
  margin-bottom: 43px;
  color: #343a40;
}
</style>
