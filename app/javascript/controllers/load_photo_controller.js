import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="load-photo"
export default class extends Controller {
  static targets = ["fileInput"]

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  submit() {
    console.log(this.fileInputTarget.form);
    this.fileInputTarget.form.submit();
  }
}
