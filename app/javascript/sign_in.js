function triedSignIn() {
  // user tried unseccessfull SignIn
  const chooseLoginWrapper = document.querySelector('.choose-login-wrapper');
  const loginWrapper = document.querySelector('.login-wrapper');
  // if it hasn´t been tried, show chooseLoginWrapper
  if (!sessionStorage.tried_sign_in) {
    chooseLoginWrapper.classList.remove('d-none');
    loginWrapper.classList.add('d-none');
  // if it has been tried, show signIn form and set user_signed_in_as.value to sessionStorage
  } else{
    document.querySelector('#user_signed_in_as').value = sessionStorage.tried_sign_in_as;
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
    const loginButton = document.querySelector('.login-button');
    agentButton.addEventListener('click', function(){
      sessionStorage.setItem('tried_sign_in', 'true');
      sessionStorage.setItem('tried_sign_in_as', 'user');
      triedSignIn();
    });
    managerButton.addEventListener('click', function(){
      sessionStorage.setItem('tried_sign_in', 'true');
      sessionStorage.setItem('tried_sign_in_as', 'admin');
      triedSignIn();
    });
    loginButton.addEventListener('click', function(){
      sessionStorage.removeItem('tried_sign_in');
      triedSignIn();
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
