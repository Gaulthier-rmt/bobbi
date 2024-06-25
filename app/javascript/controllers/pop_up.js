document.addEventListener('DOMContentLoaded', function() {
  var myModal = new bootstrap.Modal(document.getElementById('pollModal'), {
    keyboard: false
  });

  var openModalButton = document.getElementById('openPollModal');
  openModalButton.addEventListener('click', function(event) {
    event.preventDefault();
    myModal.show();
  });
});
