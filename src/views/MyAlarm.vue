<template>
  <body>
    <simpleheader></simpleheader>
    <div class="btp-container">
      <section class="btp-title">
        <h1>알람 설정</h1>
        <p>
          하루동안 받을 스트레칭 알람을 설정해보세요. <br />
          알람이 울리면 스트레칭을 하고 거북목과 어깨를 쭉쭉 펴주세요.
        </p>
      </section>
      <!-- 알람 (초록) -->
      <div class="alarm-wrap">
        <section class="alarm-stretching alarm-container">
          <dl>
            <dt>스트레칭 알림</dt>
            <dd>설정한 시간 동안 매 정각마다 알림이 울립니다.</dd>
          </dl>
          <!-- on off버튼 -->
          <div v-on:change="stretchingOnOff" class="onoff-button">
            <input type="checkbox" id="stretching-switch" />
            <label for="stretching-switch"></label>
          </div>
          <div class="weekcheck">
            <h2>요일 선택</h2>
            <article @change="weekcheck" v-on:change="updateIsChecked">
              <!-- v-on:change="updateIsChecked" -->
              <input type="checkbox" value="0" id="mon" name="dayAlarmOnOff" />
              <label class="weekday" for="mon">월</label>
              <input type="checkbox" value="1" id="tue" name="dayAlarmOnOff" />
              <label class="weekday" for="tue">화</label>
              <input type="checkbox" value="2" id="wed" name="dayAlarmOnOff" />
              <label class="weekday" for="wed">수</label>
              <input type="checkbox" value="3" id="thu" name="dayAlarmOnOff" />
              <label class="weekday" for="thu">목</label>
              <input type="checkbox" value="4" id="fri" name="dayAlarmOnOff" />
              <label class="weekday" for="fri">금</label>
              <input type="checkbox" value="5" id="sat" name="dayAlarmOnOff" />
              <label class="weekday" for="sat">토</label>
              <input type="checkbox" value="6" id="sun" name="dayAlarmOnOff" />
              <label class="weekday" for="sun">일</label>
            </article>
          </div>

          <form>
            <fieldset>
              <legend>시작 시각</legend>
              <select name="start-clock" v-on:change="setStartTime">
                <option selected disabled hidden>00:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
                <option value="24">24:00</option>
              </select>
            </fieldset>
            <fieldset>
              <legend>종료 시각</legend>
              <select name="end-clock" v-on:change="setEndTime">
                <option selected disabled hidden>00:00</option>
                <option value="6">06:00</option>
                <option value="7">07:00</option>
                <option value="8">08:00</option>
                <option value="9">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
                <option value="24">24:00</option>
              </select>
            </fieldset>
          </form>
        </section>
        <!-- 알람(파랑) -->
        <section class="alarm-challenge alarm-container">
          <dl>
            <dt>랜덤 챌린지 알림</dt>
            <dd>
              스트레칭 알림을 받기로 설정한 시간동안 <br />
              매 정각마다 알림이 울립니다.
            </dd>
          </dl>
          <div v-on:change="onoff" class="onoff-button">
            <input type="checkbox" id="challenge-switch" />
            <label for="challenge-switch"></label>
          </div>
          <dl class="sub-title">
            <dt>랜덤 챌린지란?</dt>
            <dd>
              아래의 예시처럼 잠깐 동안의 휴식을<br />
              상기 시켜주는 알림입니다.
            </dd>
          </dl>
          <div class="random-challenge">
            <span>
              💦(예시) 1시간이 지났어요. 💦<br />
              물을 한잔 마셔 볼까요?
            </span>
          </div>
        </section>
        <section class="alarm-scientist alarm-container alarm_right">
          <img src="../assets/images/alarm-circle.png" alt="알람 원" />
          <img src="../assets/images/alarm-scientist.png" alt="알람 과학자" />
          <img src="../assets/images/alarm-balloon.png" alt="알람 말풍선" />
        </section>
      </div>
    </div>
  </body>
</template>
<style lang="scss" scoped>
@import "@/assets/scss/variables.scss";
@import "@/assets/scss/common.scss";
@import "@/assets/scss/components/myAlarm.scss";
</style>
<script>
import simpleheader from "../components/layout/simpleheader.vue";
import axios from "axios";
export default {
  data() {
    return {
      // isChecked: false,
      isChecked: [1, 0, 0, 0, 0, 0, 0],
    };
  },
  components: {
    simpleheader,
  },
  created() {
    this.getAlarm();
  },
  methods: {
    stretchingOnOff() {
      //valid에 checked(true, false)값 넣기
      axios.put("http://127.0.0.1:3000/user/alarm", {
        valid: document.getElementById("stretching-switch").checked ? "1" : "0",
      });
    },
    weekcheck() {
      //바뀔때마다 빈 배열에  각 result[value]를 01로 (checked로) 넣음
      let result = document.querySelectorAll("input[name=dayAlarmOnOff]");
      // console.log(result);
      result.forEach((element) => {
        this.isChecked[element.value] = element.checked ? 1 : 0;
      });
      //db에 보내기
      axios.put("http://127.0.0.1:3000/user/alarm", {
        day: this.isChecked.join(""), //날짜
      });
    },
    getAlarm() {
      axios.get("http://127.0.0.1:3000/user/alarm").then((res) => {
        if (res.data != null) {
          const weekData = res.data.results;
          //day가 111000 string으로 오므로 배열로 바꾸기
          // console.log(weekData)
          this.isChecked = weekData.day
            .split("")
            .map((element) => parseInt(element));
          //알람 onoff 여부 업데이트
          document.getElementById("stretching-switch").checked = weekData.valid;
        }
        this.updateIsChecked();
      });
    },
    updateIsChecked() {
      //칼라 업데이트
      let result = document.querySelectorAll("input[name=dayAlarmOnOff]");
      // console.log(result);
      result.forEach((element) => {
        this.isChecked[element.value] ? (element.checked = true) : (element.checked = false);
      });
    },
    setStartTime() {
      //선택된 옵션
      let clockOption = document.querySelector("select[name=start-clock] > option:checked").value;
      //시작 시간
      axios
        .put("http://127.0.0.1:3000/user/alarm", { startTime: clockOption })
        .then(function(response) {
          if(response.data.resultcode === '-200'){
            alert(response.data.message);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    setEndTime() {
      //선택된 옵션
      let clockOption = document.querySelector("select[name=end-clock] > option:checked").value;
      //종료 시간
      axios
        .put("http://127.0.0.1:3000/user/alarm", { endTime: clockOption })
        .then(function(response) {
          if(response.data.resultcode === '-200'){
            alert(response.data.message);
          }
        })
        .catch(function(error) {
          console.log(error);
        });
    },
  },
};
</script>
