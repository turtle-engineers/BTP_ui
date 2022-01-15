<template>
  <div class="login">
    <img src="@/assets/images/turtle.png" @click="loginWithKakao()" />
  </div>
</template>

<script>
export default {
  methods: {
    loginWithKakao() {
      const params = {
        clientId: process.env.VUE_APP_CLIENT_KEY,
        redirectUri: "http://127.0.0.1:8080/LoginRedirect",
      };
      window.location.replace(
        "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=" +
          params.clientId +
          "&redirect_uri=" +
          params.redirectUri
      );
    },
  },
};
</script>
