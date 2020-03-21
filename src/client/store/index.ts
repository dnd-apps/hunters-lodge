import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);
import auth from "./auth/index";
import persist from '../utils/vuex/persist';

export default new Vuex.Store({
    modules: {
      auth: auth
    },
    state: {
        count: 0
    },
    mutations: {
        setIncrement(state: any, n: number) {
            state.count = n;
        },
        increment (state: any) {
            state.count++
        }
    },
    plugins: [persist]
})
