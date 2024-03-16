// app/javascript/packs/application.js

document.addEventListener('DOMContentLoaded', function() {
  // Add movie fields
  document.querySelector('#bookmarks').addEventListener('click', function(e) {
    if (e.target.classList.contains('add_fields')) {
      e.preventDefault();
      var bookmarkFields = document.querySelector('.nested-fields').cloneNode(true);
      bookmarkFields.querySelector('select').value = '';
      bookmarkFields.querySelector('textarea').value = '';
      document.querySelector('#bookmarks').appendChild(bookmarkFields);
    }
  });

  // Remove movie fields
  document.querySelector('#bookmarks').addEventListener('click', function(e) {
    if (e.target.classList.contains('remove_fields')) {
      e.preventDefault();
      e.target.closest('.nested-fields').remove();
    }
  });
});