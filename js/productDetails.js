let inputQtyGroup = document.getElementsByClassName("qty");
let priceGroup = document.getElementsByClassName("price");
let btnSaveGroup = document.getElementsByClassName("btnSave");
let priceList = document.getElementById("productDetails__priceList");
let totalPriceElement = document.getElementById("productDetails__price");
let itemQty = document.getElementById("productDetails__itemQty");
let priceTag;
let priceInput;

let totalItem = 0;
let qty = 0;
let price = 0;
let totalPrice = 0;
window.addEventListener("load", () => {
  for (let i = 0; i < inputQtyGroup.length; i++) {
    priceTag = document.createElement("p");
    qtyInput = document.createElement("input");
    priceInput = document.createElement("input");

    qtyInput.setAttribute("type", "hidden");
    qtyInput.setAttribute("name", "qty");
    qtyInput.setAttribute("class", "qtyInput");

    priceInput.setAttribute("type", "hidden");
    priceInput.setAttribute("name", "totalPrice");
    priceInput.setAttribute("class", "totalPrice");

    qty = inputQtyGroup[i].value;
    price = priceGroup[i].value;

    totalItem += parseInt(qty);
    inputQtyGroup[i].value = qty;

    priceTag.setAttribute("class", "price");
    priceTag.innerHTML =
      "<span>" +
      qty +
      "</span>" +
      " x " +
      price +
      " = <span>" +
      qty * price +
      "</span>";

    qtyInput.value = qty;
    priceInput.value = qty * price;

    totalPrice += qty * price;
    totalPriceElement.innerHTML = totalPrice;

    priceList.appendChild(qtyInput);
    priceList.appendChild(priceInput);
    priceList.appendChild(priceTag);
  }

  itemQty.innerHTML = totalItem + " item(s)";
});

for (let i = 0; i < inputQtyGroup.length; i++) {
  btnSaveGroup[i].addEventListener("click", (e) => {
    e.preventDefault();

    qty = inputQtyGroup[i].value;
    price = priceGroup[i].value;

    inputQtyGroup[i].value = qty;

    priceList.childNodes[(i + 1) * 3 - 1].innerHTML =
      "<span>" +
      qty +
      "</span>" +
      " x " +
      price +
      " = <span>" +
      qty * price +
      "</span>";

    totalItem = 0;
    totalPrice = 0;

    let qtyInput = document.getElementsByClassName("qtyInput");
    let priceInput = document.getElementsByClassName("totalPrice");

    for (let i = 0; i < inputQtyGroup.length; i++) {
      let myPrice = parseInt(
        priceList.childNodes[(i + 1) * 3 - 1].lastChild?.innerHTML,
      );
      let myItem = parseInt(
        priceList.childNodes[(i + 1) * 3 - 1].firstChild.innerHTML,
      );

      qtyInput[i].value = myItem;
      priceInput[i].value = myPrice;

      if (!isNaN(myPrice)) {
        totalPrice += myPrice;
      }
      totalPriceElement.innerHTML = totalPrice;

      totalItem += myItem;
      itemQty.innerHTML = totalItem + " item(s)";
    }
  });
}
