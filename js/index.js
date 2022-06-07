const currentLocation = document.location.href;
const navbarItem = document.getElementsByClassName("nav-item");
const MENU = ["index", "productList"];

window.onload = () => {
  for (let i = 0; i < navbarItem.length; i++) {
    navbarItem[i].classList.remove("active");
  }

  for (let i = 0; i < MENU.length; i++) {
    if (currentLocation.includes(MENU[i])) {
      navbarItem[i].classList.add("active");
    }
  }
};
