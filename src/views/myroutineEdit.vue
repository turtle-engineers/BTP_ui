<template>
  <div>
    <modalSmall v-if="isModalViewed" @close-modal="closeModal" @saveMyroutine="saveMyroutine"></modalSmall>
    <simpleheader></simpleheader>
    <div class="app-container">
      <div class="btp-container">
        <section class="btp-title">
          <h1>마이 루틴 편집</h1>
          <p>
            어떤 실험 동작을 넣어 볼까요? 원하는 스트레칭을 리스트에 담아 보세요.
          </p>
        </section>
        <div class="myroutine-container">
          <section class="listbox">
            <h1>마이 루틴 리스트</h1>
            <div class="listbox-content">
              <h2 class="listbox-timer">
                총 
                <span>{{ totalTime.minutes }}</span>분 
                <span>{{ totalTime.seconds }}</span>초
              </h2>
              <div class="basic-scroll">
                <draggable class="draggable-list" :list="routineArray" group="my-group">
                  <div class="list-item" v-for="(element, index) in routineArray" :key="index">
                    <myroutineList
                      :routineInfo="element"
                      :routineOrder="routineArray.indexOf(element)"
                      @childData="emitRoutineData"
                    ></myroutineList>
                  </div>
                </draggable>
              </div>
              <div class="button-box">
                <button class="reset" @click="resetRoutine">Reset</button>
                <button class="save" @click="isModalViewed=true">저장하기</button>
              </div>
            </div>
          </section>
          <section class="stretch-container">
            <StretchListMR @stretchData="emitStretchData"></StretchListMR>
          </section>
        </div>
      </div>
    </div>
  </div>
</template>
<style lang="scss" scoped>
@import '../assets/scss/variables.scss';
@import '../assets/scss/common.scss';
@import '../assets/scss/components/myRoutineEdit.scss';
</style>
<script>
import simpleheader from '../components/layout/simpleheader.vue';
import myroutineList from '../components/myroutineList.vue';
import StretchListMR from '../components/StretchList_myroutine.vue';
import modalSmall from "../components/modalSmall";
import draggable from 'vuedraggable';
import axios from 'axios';
import '../plugins/vue-toast';
export default {
  data() {
    return {
      user: {
        id: '',
      },
      totalTime: {
        minutes: '0',
        seconds: '0',
      },
      response: '',
      num: 0,
      backNum: 0,
      cardNum: 0,
      
      isModalViewed: false,

      routineArray: [],
      childData: {},
    };
  },
  created() {
    this.getUser();
  },
  components: {
    simpleheader,
    myroutineList,
    draggable,
    StretchListMR,
    modalSmall,
  },
  methods: {
    saveMyroutine() {
      let stretchIdResult = [];
      let repeatCountResult = [];
      for (const el in this.routineArray) {
        stretchIdResult.push(this.routineArray[el].StretchContentId);
        repeatCountResult.push(1);
      }
      let routineRequest = {
        userId: this.user.id,
        stretchContentId: stretchIdResult,
        repeatCount: repeatCountResult,
      };
      axios
        .post('http://127.0.0.1:3000/my-routine/save', routineRequest)
        .then((response) => {
          console.log(response);
          if (response.data.result == 'OK') this.$toast.success('저장되었습니다!');
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    getUser() {
      axios.get('http://127.0.0.1:3000/user/info').then((res) => {
        if (res.data.results != null) {
          this.user.id = res.data.results.id;
          this.getMyRoutine();
        } else {
          window.location.replace('http://127.0.0.1:3000/oauth/kakao');
        }
      });
    },
    async getMyRoutine() {
      await axios({
        method: 'get',
        url: 'http://127.0.0.1:3000/my-routine/list',
        params: { userId: this.user.id },
      }).then((res) => {
        if (res.data.result == 'OK') {
          let routineArray = res.data.results;

          const timeResult = { minutes: routineArray.totalTimeMin, seconds: routineArray.totalTimeSec };
          this.totalTime = timeResult;

          this.routineArray = routineArray.myRoutineList;
        }
      });
    },
    emitRoutineData(childData) {
      this.deleteRoutine(childData.index);
    },
    deleteRoutine(index) {
      this.routineArray.splice(index, 1);
    },
    resetRoutine() {
      this.routineArray = [];
      this.totalTime.minutes = 0;
      this.totalTime.seconds = 0;
    },
    emitStretchData(data) {
      const routineData = {
        repeatCount: 1,
        StretchContentId: data.id,
        playTime: data.playTime,
        title: data.title,
      };
      this.addRoutineData(routineData);
    },
    addRoutineData(routineData) {
      const updateRoutineArray = [...this.routineArray];
      updateRoutineArray.push(routineData);
      this.routineArray = updateRoutineArray;
    },
    closeModal() {
      this.isModalViewed = false;
    },
  },
};
</script>
