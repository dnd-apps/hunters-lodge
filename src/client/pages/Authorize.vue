<template>
    
</template>
<!--auth test http://127.0.0.1:9000/#/authorize?code=Qe6BDUynnYu7iQL2LgPqOxgvEsQcvs-->
<script lang="ts">
    import Vue from 'vue';
    import Component from 'vue-class-component'
    import * as queryString from 'query-string';
    import {get} from 'lodash';

    @Component
    export default class Authorize extends Vue {
        name = 'banana man';
        get authenticated(): boolean {
            return this.$store.getters.authenticated;
        }

        parseQueryParams() {
            return queryString.parse(location.search);
        }

        authenticate(code: string) {
            this.$store.commit('setCode', code);
        }

        beforeRouteEnter(to: any, from: any, next: any) {
            return next((vm: any) => {
                if (vm.authenticated) {
                    console.log('beforeRouteEnter', 'authenticated');
                    vm.$router.push(from);
                }
                const code = get(to, 'query.code');
                if (!code) {
                    console.log('beforeRouteEnter', 'code not found on router query');
                    const queryParams = vm.parseQueryParams();
                    console.log(queryParams);
                    const urlCode = get(queryParams, 'code');
                    if (!urlCode) {
                        console.log('beforeRouteEnter', 'code not found on query string');
                        return vm.$router.push('/')
                    }
                    vm.authenticate(urlCode);
                    const baseUrl = window.location.href.split('?')[0];
                    const redirectPath = `${baseUrl}#${to.path}`;
                    // @ts-ignore
                    return window.location = redirectPath;
                }
                console.log('beforeRouteEnter', 'code found on query');
                vm.authenticate(code);
                const returnRoute = to.path === from.path ? {path: '/'} : from;
                return vm.$router.push(returnRoute);
            });

        }
    }
</script>

<style scoped>

</style>