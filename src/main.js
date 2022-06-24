import Vue from 'vue'
import App from './App.vue'
import router from './router'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import vuetify from './plugins/vuetify'

// import jQuery from 'jquery'
// global.$ = jQuery

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

//pinia : state
import { createPinia, PiniaVuePlugin } from 'pinia';
import VueCompositionAPI from '@vue/composition-api'
Vue.use(PiniaVuePlugin)
const pinia = createPinia()
Vue.use(VueCompositionAPI)

Vue.config.configureWebpack= true

Vue.config.productionTip = false

new Vue({
  router,
  vuetify,
  pinia,
  render: (h) => h(App),
}).$mount('#app');