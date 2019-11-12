function signInAs() {
  const chooseLoginWrapper = document.querySelector('.choose-login-wrapper');
  const loginWrapper = document.querySelector('.login-wrapper');
  const agentButton = document.querySelector('.agent-button');
  const managerButton = document.querySelector('.manager-button');
  if (chooseLoginWrapper) {
    agentButton.addEventListener('click', function(){
      chooseLoginWrapper.classList.add('d-none');
      loginWrapper.classList.remove('d-none');
      document.querySelector('.user_signed_in_as').lastElementChild.value = 'user'
    });
    managerButton.addEventListener('click', function(){
      chooseLoginWrapper.classList.add('d-none');
      loginWrapper.classList.remove('d-none');
      document.querySelector('.user_signed_in_as').lastElementChild.value = 'admin'
    });
  };
};

export { signInAs };
