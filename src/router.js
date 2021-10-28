import Vue from "vue";
import VueRouter from "vue-router";
import Home from "./views/Home";
import MyRoutine from "./views/MyRoutine";
import RandomChallenge from "./views/RandomChallenge";
import MyTurtle from "./views/MyTurtle";
import StretchingGuide from "./views/StretchingGuide";
import Account from "./views/Account";
import Settings from "./views/Settings";
import MissionList from "./views/MissionList";
import About from "./views/About";
import Story from "./views/Story";
import NotFoundPage from "./views/NotFoundPage";
import LoginElement from "./views/LoginElement";


Vue.use(VueRouter);

const router = new VueRouter({
    mode: "history",
    routes: [
        {path:"/", component: Home},

        {path:"/myroutine", component: MyRoutine},

        {path:"/randomChallenge", component: RandomChallenge},
        {path:"/myturtle", component: MyTurtle},
        {path:"/stretchingGuide", component: StretchingGuide},

        {path:"/account", component: Account},
        {path:"/settings", component: Settings},
        {path:"/missionList", component: MissionList},

        {path:"/about", component: About},        
        {path:"/story", component: Story},

        {path:"/LoginElement", component: LoginElement},

        {path:"*", component: NotFoundPage}
    ]
});

export default router;