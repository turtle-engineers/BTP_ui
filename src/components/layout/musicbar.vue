<template>
<!-- 검은색 바 -->
        <div class="bar">
            <div class="music-player">▶ This is playing music</div>
            <div class="clock"> 10 : 50 AM </div>
        </div>
</template>

<script>
export default {

}
</script>
<style>

.bar {
  display: flex;
  padding: 0 15%;
  height: 48px;
  background-color: #343A40;;
  line-height: 48px;
  vertical-align: middle;
  color: #EBEBEB;
}

.music-player{
  flex: none;
}
.clock{
  margin-left: auto;
}

</style>