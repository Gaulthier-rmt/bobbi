import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  copy(event) {
    this.inputTarget.select();
    document.execCommand('copy');

    // Désactiver le bouton après la copie
    event.currentTarget.disabled = true;

    // Changer le texte du bouton (optionnel)
    // event.currentTarget.innerText = this.feedbackTextValue;

    // Changer l'icône après la copie
    const icon = event.currentTarget.querySelector('i');
    icon.classList.remove('fa-copy');
    icon.classList.add('fa-circle-check');
  }
}
