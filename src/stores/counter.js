import { defineStore } from 'pinia';

export const useStore = defineStore('storeId', {
  // arrow function recommended for full type inference
  state: () => {
    return {
      // all these properties will have their type inferred automatically
      counter: 10,
      name: 'Eduardo',
      isAdmin: true,
    };
  },
  getters: {
    doubleCount() {
      return this.counter * 2;
    },
    // the return type **must** be explicitly set
    doublePlusOne() {
      // autocompletion and typings for the whole store ✨
      return this.doubleCount + 1;
    },
  },
  actions: {
    randomizeCounter() {
      this.counter = Math.round(100 * Math.random());
    },
    increaseCounter() {
      this.counter++;
    },
    decreaseCounter() {
      this.counter--;
    },
  },
});
