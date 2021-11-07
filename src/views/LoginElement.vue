<template>
    <b-container>
        <b-row class="card-main mt-3 mb-3" align-h="between">
            <b-col class="card-view card-w" cols="5">
                <div class="card-layout">
                    <cm-t>나의 거북이</cm-t>
                    <img :src="require('@/assets/images/turtle.png')" />
                    <cm-b>
                        <f1>LV.</f1><f2>00</f2>
                    </cm-b>
                </div>
            </b-col>
            <b-col class="card-view card-g" cols="6">
                <div class="card-layout">
                    <cm-t>오늘의 목표</cm-t>
                    <cm-m>
                        <input type="checkbox" id="g1" name="today-goal" />
                        <label for="g1"><span></span>스트레칭 합산 5분 이상</label>
                        <input type="checkbox" id="g2" name="today-goal" />
                        <label for="g2"><span></span>랜덤 챌린지 3회 이상</label>
                    </cm-m>
                    <cm-b>
                        <f1>실험 참여 횟수</f1><f2>0000</f2>
                    </cm-b>
                </div>
            </b-col>
        </b-row>

        <div class="calendar-title title-g">
            <img><h1>RESEARCH RECORD</h1>
            <p>지금까지 진행한 현황을 볼 수 있습니다.</p>
        </div>
        <b-row class="calendar-pad justify-content-md-center">
            <img class="calendar-pad-img" :src="require('@/assets/images/ipad.png')" />
            <div class="calendar-card">
                <img class="calendar-logo" :src="require('@/assets/images/logo/process_logo.png')" />
                <hr>
                <div class="calendar-title title-w">
                    <img><h1>STRETCHING CALENDAR</h1>
                </div>
                <div class="calender-card">
                    <b-row>
                        <b-col class="calender-date">2021.10.10</b-col>
                        <b-col></b-col>
                    </b-row>
                    <b-row class="calender-goal" align-h="end">
                        <b-col class="f1" sm="2">이번 달<br>훈련 횟수</b-col>
                        <b-col class="f2" sm="2">00</b-col>
                        <b-col class="f1" sm="1">회</b-col>
                    </b-row>
                    <table>
                        <tr>
                            <td><div class="day day-d">01</div></td>
                            <td><div class="day day-b">02</div></td>
                            <td><div class="day day-w">03</div></td>
                            <td><div class="day day-g">04</div></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>

                <div class="calendar-title title-w">
                    <img><h1>MISSION TEN TIMES</h1>
                </div>
                <div class="mission-card">
                    <table>
                        <tr>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                            <td><div class="circle"><span>C</span></div></td>
                        </tr>
                    </table>
                </div>
            </div>
        </b-row>
    </b-container>
</template>
<script>
export default {
    data() {
        return {

        }
    }
}
</script>
<style lang="scss">
@import '@/assets/scss/components/login.scss';
</style>