document.addEventListener("DOMContentLoaded", function() {
  const form = document.getElementById("participation-form");
  form.addEventListener("submit", function(event) {
    const confirmationMessage = form.querySelector("input[type='submit']").value === 'Ne participe pas'
      ? 'Êtes-vous sûr de ne plus vouloir participer à cet événement ?'
      : 'Êtes-vous sûr de vouloir participer à cet événement ?';

    if (!confirm(confirmationMessage)) {
      event.preventDefault();
    }
  });
});

