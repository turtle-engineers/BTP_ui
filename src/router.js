import Vue from "vue";
import VueRouter from "vue-router";
import Home from "./views/Home";

import myroutineStart from "./views/myroutineStart";
import myroutineEdit from "./views/myroutineEdit";
import myroutineStretching from "./views/myroutineStretching";
import MyRoutine from "./views/MyRoutine.vue";

import RandomChallenge from "./views/RandomChallenge";
import MyTurtle from "./views/MyTurtle";
import MyAlarm from "./views/MyAlarm";
import StretchingGuide from "./views/StretchingGuide";
import ProjectAttendance from "./views/ProjectAttendance";
import Account from "./views/Account";
import Settings from "./views/Settings.vue";
import MissionList from "./views/MissionList";
import About from "./views/About";
import Story from "./views/Story";
import NotFoundPage from "./views/NotFoundPage";
import LoginElement from "./views/LoginElement.vue";
import Login from "./views/Login.vue";
import LoginRedirect from "./views/LoginRedirect.vue";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Home },

    { path: "/myroutine", component: MyRoutine},
    { path: "/myroutine/start", component: myroutineStart },
    { path: "/myroutine/edit", component: myroutineEdit },
    { path: "/myroutine/stretching", component: myroutineStretching },    

    { path: "/randomChallenge", component: RandomChallenge },
    { path: "/myturtle", component: MyTurtle },
    { path: "/stretchingGuide", component: StretchingGuide },
    { path: "/projectAttendance", component: ProjectAttendance },

    { path: "/account", component: Account },
    { path: "/settings", component: Settings },
    { path: "/missionList", component: MissionList },
    { path: "/Alarm", component: MyAlarm },

    { path: "/about", component: About },
    { path: "/story", component: Story },

    { path: "/LoginElement", component: LoginElement },
    { path: "/Login", component: Login },
    { path: "/LoginRedirect", component: LoginRedirect },

    { path: "*", component: NotFoundPage },
  ],
});

export default router;
