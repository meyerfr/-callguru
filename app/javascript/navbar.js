const changeActiveClass = (event) => {
  const navbarItems = document.querySelectorAll('.navbar-item');
  if (!event.currentTarget.classList.contains('active')) {
    navbarItems.forEach((navbarItem) => {
      if (navbarItem.classList.contains('active')) {
        navbarItem.classList.remove('active')
      };
    });
    event.currentTarget.classList.add('active');
  };
}

function addEventListenerToNavbarItems() {
  const navbarItems = document.querySelectorAll('.navbar-item');
  const paddingNavbar = document.querySelector('.padding-navbar');
  if (navbarItems.length != 0) {
    console.log('remove no-padding')
    if (paddingNavbar.classList.contains('no-padding')) {paddingNavbar.classList.remove('no-padding');};
    navbarItems.forEach((navbarItem) => {
      navbarItem.addEventListener("click", changeActiveClass)
    });
  } else {
    if (!paddingNavbar.classList.contains('no-padding')) {paddingNavbar.classList.add('no-padding');};
  };
}

export { addEventListenerToNavbarItems };
