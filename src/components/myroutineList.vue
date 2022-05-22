<template>
  <div class="routineComponent">
    <div class="routine-content-wrap">
      <p>1</p>
      <div>
        <h1>스트레칭 이름1</h1>
        <span>00 : 00 : 00</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.routineComponent {
  padding: 5px 0px 5px 0px;
  margin-right: 7px;
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
  color: #BFBFBF;
  font-size: 14px;
  font-weight: 400;
  line-height: 18px;
  text-align: left;
}
</style>
