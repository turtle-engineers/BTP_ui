<template>
  <div>
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
                총 <span>{{ results.totalTimeMin }}</span
                >분 <span>{{ results.totalTimeSec }}</span
                >초
              </h2>
              <button class="listbox-button" @click="saveMyroutine">
                저장하기
              </button>
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
import draggable from 'vuedraggable';
import axios from 'axios';
export default {
  data() {
    return {
      user: {
        id: '',
      },
      results: {
        totalTimeMin: '00',
        totalTimeSec: '00',
      },
      response: '',
      num: 0,
      backNum: 0,
      cardNum: 0,

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
        .then(function(response) {
          console.log(response.statusText);
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
          routineArray.forEach((element) => {
            console.log('element : ', element);
            const StretchContentId = element.StretchContentId;
            axios
              .all([
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/contents/title',
                  params: { id: StretchContentId },
                }),
                axios({
                  method: 'get',
                  url: 'http://127.0.0.1:3000/stretch/contents/playtime',
                  params: { id: StretchContentId },
                }),
              ])
              .then(
                axios.spread((res1, res2) => {
                  // console.log('1:', res1.data.results);
                  element = Object.assign({}, element, res1.data.results);
                  // console.log('2:', res2.data.results);
                  element = Object.assign({}, element, res2.data.results);
                  console.log('el:', element);
                  this.routineArray.push(element);
                })
              );
          });
        }
      });
    },
    emitRoutineData(childData) {
      this.deleteRoutine(childData.index);
    },
    deleteRoutine(index) {
      this.routineArray.splice(index, 1);
    },
    emitStretchData(data) {
      const routineData = {
        repeatCount: 1,
        StretchContentId: data.id,
      };
      this.addRoutineData(routineData);
    },
    addRoutineData(routineData) {
      const updateRoutineArray = [...this.routineArray];
      updateRoutineArray.push(routineData);
      this.routineArray = updateRoutineArray;
      console.log(this.routineArray);
    },
  },
};
</script>
