
import CryptoJs from 'crypto-js';

export function encode64(str: string) {
    const wordArray = CryptoJs.enc.Utf8.parse(str);
    return CryptoJs.enc.Base64.stringify(wordArray);
}

export function decode64(base64Str: string) {
    const parsedWordArray = CryptoJs.enc.Base64.parse(base64Str);
    return parsedWordArray.toString(CryptoJs.enc.Utf8);
}
