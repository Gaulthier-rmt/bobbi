import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="poll"
export default class extends Controller {
  static targets = ["options", "toto"]

  connect() {
    // Initialisation avec le nombre de champs d'options déjà présents
    this.optionsAdded = this.optionsTargets.length;
  }

  addOption(event) {
    // Récupérer tous les éléments qui ont data-target="poll.toto"
    const totoElements = this.totoTargets;
    // Trouver l'index de la currentTarget parmi les éléments toto
    const currentIndex = totoElements.indexOf(event.currentTarget);
    // Vérifier si currentIndex est égal à la longueur de totoElements - 1
    const isLastOption = currentIndex === totoElements.length - 1;

    if (isLastOption) {
      // Insérer un nouveau champ d'option
      this.optionsTarget.insertAdjacentHTML(
        'beforeend',
        `<input type="text" id="poll_options_${this.optionsAdded}" name="poll[options][]" placeholder="Ajouter" class="form-control mt-2" data-action="keyup->poll#addOption" data-poll-target="toto">`
      );
      // Mettre à jour le compteur des champs d'options ajoutés
      this.optionsAdded++;
    }
  }
}
