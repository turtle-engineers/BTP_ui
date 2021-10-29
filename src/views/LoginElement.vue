<template>
    <div>
        <div class="sub-title">
            <div class="circle"></div>
            <f1>RESEARCH RECORD</f1>
            <f2>지금까지 진행한 현황을 볼 수 있습니다.</f2>
        </div>
        <div class="calendar-pad" :style="{'background-image':'url(' + require('@/assets/images/ipad.png') + ')'}">
            <div class="calendar-card">
                <img :src="require('@/assets/images/logo/process_logo.png')" />
                <hr>
                STRETCHING CALENDAR
                <div class="calender-card">

                </div>

                MISSION TEN TIMES
                <div class="mission-card">
                    <div class="circle">C</div>
                </div>
            </div>
        </div>
    </div>
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