<template>
  <div class="routineComponent">
    <div class="routine-content-wrap">
      <p>{{ +routineOrder + 1 }}</p>
      <div>
        <!-- {{routineInfo}} -->
        <h1>{{ routineInfo.title }}</h1>
        <span>00 : 00 : {{ routineInfo.playTime }}</span>
      </div>
    </div>
    <button class="delete-btn" @click="emitRoutineData">
      <img src="../assets/icon/myroutine-edit-delete-btn.png" alt="마이루틴 삭제 버튼" />
    </button>
  </div>
</template>

<script>
export default {
  props: {
    routineInfo: {
      type: Object,
      default: () => {
        return {
          StretchContentId: 0,
          repeatCount: 0,
        };
      },
    },
    routineOrder: {
      type: Number,
    },
  },
  methods: {
    emitRoutineData() {
      const routineData = Object.assign({ index: this.routineOrder }, this.routineInfo);
      // console.log("", this.routineData);
      this.$emit('childData', routineData);
    },
  },
};
</script>

<style>
.routineComponent {
  position: relative;
  padding: 5px 0px 5px 0px;
  margin-right: 7px;
}

.delete-btn {
  position: absolute;
  right: 11.75px;
  top: 16px;
}
.routine-content-wrap {
  width: 100%;
  min-height: 68px;
  border-radius: 10px;
  background-color: white;
  padding: 11px 13px;
}
.routine-content-wrap div {
  position: relative;
  left: 43px;
  display: flex;
  flex-direction: column;
  justify-self: left;
  max-width: 155px;
  text-align: left;
}

.routine-content-wrap p {
  position: absolute;
  font-size: 12px;
  font-weight: 700;
  line-height: 20px;
  letter-spacing: 0em;
  text-align: center;
  width: 20px;
  height: 20px;
  border-radius: 3px;
  color: white;
  background-color: #949494;
}

.routine-content-wrap h1 {
  font-size: 18px;
  font-weight: 700;
  line-height: 20px;
  margin: 0;
  padding: 0;
  margin-bottom: 6px;
}

.routine-content-wrap span {
  color: #bfbfbf;
  font-size: 14px;
  font-weight: 400;
  line-height: 18px;
  text-align: left;
}
</style>
