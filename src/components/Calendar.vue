<template>
    <div class="calendar-card">
        <b-row align-v="center">
            <b-col class="arrow-left">
                <img 
                id="arrow-left"
                @click="arrowLeftEvent"
                src="../assets/icon/Polygon2.png"
                />
            </b-col>
            <b-col class="calender-date text-center">{{year}}.{{month}}</b-col>
            <b-col class="arrow-right">
                <img
                id="arrow-right"
                @click="arrowRightEvent"
                src="../assets/icon/Polygon3.png"
            /></b-col>
        </b-row>
        <b-row class="calender-goal" align-h="end">
            <b-col class="text-end">
                <span class="f1">이번 달 훈련 횟수</span>
                <span class="f2">00</span>
                <span class="f1">회</span>
            </b-col>
        </b-row>

        <table class="calender_target">
            <tbody>
                <tr v-for="(date, idx) in dates" :key="idx" >
                    <td v-for="(day, index) in date" :key="index" class="day day-d">
                        {{day.date}}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style lang="scss" scoped>
@import "../assets/scss/components/account.scss";
</style>
<script>
export default {
    data() {
        return {
            dates: [],
            year: 0,
            month: 0,
        };
    },
    created() {
        this.init()
    },
    methods: {
        init(param) {
            if (param) {
                this.year = param[0];
                this.month = param[1];
                this.calendarEvent();
            } else {
                const date = new Date();
                this.year = date.getFullYear();
                this.month = date.getMonth() + 1;
                this.calendarEvent();
            }
        },
        arrowLeftEvent() {
            const param = [];
            if (this.month - 1 == -1) {
                param[0] = this.year - 1;
            } else {
                param[0] = this.year;
            }

            param[1] = this.month - 1;
            this.init(param);
        },
        arrowRightEvent() {
            const param = [];
            if (this.month + 1 == 12) {
                param[0] = parseInt(this.year) + 1;
            } else {
                param[0] = this.year;
            }
            param[1] = parseInt(this.month) + 1;
            this.init(param);
        },
        calendarEvent() {
            
            let year = this.year;
            let thisMonth = this.month - 1;

            let nowDate = new Date();

            //먼저 윤달을 계산해야한다.
            // let year = nowDate.getFullYear();
            let lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            let month = [
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun",
                "Jul",
                "Aug",
                "Sep",
                "Oct",
                "Nov",
                "Dec",
            ];
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
            let date = lastDay[thisMonth]; // 이번달의 마지막 요일

            // 오늘 날짜
            let day = nowDate.getDate();

            //이번 달의 처음 요일
            const thisMonthDay = new Date(year, thisMonth).getDay();

            let dates = [];
            let daysOfWeek = [];

            //*실제 달력 만드는 코드
            //문자열로 마크업을 시작한다.
            //문자열 자체를 반복문을 이용해 만들어 준다.
            let tag = "<tr>";
            // if(nextData===this.$proA.innerHTML){
            let count = 0;
            //지난달의 마지막 요일 인덱스까지 빈배열로 반복문 시작
            for (let j = 0; j < thisMonthDay; j++) {
                daysOfWeek[count] = { "date" : "" };
                tag += `<td><div class="day day-d"></div></td>`;
                count++;
            }
            let dateColor = "";
            let dateNum = "";
            let week = 5;

            // 1일이 토요일부터 시작할 경우 6주
            if (thisMonthDay == 6 && date >= 30) {
                week = 6;
            }

            //지난달의 마지막 요일 이후부터 이번달의 마지막일까지 반복
            for (let i = 1; i <= 7 * week - thisMonthDay; i++) {
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
                    count = 0;
                    daysOfWeek = [];
                    tag += "<tr>";
                }

                dateNum = dateNum.toString().padStart(2, "0")

                daysOfWeek[count]  = { "date" : dateNum };
                //조건은 쉬는 날을 지정. 따로 classname을 부여. count시작
                if (
                (thisDate === "Jan" && i === 1) ||
                (thisDate === "Feb" && (i === 11 || i === 12 || i === 13)) ||
                (thisDate === "Mar" && i === 1) ||
                (thisDate === "May" && (i === 5 || i === 19)) ||
                (thisDate === "Aug" && (i === 20 || i === 21 || i === 22)) ||
                count % 7 === 0 ||
                count % 7 === 6
                ) {
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
                    dates.push(daysOfWeek);
                    tag += "</tr>";
                }
            }

            this.dates = dates;
            this.month = (this.month).toString().padStart(2, "0");
            this.calender_target =  tag;
        }
    }
}
</script>