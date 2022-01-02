<template>
  <div id = "sidemenu">
    <div id = "top">
      <img id="logo" src="../assets/images/logo/logo.png">
      <!-- <button @click="toggleOnOff"><img id ="toggleBtn" src="../assets/icon/menu.png"></button> -->
    </div>
    <div id = "line"></div>
      <ul id="nav-left">
      <a href="#" class="menu-item">
          <li class="menu-text">스트레칭 가이드</li>
      </a>
      <a href="#" class="menu-item">
          <li class="menu-text">마이 루틴</li>
      </a>
      <a href="#" class="menu-item">
          <li class="menu-text">프로젝트 소개</li>
      </a>
    </ul>
  </div>
</template>

<script>
export default {
  data(){
    return{
      
    }
  },
  methods: {
    toggleOnOff(){
        this.toggleOn = !this.toggleOn ;
      },
  }
}
</script>

<style>
a { text-decoration: none; }

#sidemenu {
    position: fixed;
    top:0px; 
    left:0px;  
    width:410px;
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
  background-color: #D5D5D5;
  height: 1px;
  width: 90%;
  margin: 0 auto;
}

#nav-left {
  margin-top: 43px;
  margin-left: 43px;
}

.menu-text {
  font-size: 24px;
  line-height: 24px;
  margin-bottom: 43px;
  color: #343A40;
}

</style>