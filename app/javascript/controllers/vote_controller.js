import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vote"
export default class extends Controller {
  connect() {
    console.log("hello toto");
  }

  submitForm(event) {
    event.preventDefault();
    this.element.submit();
  }
}
