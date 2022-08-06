<template>
  <div class="login">
    <img src="@/assets/images/turtle.png" @click="store.loginAtBackServer" />
  </div>
</template>

<script>
import { userStore } from '../stores/user';
export default {
  setup() {
    const store = userStore();
    return { store };
  },
};
</script>
