<template>
    <div>
        <form id="map-adjust" ref="mapAdjust">
            <div>
                <label for="zoom">Zoom:</label>
                <input name="zoom" id="zoom" type="number" value="0"/>
            </div>
            <div>
                <label for="size">Size:</label>
                <input name ="size" id="size" type="number" value="256"/>
            </div>
            <div>
                <input name="file" type="file" v-on:change="processFile" />
            </div>
            <button v-on:click="sendFile">{{message}}</button>
        </form>
    </div>
</template>

<script lang="ts">
    import Vue from 'vue'
    import axios from 'axios'
    import Component from 'vue-class-component'

    @Component
    export default class MapUpload extends Vue {
        message = 'Send File';
        fileData: File;
        processFile(event) {
            this.fileData = event.target.files[0];
        }
        sendFile() {
            console.log(this.$refs.mapAdjust[0])

            // if (this.fileData) {
                const form: any = this.$refs.mapAdjust;
                const data = new FormData(document.getElementById('map-adjust'));
                data.append('image_file', this.fileData);
                console.log(data);
                // const request = axios({
                //     method: 'post',
                //     url: 'http://localhost:9292/api/images/upload',
                //     data,
                //     headers: {
                //         'Content-Type': 'multipart/form-data',
                //         'Access-Control-Allow-Origin': '*'
                //     }
                // });

                // request
                //     .then(console.log)
                //     .catch(console.log)
            // }
        }
    }
</script>

<style scoped lang="sass">

</style>