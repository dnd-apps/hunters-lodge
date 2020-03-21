import axios from 'axios';
import {LAMBDA_ENDPOINT_URL} from "../env";


export default class ImageService {
    public url(path: string) {
        return `${LAMBDA_ENDPOINT_URL}/${path}`;
    }

    public async post(file_content: File) {
        const data = new FormData();
        data.append('image_file', file_content);
        return axios({
            method: 'post',
            url: this.url('/api/images/upload'),
            data,
            headers: {
                'Authorization': '',
                'Content-Type': 'multipart/form-data',
                'Access-Control-Allow-Origin': '*'
            }
        });
    }

    public async get(file_id: string, system_file: boolean = false) {
        return axios({
            method: 'get',
            url: this.url('/api/images/download'),
            params: {
                system_file,
                file_id: 'images/0-0-0.jpeg'
            },
            headers: {
                'Authorization': '',
                'Access-Control-Allow-Origin': '*'
            }
        });
    }
}