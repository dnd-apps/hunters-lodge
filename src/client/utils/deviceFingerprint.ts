import Fingerprint2 from 'fingerprintjs2';
import {encode64} from "./base64";

export default async function deviceFingerprint(): string {
    return new Promise(resolve =>
        Fingerprint2.get((components: any) =>
            resolve(encode64(components))
        )
    );
}
