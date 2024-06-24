
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      minDate: "today",
      disableMobile: true,
      dateFormat: "d-m-Y"
    })
  }
}


