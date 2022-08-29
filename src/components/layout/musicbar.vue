<template>
  <!-- 검은색 바 -->
  <div class="bar">
    <div class="music-player">▶ This is playing music</div>
    <div class="clock"> 10 : 50 AM </div>
  </div>
</template>

<style>
.bar {
  display: flex;
  padding: 0 15%;
  height: 4vh;
  line-height: 4vh;
  vertical-align: middle;
  color: #EBEBEB;
  background-color: #343A40;
}

.music-player{
  flex: none;
}
.clock{
  margin-left: auto;
}
</style>