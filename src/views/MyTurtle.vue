<template>
  <div>
    <h1>거북이 키우기</h1>
    <p>name: {{ store.name }}</p>
    <div>
      <button @click="store.decreaseCounter">-</button>
      <p>counter : {{ store.counter }}</p>
      <button @click="store.increaseCounter">+</button>
    </div>
    <h1>doubleCount: {{ store.doubleCount }}</h1>
    <p>isAdmin: <input type="checkbox" v-model="store.isAdmin" /></p>
  </div>
</template>
<script>
import { useStore } from '../stores/counter';
export default {
  setup() {
    const store = useStore();
    store.randomizeCounter();
    return { store };
  },
};
</script>
<style scoped>
div {
  background-color: white;
  padding: 30px;
  font-size: 18px;
}
.flex {
  display: flex;
  flex-direction: column;
}
button {
  padding: 6px;
  background-color: gray;
}
</style>
