<template>
  <div class="login">
    <img src="@/assets/images/turtle.png" @click="loginAtBackServer()" />
  </div>
</template>

<script>
export default {
  methods: {
    loginAtBackServer() {
      window.location.replace("http://127.0.0.1:3000/oauth/kakao");
    },
  },
};
</script>
