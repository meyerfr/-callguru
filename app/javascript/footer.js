function checkFooter() {
  const footer = document.querySelector('.footer-wrapper');
  const noFooter = document.querySelector('.no-footer');
  if (footer && noFooter) {
    footer.classList.add('d-none')
  } else if (footer.classList.contains('d-none')) {
    footer.classList.remove('d-none')
  };
};

export { checkFooter };
