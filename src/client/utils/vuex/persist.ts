import Cookies from 'js-cookie';
import {pick} from 'lodash';
import VuexPersistence from 'vuex-persist';
import {decode64, encode64} from "../base64";

const vuexPersistence = new VuexPersistence<any, any>({
    restoreState:  (key: string, storage: any) => {
        const cookieState = Cookies.get(key);
        if (cookieState) {
            const encrypted = Cookies.get(key);
            const decrypted = decode64(encrypted);
            console.log(decrypted);
            return JSON.parse(decrypted);
        }
        return {};
    },
    saveState:  (key: string, state: any, storage: any) => {
        const persistedKeys = Object.keys(state).filter(stateKey => state[stateKey] && state[stateKey].persist);
        const selectedState = pick(state, persistedKeys);
        const selectedStateString = JSON.stringify(selectedState).toString();
        const encryptedState = encode64(selectedStateString)
        return Cookies.set(key, encryptedState);
    }
});

export default vuexPersistence.plugin;