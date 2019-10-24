const changeActiveClass = (event) => {
  const navbarItems = document.querySelectorAll('.navbar-item')
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
  const navbarItems = document.querySelectorAll('.navbar-item')
  if (navbarItems) {
    navbarItems.forEach((navbarItem) => {
      navbarItem.addEventListener("click", changeActiveClass)
    });
  };
}

export { addEventListenerToNavbarItems };
