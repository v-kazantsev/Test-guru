document.addEventListener('turbolinks:load', function() {
  if (document.getElementById('pass-confirm')) {
  var password1 = document.getElementById('password');
  var password2 = document.getElementById('pass-confirm');
  password2.addEventListener('input', function() {
  if (password2.value === '') { password2.style.backgroundColor = "white"
    } else if (password2.value === password1.value) { password2.style.backgroundColor = "green"
    } else if (password1.value.includes(password2.value)) {
      password2.style.backgroundColor = "yellow"
    } else {
      password2.style.backgroundColor = "red"
    }
  });
 }
});
