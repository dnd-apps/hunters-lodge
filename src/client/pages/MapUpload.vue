<template>
    <div>
        <div id="image-altering">
            <div>
                <label for="zoom">Zoom:</label>
                <input v-model="zoom" id="zoom" type="number" value="0"/>
            </div>
            <div>
                <label for="size">Size:</label>
                <input v-model="size" id="size" type="number" value="256"/>
            </div>
            <div>
                <input name="file" type="file" v-on:change="processFile" />
            </div>

            <button v-on:click="sendFile">{{message}}</button>
            <button v-on:click="fetchFile">Fetch File</button>
            <img :src="retrievedFile" alt="Image....">
        </div>
        <div id="tester" v-on:click="increment">
            {{ counter }}
        </div>
    </div>
</template>

<script lang="ts">
    import Vue from 'vue';
    import Component from 'vue-class-component';
    import ImageService from "../services/imageService";

    @Component
    export default class MapUpload extends Vue {
        imageService = new ImageService();
        message = 'Send File';
        zoom: number = 0;
        size: number = 256;
        fileData: File;
        retrievedFile!: any = null;

        get counter() {
            return this.$store.state.count
        }

        increment() {
            this.$store.commit(`increment`)
        }

        processFile(event) {
            this.fileData = event.target.files[0];
        }
        sendFile() {
            this.imageService.post(this.fileData)
                .then(console.log)
                .catch(console.log)
        }

        fetchFile() {
            this.imageService.get('images/jpeg/0-0-0.jpeg')
                .then(({data}: {data: string }) => {
                    this.retrievedFile = 'data:image/png;base64,' + data;
                })
                .catch(console.log)
        }
    }
</script>

<style scoped lang="sass">

</style>