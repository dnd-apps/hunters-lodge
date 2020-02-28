<template>
    <div>
        <h1>{{ name }}</h1>
        <l-map style="height: 100%" :zoom="0" :maxZoom="4">
            <l-tile-layer url="map/tiles/{z}/{x}-{y}.jpeg" />
        </l-map>
    </div>
</template>

<script lang="ts">
import Vue from 'vue';
import * as L from 'leaflet';
// noinspection TypeScriptCheckImport
import { LMap, LTileLayer, LMarker } from 'vue2-leaflet';
import 'leaflet/dist/leaflet.css';
import Component from 'vue-class-component'

@Component({
    components: {
        LMap,
        LTileLayer,
        LMarker
    }
})
export default class Home extends Vue {
    name = 'banana man'
}
</script>

<style type="scss" scoped>
    h1 {
        color: purple;
        text-transform: capitalize;
    }
</style>
