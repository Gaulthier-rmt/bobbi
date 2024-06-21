import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { groupId: Number }
  static targets = [ "group" ]

  connect() {
    console.log("Hello, Stimulus!")
    console.log(this.groupTarget);
  }

  update(event) {
    const id = event.target.dataset.selectedGroupGroupIdValue
    const url = `/groups?group_id=${id}`

    fetch(url, {headers: { "Accept": "text/plain" }})
      .then(response => response.text())
      .then(data => {
        this.groupTarget.outerHTML = data
      })

    const buttons = document.querySelectorAll(".custom-btn");
    buttons.forEach(button => button.classList.remove("selected"));

    event.target.classList.add("selected");
  }
}
