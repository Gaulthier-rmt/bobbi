document.addEventListener("DOMContentLoaded", function() {
  // Sélectionner le conteneur où les divs seront ajoutées
  var listContainer = document.getElementById('listContainer');
  var addEventBtn = document.getElementById('addEventBtn');

  // Compteur pour les événements
  var eventCount = 1;

  // Fonction pour ajouter un nouvel événement
  function addEvent() {
      eventCount++;
      var newDiv = document.createElement('div');
      newDiv.classList.add('event-item');

      // Ajouter le contenu à la div
      newDiv.innerHTML = `
          <div class="event-name">Événement ${eventCount}</div>
          <div class="event-details">
              <div>2024-08-15</div>
              <div>Lyon</div>
          </div>
      `;

      // Ajouter la nouvelle div au conteneur
      listContainer.appendChild(newDiv);
  }

  // Ajouter un événement au clic sur le bouton
  addEventBtn.addEventListener('click', addEvent);
});
