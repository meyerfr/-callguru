const hideProjectFormAndCreateScript = (event) => {
  var target = event.currentTarget;
  target.parentElement.previousElementSibling.previousElementSibling.classList.add('d-none');
  target.classList.add('d-none');
  target.previousElementSibling.classList.remove('d-none');
  target.nextElementSibling.classList.remove('d-none');
  target.nextElementSibling.click();
}

function creatingProject() {
  const nextStepButton = document.querySelector('.next-step');
  const createProjectButton = document.querySelector('.project-button');
  if (nextStepButton){
    var submitButtonClicked = false;
    nextStepButton.addEventListener('click', hideProjectFormAndCreateScript);
    createProjectButton.addEventListener('click', function(){
      submitButtonClicked = true;
    })
    window.onbeforeunload = e => {
      console.log(submitButtonClicked)
      if (!submitButtonClicked) {
        var dialogText = 'Do you really want to leave this site?';
        e.returnValue = dialogText;
        return dialogText;
      }
    };
  }
}

export { creatingProject }
