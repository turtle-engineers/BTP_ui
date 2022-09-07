<template>
  <div class="app-container app-container-center">
    <img class="login-img" src="@/assets/images/login.png" />
    <h1 class="login-title">
      Back to the people 프로젝트에 <br />
      참여하시게 된걸 환영합니다.
    </h1>
    <button class="login-btn" @click="loginAtBackServer()">카카오로 1초만에 시작하기</button>
    <p class="login-desc">해당 기능은 비로그인시 이용할 수 없습니다.</p>
  </div>
</template>

<script>
export default {
  methods: {
    loginAtBackServer() {
      window.location.replace('http://127.0.0.1:3000/oauth/kakao');
    },
  },
};
</script>
<style>
.app-container-center {
  text-align: center;
  padding-bottom: 230px;
}
.login-img {
  margin-top: 127px;
}
.login-title {
  margin: 50px 0;
  font-weight: 700;
  font-size: 30px;
  line-height: 46px;
}
.login-btn {
  margin-bottom: 30px;
  font-size: 24px;
  line-height: 46px;
  background-color: #f8d55b;
  padding: 16px 121px;
  border-radius: 300px;
}
.login-desc {
  padding-bottom: 50px;
  font-size: 20px;
  line-height: 25px;
  color: #9d9d9d;
}
</style>
