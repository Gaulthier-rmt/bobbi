import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    console.log(this.markersValue.lat)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }


  #addMarkersToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
      .addTo(this.map)
  }

    #fitMapToMarkers() {
    this.map.flyTo({
      center: [this.markersValue.lng, this.markersValue.lat],
      zoom: 15,
      speed: 1,
    });
  }
}
