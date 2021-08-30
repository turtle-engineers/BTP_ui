<template>
    <div>
        <h1>Welcome to {{title1}}!</h1>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <input type="text" v-model="input1"/>
        <button type="button" @click="getData">Get</button>
        <button type="button" @click="setData">Set</button>

        <select class="form-control" v-model="region" @change="changeRegion">
            <option :key="i" :value="d.v" v-for="(d,i) in options">{{d.t}}</option>
        </select>

        <table class="table table-bordered" v-show="tableShow"> <!-- v-if: false 일땐 랜더링X, v-show: 랜더링O, 화면에 보이고 안보이고를 조절 -->
            <tr :key="i" v-for="(d,i) in options">
                <td>{{d.v}}</td>
                <td>{{d.t}}</td>
            </tr>
        </table>
    </div>
</template>
<script>
export default {
    data() {
        return {
            title1: "BTP",
            input1: "abcd",
            options: [
                {v:"S", t:"Seoul"},
                {v:"J", t:"Jeju"}
            ],
            region: "J",
            tableShow: false
        };
    },
    watch: {
        input1() {
            console.log(this.input1);
        }
    },
    methods:{
        getData() {
            alert(this.input1);
        },
        setData() {
            this.input1 = "12345";
        },
        changeRegion() {
            alert(this.region);
        }
    },
    beforeCreate() {
        console.log("beforeCreate");
    },
    created() {
        console.log("created");
    },
    beforeMount() {
        console.log("beforeMount");
    },
    mounted() {
        console.log("mounted");
    },
    beforeUpdate() {
        console.log("beforeUpdate");
    },
    updated() {
        console.log("updated");
    },
    beforeDestroy() {
        console.log("beforeDestroy");
    },
    destroyed() {
        console.log("destroyed");
    }
};
</script>