/* eslint no-console: 0 */

// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


import Vue from 'vue/dist/vue.esm';
import VueMapbox from 'vue-mapbox';
import {
    MglMap,
    MglMarker
} from 'vue-mapbox';

Vue.use(VueMapbox, { mapboxgl: window.mapboxgl });

document.addEventListener('DOMContentLoaded', () => {
    const vm = new Vue({
        el: '#hello',
        data: {
            coordinates: [13.424715661631296,52.50274859915439],
            accessToken: 'pk.eyJ1Ijoib2tmZGUiLCJhIjoiY2prbXBqYmN3MDlqeTN3cWw3d29iN3N6diJ9.3gsuGnBGg7Z67XxRFNLalA',
            mapStyle: 'mapbox://styles/okfde/cjhhp085v001u2rqh82cj1x6p'
        },
        components: {MglMap, MglMarker}
    });
});
