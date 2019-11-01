const changeActiveClass = (event) => {
  const navbarItems = document.querySelectorAll('.navbar-item');
  sessionStorage.setItem('correctTarget', event.currentTarget.classList[1]);
  if (!event.currentTarget.classList.contains('active')) {
    navbarItems.forEach((navbarItem) => {
      if (navbarItem.classList.contains('active')) {
        navbarItem.classList.remove('active')
      };
    });
    event.currentTarget.classList.add('active');
  };
}

function addNavbarItemActive() {
  const correctTarget = document.querySelector('.' + sessionStorage.correctTarget);
  correctTarget.classList.add('active');
};

function addEventListenerToNavbarItems() {
  const navbarItems = document.querySelectorAll('.navbar-item');
  const paddingNavbar = document.querySelector('.padding-navbar');
  if (navbarItems.length > 0) {
    addNavbarItemActive();
    if (paddingNavbar.classList.contains('no-padding-left')) {paddingNavbar.classList.remove('no-padding-left');};
    navbarItems.forEach((navbarItem) => {
      navbarItem.addEventListener('click', changeActiveClass);
    });
  } else {
    if (!paddingNavbar.classList.contains('no-padding-left')) {paddingNavbar.classList.add('no-padding-left');};
  };
}

export { addEventListenerToNavbarItems };
