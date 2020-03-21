<template>
    <a v-if="!authenticated" :href="discordOath2Url">Login with Discord</a>
</template>

<script lang="ts">
    import Vue from 'vue';
    import Component from 'vue-class-component';
    import queryString from 'query-string';
    import {DISCORD_AUTHORIZE_ENDPOINT, DISCORD_AUTHORIZE_PARAMS} from "../env";

    @Component
    export default class LoginButton extends Vue {
        name: "login-button";
        get authenticated() {
            return this.$store.getters.authenticated;
        }
        get discordOath2Url() {
            return [
                DISCORD_AUTHORIZE_ENDPOINT,
                queryString.stringify(DISCORD_AUTHORIZE_PARAMS)
            ].join('?');
        }
    }
</script>

<style lang="scss" scoped>

</style>
