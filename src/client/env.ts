export const DISCORD_API_ENDPOINT = process.env.DISCORD_API_ENDPOINT;
export const DISCORD_CLIENT_ID = process.env.DISCORD_CLIENT_ID;
export const DISCORD_CLIENT_SECRET = process.env.DISCORD_CLIENT_SECRET;
export const DISCORD_REDIRECT_URI = process.env.DISCORD_REDIRECT_URI;
export const DISCORD_OAUTH2_SCOPE = process.env.DISCORD_OAUTH2_SCOPE || 'email identify';
export const DISCORD_AUTHORIZE_ENDPOINT = process.env.DISCORD_AUTHORIZE_ENDPOINT;
export const DISCORD_AUTHORIZE_PARAMS = {
    client_id: DISCORD_CLIENT_ID,
    response_type: 'code',
    scope: DISCORD_OAUTH2_SCOPE,
    redirect_uri: DISCORD_REDIRECT_URI
};
export const LAMBDA_ENDPOINT_URL = (process.env.LAMBDA_ENDPOINT_URL || '').replace(/\/$/, '');
