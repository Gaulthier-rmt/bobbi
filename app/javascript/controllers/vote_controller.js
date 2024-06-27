import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="vote"
export default class extends Controller {

  static targets = [ "form" ]

  connect() {
    // console.log("hello toto");
    // console.log(this.formTarget);
  }

  submitForm(event) {
    event.preventDefault();
    const baseUrl = this.formTarget.action;
    const optionId = event.currentTarget.dataset.optionId;
    const origin = event.currentTarget.dataset.origin;

    // Créer une URL avec les bons paramètres
    let url = `${baseUrl}?option_id=${optionId}`;
    if (origin === "index") {
        url += `&origin=${origin}`;
    }

    console.log(url);  // Affichez l'URL pour vérification
    this.formTarget.action = url;
    this.element.submit();
}
}
