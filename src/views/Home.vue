<template>
    <body>
        <!-- 검은색 바 -->
        <div class="bar">
            <div class="music-player">▶ This is playing music</div>
            <div class="clock"> 10 : 50 AM </div>
        </div>
        <!-- 헤더(흰색) -->
        <header class="header">
            <div class="header-logo"><a href="#"><img src="..\assets\images\logo\logo.png"></a></div>
            <nav>
                <ul>
                    <a href="#" class="menu-item">
                        <li class="menu-text">스트레칭 가이드</li>
                    </a>
                    <a href="#" class="menu-item">
                        <li class="menu-text">마이 루틴</li>
                    </a>
                    <a href="#" class="menu-item">
                        <li class="menu-text">프로젝트 소개</li>
                    </a>
                </ul>
                <div class="my-menu">
                    <a href="#"><img src="../assets/icon/mypage.png"></a>
                    <a href="#"><img src="../assets/icon/notification.png"></a>
                </div>
            </nav>
        </header>

        <!-- banner -->
        <div class="banner">
            <div class="banner-text">
                <h1>BTP PROJECT</h1>
                <p>현대사회 사람은 지속해서 스트레칭 하지 않으면 거북이가 되어버립니다.<br>
                    거북이가 되면 육지를 떠나야한다는 사실을 알고 계십니까?<br>
                    BTP 프로젝트는 인류의 거북이화를 예방하기 위한 프로젝트로서<br>
                    당신은 이 프로젝트에 자유롭게 참여할 수 있습니다.<br>
                </p>
            </div>
            <!-- <img class="banner-img" src="../assets/images/banner.png"> -->
        </div>

        <!-- main -->
        <div class="main">
            <!-- 브랜드 소개 -->
            <div class="brand">
                <h1>BTP PROJECT</h1>
                <img src="../assets/images/brand.png">
                <p>
                    현대사회 사람은 지속해서 스트레칭 하지 않으면 거북이가 되어버립니다.<br>
                    거북이가 되면 육지를 떠나야한다는 사실을 알고 계십니까?<br>
                    BTP 프로젝트는 인류의 거북이화를 예방하기 위한 프로젝트로서<br>
                    당신은 이 프로젝트에 자유롭게 참여할 수 있습니다.<br>
                </p>
                <a href="#">
                    <div class="morebtn">MORE</div>
                </a>
            </div>

            <!-- 나의 거북이, 오늘의 목표 -->
            <b-container>
                <b-row class="card-main" align-h="between">
                    <b-col class="goal-title">
                        <h1>BTP<br>PROJECT</h1>
                        <img :src="require('@/assets/images/main_arrow.png')" />
                    </b-col>
                    <b-col class="card-view">
                        <div class="card-layout card-w">
                            <cm-t>나의 거북이</cm-t>
                            <img :src="require('@/assets/images/turtle.png')" />
                            <cm-b>
                                <f1>LV.</f1>
                                <f2>00</f2>
                            </cm-b>
                        </div>
                    </b-col>
                    <b-col class="card-view card-goal">
                        <div class="card-layout card-g">
                            <cm-t>오늘의 목표</cm-t>
                            <cm-m>
                                <input type="checkbox" id="g1" name="today-goal" />
                                <label for="g1"><span></span>스트레칭 합산 5분 이상</label><br>
                                <input type="checkbox" id="g2" name="today-goal" />
                                <label for="g2"><span></span>랜덤 챌린지 3회 이상</label><br>
                                <input type="checkbox" id="g3" name="today-goal" />
                                <label for="g3"><span></span>랜덤 챌린지 3회 이상</label>
                            </cm-m>
                            <cm-b>
                                <f1>실험 참여 횟수</f1>
                                <f2>00</f2>
                            </cm-b>
                        </div>
                    </b-col>
                </b-row>
            </b-container>

            <!-- 메인 프로젝트 -->
            <div class="btp-menu">
                <div class="title">
                    <img src="../assets/icon/circle-green.png">
                    <h1>MAIN PROJECT</h1>
                    <p>본 프로젝트로 계획된 플랜을 살펴볼 수 있습니다.</p>
                </div>
                <!-- 상세 메뉴 -->
                <div class="project-menu">
                    <div class="project-item">
                        <img class="project-icon" src="../assets/images/stretching.png">
                        <div class="container">
                            <h1>스트레칭 가이드</h1>
                            <h2>Stretching Guide</h2>
                        </div>
                        <img class="showbtn" src="../assets/icon/circle-down-btn.png">
                        <a href="#">
                            <div class="start">START</div>
                        </a>
                    </div>
                    <div class="project-item">
                        <img class="project-icon" src="../assets/images/myroutine.png">
                        <div class="container">
                            <h1>마이 루틴</h1>
                            <h2>My Stretching Routine</h2>
                        </div>
                        <img class="showbtn" src="../assets/icon/circle-down-btn.png">
                        <a href="#">
                            <div class="start">START</div>
                        </a>
                    </div>
                    <!-- <div class="project-item">
                        <img class="project-icon" src="../assets/images/random_challenge.png">
                        <div class="container">
                        <h1>랜덤 챌린지</h1>
                        <h2>Random Challenge</h2>
                        </div>
                        <img class="showbtn" src="../assets/icon/circle-down-btn.png">
                        <a href="#"><div class="start">START</div></a>
                    </div> -->
                </div>
            </div>

            <!-- 스트레칭 캘린더 -->
            <div class="calender-menu">
                <div class="calendar-title title-g">
                    <img>
                    <h1>RESEARCH RECORD</h1>
                    <p>지금까지 진행한 현황을 볼 수 있습니다.</p>
                </div>
                <b-row class="calendar-pad justify-content-md-center">
                    <img class="calendar-pad-img" :src="require('@/assets/images/ipad.png')" />
                    <div class="calendar-card">
                        <img class="calendar-logo" :src="require('@/assets/images/logo/process_logo.png')" />
                        <hr>
                        <div class="calendar-title title-w">
                            <img>
                            <h1>STRETCHING CALENDAR</h1>
                        </div>
                        <div class="calender-card">
                            <b-row>
                                <b-col><img id="arrow-left" class="arrow-left" src="../assets/icon/circle-down-btn.png"></b-col>
                                <b-col id="calender_date" class="calender-date text-center"></b-col>
                                <b-col class="text-end"><img id="arrow-right" class="arrow-right" src="../assets/icon/circle-down-btn.png"></b-col>
                            </b-row>
                            <b-row class="calender-goal" align-h="end">
                                <b-col class="text-end">
                                    <span class="f1">이번 달 훈련 횟수</span>
                                    <span class="f2">00</span>
                                    <span class="f1">회</span>
                                </b-col>
                            </b-row>
                            <table id="calender_target" align-self="center">

                            </table>
                        </div>

                        <!-- <div class="calendar-title title-w">
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
                        </div> -->
                    </div>
                </b-row>
            </div>
        </div>
    </body>
</template>
<style lang="scss" scoped>
    @import '../assets/scss/components/home.scss';
    @import '../assets/scss/components/header.scss';
    @import '../assets/scss/components/brand.scss';
    @import '../assets/scss/variables.scss';
    @import '../assets/scss/common.scss';
    @import '@/assets/scss/components/login.scss';
</style>
<script>
   
   export default {
        data() {},
    };

    window.addEventListener('load', function() {
        const arrowLeft = document.getElementById("arrow-left");
        arrowLeft.addEventListener("click", arrowLeftEvent);

        const arrowRight = document.getElementById("arrow-right");
        arrowRight.addEventListener("click", arrowRightEvent);
    });

    window.addEventListener('DOMContentLoaded', function() {
        let nowDate = new Date();
        let year = nowDate.getFullYear();
        let thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth()).getMonth();
        calendarEvent(year, thisMonth);
    });

    function arrowLeftEvent() {
        let previous = document.getElementById("calender_date").innerText;
        let year = new Date(previous).getFullYear();
        if (new Date(previous).getMonth() - 1 == -1) {
            year = year - 1;
        }
        let thisMonth = new Date(year, new Date(previous).getMonth() - 1).getMonth();
        calendarEvent(year, thisMonth);
    }

    function arrowRightEvent() {
        let next = document.getElementById("calender_date").innerText;
        let year = new Date(next).getFullYear();
        if (new Date(next).getMonth() + 1 == 12) {
            year = year + 1;
        }
        let thisMonth = new Date(year, new Date(next).getMonth() + 1).getMonth();
        calendarEvent(year, thisMonth);
    }

    function calendarEvent(year, thisMonth) {
        let nowDate = new Date();

        //먼저 윤달을 계산해야한다.
        // let year = nowDate.getFullYear();
        let lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        let month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

        //아래의 조건문이 윤달을 계산하는 방법이다.
        if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
            lastDay[1] = 29;
        } else {
            lastDay[1] = 28;
        }

        //이번달을 구해야한다. 달이 -1로 나오는데 0부터 시작하기 때문이다.
        // let thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth()).getMonth();

        //그리고 지난달의 마지막 요일 인덱스를 변수로 지정한다.
        let prevMonthDay = new Date(nowDate.getFullYear(), thisMonth).getDay(); // eslint-disable-line no-unused-vars

        let thisDate = month[thisMonth];
        let date = lastDay[thisMonth];

        // 오늘 날짜
        let day = nowDate.getDate();


        const thisMonthDay = new Date(year, thisMonth).getDay();


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
        let dateNum = "";
        //지난달의 마지막 요일 이후부터 이번달의 마지막일까지 반복
        for (let i = 1; i <= 35 - thisMonthDay; i++) {

            // 색 지정
            if (i <= day) {
                dateColor = "day-g";
                dateNum = i;
            } else if (i <= date) {
                dateColor = "day-d";
                dateNum = i;
            } else {
                dateColor = "day-d";
                dateNum = "";
            }

            //7일씩 tr로 묶기
            if (count % 7 === 0) {
                tag += "<tr>";

            }
            //조건은 쉬는 날을 지정. 따로 classname을 부여. count시작
            if (((thisDate === "Jan" && i === 1) ||
                    (thisDate === "Feb" && (i === 11 || i === 12 || i === 13)) ||
                    (thisDate === "Mar" && i === 1) ||
                    (thisDate === "May" && (i === 5 || i === 19)) ||
                    (thisDate === "Aug" && (i === 20 || i === 21 || i === 22))) ||
                (count % 7 === 0 || count % 7 === 6)) {

                tag += `<td class="day ` + dateColor + `">` + dateNum + `</td>`;
                count++;

            } else if (count % 7 === 2 || count % 7 === 4) {
                tag += `<td class="day ` + dateColor + `">` + dateNum + `</td>`;
                count++;
            } else {
                tag += `<td class="day ` + dateColor + `">` + dateNum + `</td>`;
                count++;
            }
            //7일이 끝나면 tr태그 닫기
            if (count % 7 === 0) {
                tag += "</tr>";
            }

        }

        let calenderM = year + "." + (thisMonth + 1);
        document.getElementById("calender_date").innerText = calenderM;
        document.getElementById("calender_target").innerHTML = tag;
    }
</script>