document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.form-control.pass-confirm')
  control.addEventListener('input', checkPasswordsEqual)
})

function checkPasswordsEqual()
{
    var pass1 = document.querySelector('.form-control.password');
    var pass2 = document.querySelector('.form-control.pass-confirm');
    if (pass2) {
    var passMatch = "green";
    var passNotMatch = "red";
    }

    if (pass1.value == pass2.value) {
      pass2.style.backgroundColor = passMatch;
    }
    else {
      pass2.style.backgroundColor = passNotMatch;
    }
}
