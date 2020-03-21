import axios from 'axios';
import {
    DISCORD_API_ENDPOINT,
    DISCORD_CLIENT_ID,
    DISCORD_CLIENT_SECRET,
    DISCORD_OAUTH2_SCOPE,
    DISCORD_REDIRECT_URI
} from "../env";

export default class DiscordService {
    postCode(code: string) {
        return axios({
            method: "post",
            url: `${DISCORD_API_ENDPOINT}/oauth2/token`,
            data: {
                client_id: DISCORD_CLIENT_ID,
                client_secret: DISCORD_CLIENT_SECRET,
                grant_type: 'authorization_code',
                code,
                redirect_uri: DISCORD_REDIRECT_URI,
                scope: DISCORD_OAUTH2_SCOPE
            },
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
        })
    }
}