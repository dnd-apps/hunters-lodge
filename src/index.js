import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from './pages/Home';
import MapUpload from './pages/MapUpload';


const routes = [
 { path: '*', component: Home },
 { path: '/map', component: MapUpload }
]

const router = new VueRouter({ routes })

Vue.use(VueRouter)

new Vue({
 router
}).$mount('#app');
