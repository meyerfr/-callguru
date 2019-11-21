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
  nextStepButton.addEventListener('click', hideProjectFormAndCreateScript);
}

export { creatingProject }
