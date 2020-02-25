<template>
    <div>
        <h1>{{ name }}</h1>
        <l-map style="height: 350px" zoom="0" maxZoom="4">
            <l-tile-layer url="map/tiles/{z}/{x}-{y}.jpeg" />
        </l-map>
    </div>
</template>

<script>
    import * as L from 'leaflet';
    import { LMap, LTileLayer, LMarker } from 'vue2-leaflet';
    import 'leaflet/dist/leaflet.css';

    export default {
        name: "Home",
        data: () => ({
          name: 'banana man'
        }),
        components: {
            LMap,
            LTileLayer,
            LMarker
        }
    }
</script>

<style type="scss" scoped>
    h1 {
        color: purple;
        text-transform: capitalize;
    }
</style>
