import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selected-group"
export default class extends Controller {

  static values = { groupId: Number }

  static targets = [ "group" ]

  connect() {
    console.log("Hello, Stimulus!")
    console.log(this.selectedGroupTarget);
  }

  update(event) {
    const id = event.target.dataset.selectedGroupGroupIdValue
    const url = `/groups?group_id=${id}`
    fetch(url, {headers: { "Accept": "text/plain" }})
      .then(response => response.text())
      .then(data => {
        this.groupTarget.outerHTML = data
      })
  }
}
