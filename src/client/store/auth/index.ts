

export default {
    state: {
        persist: true,
        code: '',
        token: '',
        nextToken: '',
        tokenExpiration: 0
    },
    getters: {
        authenticated(state: any) {
            return state.code.length > 0;
        }
    },
    mutations: {
        setToken (state: any, token: string) {
            state.token = token;
        },
        setCode(state: any, code: string) {
            console.log('setCode', code);
            state.code = code;
        }
    },
    actions: {
        setCode ({context, state}: any, code?: string) {
            if (code && state.code !== code) {
                context.commit('setCode', code);
            }
        }
    }
}
