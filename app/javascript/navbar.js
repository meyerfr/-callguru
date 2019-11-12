function addNavbarItemActive() {
  const href = window.location.href.replace('http://localhost:3000/', '');
  if (href == 'users/1/projects' || href == '') {
    document.querySelector('.projects').classList.add('active')
    // correctTarget.classList.add('active');
  } else if (href == 'pages/setting'){
    document.querySelector('.settings').classList.add('active');
  }
};

function addEventListenerToNavbarItems() {
  const navbarItems = document.querySelectorAll('.navbar-item');
  const paddingNavbar = document.querySelector('.padding-navbar');
  if (navbarItems.length > 0) {
    if (paddingNavbar.classList.contains('no-padding-left')) {paddingNavbar.classList.remove('no-padding-left');};
    addNavbarItemActive();
    navbarItems.forEach((navbarItem) => {
      navbarItem.addEventListener('mousedown', function() {
        navbarItems.forEach((navbarItem) => {
          if (navbarItem.classList.contains('active')) {
            navbarItem.classList.remove('active')
          };
        });
        navbarItem.classList.add('active');
      });
    });
  } else {
    if (!paddingNavbar.classList.contains('no-padding-left')) {paddingNavbar.classList.add('no-padding-left');};
  };
}

function addOrDeleteSideNavbar() {
  const sideNavbar = document.querySelector('.callguru-navbar');
  const noSideNavbar = document.querySelector('.no-side-navbar');
  if (sideNavbar && noSideNavbar) {
    sideNavbar.classList.add('d-none')
  } else if (sideNavbar) {
    if (sideNavbar.classList.contains('d-none')) {
      sideNavbar.classList.remove('d-none')
    }
  };
}

function checkSideNavbar() {
  const sideNavbar = document.querySelector('.callguru-navbar');
  const noSideNavbar = document.querySelector('.no-side-navbar');
  if (sideNavbar || noSideNavbar) {addOrDeleteSideNavbar()}
};


export { addEventListenerToNavbarItems };
export { checkSideNavbar };
