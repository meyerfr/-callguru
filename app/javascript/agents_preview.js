// function hidePreview(hidePreviewButton, showPreviewButton, agentInterfaceWrapper) {
//   // no Preview => agentInterfaceWrapper add d-none && showPreview button remove d-none
//   hidePreviewButton.addEventListener('click', function(){
//     agentInterfaceWrapper.classList.add('d-none');
//     showPreviewButton.classList.remove('d-none');
//   });
// }

// function showPreview(showPreviewButton, agentInterfaceWrapper) {
//   // Preview => agentInterfaceWrapper remove d-none && showPreview button remove d-none
//   showPreviewButton.addEventListener('click', function(){
//     agentInterfaceWrapper.classList.remove('d-none');
//     showPreviewButton.classList.add('d-none');
//   });
// }

function showOrHidePreview() {
  const hidePreviewButton = document.querySelector('.no-preview');
  const showPreviewButton = document.querySelector('.show-preview');
  const agentInterfaceWrapper = document.querySelector('.agent-interface-wrapper');
  if (agentInterfaceWrapper) {
    // show Preview
    showPreviewButton.addEventListener('click', function(){
      if (agentInterfaceWrapper.classList.contains('d-none')) {
        agentInterfaceWrapper.classList.remove('d-none');
        showPreviewButton.classList.add('d-none');
      }
    });
    // showPreview(showPreviewButton, agentInterfaceWrapper);
    hidePreviewButton.addEventListener('click', function(){
      if (!agentInterfaceWrapper.classList.contains('d-none')) {
        agentInterfaceWrapper.classList.add('d-none');
        showPreviewButton.classList.remove('d-none');
      }
    });
    // hidePreview(hidePreviewButton, showPreviewButton, agentInterfaceWrapper);
  };
}

export { showOrHidePreview }
