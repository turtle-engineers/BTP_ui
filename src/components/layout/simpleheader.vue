<template>
  <header id="header">
    <div id="header-box">
      <button @click="toggleOnOff" id="togglebtn" :class="[toggleOn ? 'toggleClose' : 'toggleOpen']">
        <img src="@/assets/icon/menu.svg" />
      </button>
      <div class="toggle-menu" v-if="toggleOn">
        <ToggleMenu></ToggleMenu>
      </div>
      <nav>
        <ul>
          <router-link to="/stretchingGuide" class="nav-item">
            <li class="nav-text" id="stretchingGuide">스트레칭 가이드</li>
          </router-link>
          <router-link to="/myroutine" class="nav-item">
            <li class="nav-text" id="myroutine">마이 루틴</li>
          </router-link>
          <router-link to="/story" class="nav-item">
            <li class="nav-text" id="story">프로젝트 소개</li>
          </router-link>
        </ul>
      </nav>
      <a href="/"><img class="logo" src="../../assets/images/logo/logo.svg" alt="BTP 메인 이동 로고"/></a>
      <div class="my-menu">
        <img src="../../assets/icon/mypage.svg" @click="loginLink('/account')" />
        <img src="../../assets/icon/notification.svg" @click="loginLink('/alarm')" />
      </div>
    </div>
  </header>
</template>
<style lang="scss">
@import '../../assets/scss/variables.scss';
@import '../../assets/scss/common.scss';
@import 'simpleheader.scss';
</style>
<script>
import axios from 'axios';
import ToggleMenu from '@/components/ToggleMenu.vue';
export default {
  data() {
    return {
      toggleOn: false, //이따 false
      pathname: '',
      idlist: [],
    };
  },
  components: {
    ToggleMenu,
  },
  created: function() {
    this.getPathname();
  },
  mounted: function() {
    this.makeBold();
  },
  methods: {
    getPathname() {
      this.pathname = window.location.pathname.split('/')[1];
    },
    makeBold() {
      // pathname이 li id랑 똑같을때 bold
      document.querySelectorAll('li').forEach((el) => this.idlist.push(el.id));
      // pathname이 메뉴 bold할 수 있는 idlist에 포함될 때 bold
      if (this.idlist.includes(this.pathname)) {
        const boldli = document.getElementById(this.pathname);
        boldli.id = 'now-page';
      }
    },
    loginLink(link) {
      axios.get(process.env.VUE_APP_URL + '/user/info').then((res) => {
        if (res.status == 200) {
          if (res.data.result != 'FAIL') {
            window.location.replace(link);
          } else {
            window.location.replace(process.env.VUE_APP_URL + '/oauth/kakao');
          }
        }
      });
    },
    toggleOnOff() {
      this.toggleOn = !this.toggleOn;
    },
  },
};
</script>
