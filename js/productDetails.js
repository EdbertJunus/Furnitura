let inputQtyGroup = document.getElementsByClassName("qty");
let priceGroup = document.getElementsByClassName("price");
let btnSaveGroup = document.getElementsByClassName("btnSave");
let priceList = document.getElementById("productDetails__priceList");
let totalPriceElement = document.getElementById("productDetails__price");

let totalPrice = 0;
for (let i = 0; i < inputQtyGroup.length; i++) {
  let priceTag = document.createElement("p");

  btnSaveGroup[i].addEventListener("click", (e) => {
    e.preventDefault();

    let qty = inputQtyGroup[i].value;
    let price = priceGroup[i].value;
    totalPrice += qty * price;

    inputQtyGroup[i].value = qty;

    priceTag.setAttribute("class", "price");
    priceTag.innerHTML = qty + " x " + price + " = " + qty * price;

    totalPriceElement.innerHTML = totalPrice;
  });

  priceList.appendChild(priceTag);

  if (i + 1 == inputQtyGroup.length) {
    totalPrice = 0;
  }
}
