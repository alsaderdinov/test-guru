document.addEventListener('turbolinks:load', function() {
  const signUpForm = document.querySelector('.password-match')

  if (signUpForm) { signUpForm.addEventListener('input', password_match) }

});

function password_match() {
  const password = document.getElementById('user_password')
  const password_confirm = document.getElementById('user_password_confirmation')

  if (password.value === '' || password_confirm.value === '') {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  } else if (password.value == password_confirm.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  } else {
    document.querySelector('.octicon-x').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  }
}
