<template>
  <body>  
    <div id="desc">
      <h1>BTP PROJECT</h1>
      <p>BTP 프로젝트는 인류 종족을 위한 프로젝트로 이 프로젝트에 참여함으로서<br>
      인류에 이바지를 할 수 있습니다. 물론, 스스로의 몸에 가장 크게 이바지 합니다.<br>
      프로젝트가 시작된 이유는 아래와 같습니다.
      </p>
    </div>

    <section id="story-container">
        <button class="slide-btn" id="prev" @click="prev"><img src='../assets/icon/left_square.png'></button>
        <div id="slider">
            <div class="slide-card card1"><img class="card" :src="require(`../assets/images/story/BS1.png`)"></div>
            <div class="slide-card card2"><img class="card" :src="require(`../assets/images/story/BS2.png`)"></div>
            <div class="slide-card card3"><img class="card" :src="require(`../assets/images/story/BS3.png`)"></div>
            <div class="slide-card card4"><img class="card" :src="require(`../assets/images/story/BS4.png`)"></div>
            <div class="slide-card card5"><img class="card" :src="require(`../assets/images/story/BS5.png`)"></div>
            <div class="slide-card card6"><img class="card" :src="require(`../assets/images/story/BS6.png`)"></div>
            <div class="slide-card card7"><img class="card" :src="require(`../assets/images/story/BS7.png`)"></div>
            <div class="slide-card card8" id="finalimg">
                <img class="card" :src="require(`../assets/images/story/BS8.png`)">
                <img class="story-btn" id="blink" src="../assets/images/story/yellow.png">
            </div>
        </div>
        <button class="slide-btn" id="next" @click="next"><img src='../assets/icon/right_square.png'></button>
    </section>
    </body>
</template>
<style lang="scss" scoped>
    @import '../assets/scss/variables.scss';
    @import '../assets/scss/common.scss';
    @import '../assets/scss/components/story.scss';
</style>
<script>
export default {
        data() {
            return{
                index : 1,
                isMoved : true,
                speed : 1000,
            };
        },

        methods: {
            






            prev(){
                if (this.index == 1) {
                  this.index = 8;
                }else {
                  this.index = this.index - 1;
                }
                alert(this.index);
            },
            next(){
                if (this.index == 8) {
                  this.index = 1;
                }else {
                  this.index = this.index + 1;
                }
                alert(this.index);
            },
            //특정 div만 보이게 하기
            //index가 1일때, card1만 보이게.
        },
    };

</script>