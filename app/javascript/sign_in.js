function triedSignIn() {
  const chooseLoginWrapper = document.querySelector('.choose-login-wrapper');
  const loginWrapper = document.querySelector('.login-wrapper');
  if (!sessionStorage.tried_sign_in) {
    chooseLoginWrapper.classList.remove('d-none');
    loginWrapper.classList.add('d-none');
  } else{
    chooseLoginWrapper.classList.add('d-none');
    loginWrapper.classList.remove('d-none');
  }
}

function signInAs() {
  const chooseLoginWrapper = document.querySelector('.choose-login-wrapper');
  if (chooseLoginWrapper) {
    triedSignIn();
    const loginWrapper = document.querySelector('.login-wrapper');
    const agentButton = document.querySelector('.agent-button');
    const managerButton = document.querySelector('.manager-button');
    agentButton.addEventListener('click', function(){
      sessionStorage.setItem('tried_sign_in', 'true');
      triedSignIn();
      document.querySelector('.user_signed_in_as').lastElementChild.value = 'user';
    });
    managerButton.addEventListener('click', function(){
      sessionStorage.setItem('tried_sign_in', 'true');
      triedSignIn();
      document.querySelector('.user_signed_in_as').lastElementChild.value = 'admin';
    });
  };
};

function signOut() {
  const sessionDestroyButton = document.querySelector('[data-method="delete"]');
  if (sessionDestroyButton) {
    sessionDestroyButton.addEventListener('click', function(){
      sessionStorage.removeItem('tried_sign_in');
    });
  };
}

export { signInAs };
export { signOut };
