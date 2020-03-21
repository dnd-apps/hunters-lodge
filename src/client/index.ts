import 'vue-class-component/hooks';
import './class-component-hooks';

// Import vue
import Vue from 'vue';
import VueRouter from 'vue-router';

// Setup Vue plugins
Vue.use(VueRouter);

// Import modules
import Home from './pages/Home';
import store from './store/index';

// Route Components
const MapUpload = () => import('./pages/MapUpload');
const Authorize = () => import('./pages/Authorize.vue');

const routes = [
 {
     name: 'map',
     path: '/map',
     component: MapUpload
 },
 {
   name: 'authorize',
   path: '/authorize',
   component: Authorize
 },
 { path: '**', component: Home, alias: '/' }
];

const router = new VueRouter({ routes });


new Vue({
 store,
 router
}).$mount('#app');

