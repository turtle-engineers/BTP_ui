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
                        <b-col id="calender_date" class="calender-date"></b-col>
                        <b-col></b-col>
                    </b-row>
                    <b-row class="calender-goal" align-h="end">
                        <b-col class="f1" sm="2" align-self="end">이번 달<br>훈련 횟수</b-col>
                        <b-col class="f2" sm="2" align-self="end">00</b-col>
                        <b-col class="f1" sm="1" align-self="end">회</b-col>
                    </b-row>
                    <table id="calender_target" align-self="center">

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
// import $ from 'jquery'
export default {
    data() {
        return {

        }
    }
}


let nowDate = new Date();

//먼저 윤달을 계산해야한다.
let year = nowDate.getFullYear();
let lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
let month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

//아래의 조건문이 윤달을 계산하는 방법이다.
if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
    lastDay[1] = 29;
} else {
    lastDay[1] = 28;
}

//이번달을 구해야한다. 달이 -1로 나오는데 0부터 시작하기 때문이다.
let thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth()).getMonth();
//그리고 지난달의 마지막 요일 인덱스를 변수로 지정한다.
let prevMonthDay = new Date(nowDate.getFullYear(), thisMonth).getDay(); // eslint-disable-line no-unused-vars

let thisDate = month[thisMonth];
let date = lastDay[thisMonth];

// 오늘 날짜
let day = nowDate.getDate();


const thisMonthDay = new Date(nowDate.getFullYear(), thisMonth).getDay();


//*실제 달력 만드는 코드
//문자열로 마크업을 시작한다.
//문자열 자체를 반복문을 이용해 만들어 준다. 
let tag = "<tr>";

// if(nextData===this.$proA.innerHTML){ 
    let count = 0;
    //지난달의 마지막 요일 인덱스까지 빈배열로 반복문 시작
    for (let j = 0; j < thisMonthDay; j++) {
        tag += `<td><div class="day day-d"></div></td>`;
        count++;
    }
    
    let dateColor = "";
    //지난달의 마지막 요일 이후부터 이번달의 마지막일까지 반복
    for (let i = 1; i <= date; i++) {

        // 색 지정
        if(i < day) {
            dateColor = "day-g";
        }else if(i == day) {
            dateColor = "day-w";
        }else {
            dateColor = "day-d";
        }

    	//7일씩 tr로 묶기
        if (count % 7 === 0) {
            tag += "<tr>";

        }
        //조건은 쉬는 날을 지정. 따로 classname을 부여. count시작
        if(((thisDate==="Jan"&& i===1)||
            (thisDate==="Feb"&& (i===11||i===12||i===13))||
            (thisDate==="Mar"&& i===1)||
            (thisDate==="May"&& (i===5||i===19))||
            (thisDate==="Aug"&& (i===20||i===21||i===22)))||
            (count % 7 === 0||count % 7 === 6)){

            tag += `<td class="xday"><div class="day ` + dateColor + `">${i}</div></td>`;
            count++;

        }else if(count%7===2||count%7===4){
            tag += `<td class="Ahalf"><div class="day ` + dateColor + `">${i}</div></td>`;
            count++;
        }else{
            tag += `<td class="pickday"><div class="day ` + dateColor + `">${i}</div></td>`;
            count++;
        }
        //7일이 끝나면 tr태그 닫기
        if (count % 7 === 0 || i == date) {
            tag += "</tr>";
        }

    }

// }

    // <td><div class="day day-d">01</div></td>
    // <td><div class="day day-b">02</div></td>
    // <td><div class="day day-w">03</div></td>
    // <td><div class="day day-g">04</div></td>

window.addEventListener('DOMContentLoaded', function() {
    // console.log(tag);
    document.getElementById("calender_date").innerText = nowDate.getFullYear()+"."+(nowDate.getMonth()+1)+"."+nowDate.getDate();
    document.getElementById("calender_target").innerHTML = tag;
});

</script>
<style lang="scss">
@import '@/assets/scss/components/login.scss';
</style>