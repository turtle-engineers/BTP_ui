import { defineStore } from 'pinia';
import axios from 'axios';

export const userStore = defineStore('userStore', {
  state: () => {
    return {
      isLogin: false,
      results: {
        id: '',
        provider: '',
        providerId: '',
        picture: '',
        nickname: '',
        title: '',
        level: '',
        point: '',
        createdAt: '',
        updatedAt: '',
        alarmValid: '',
        monthTimes: '',
        dd: '',
        todayTimes: '',
      },
    };
  },
  persist: true,
  getters: {},
  actions: {
    getUserInfo() {
      axios.get('http://127.0.0.1:3000/user/info').then((res) => {
        if (res.data.result != null) {
          console.log(res.data);
          this.results = res.data.results;
          this.isLogin = true;
          //   this.$router.push("/");
        }
        //   console.log(res);
      });
    },
    moveTologinPage() {
      window.location.replace('/login');
    },
    loginAtBackServer() {
      window.location.replace('http://127.0.0.1:3000/oauth/kakao');
    },
  },
});
