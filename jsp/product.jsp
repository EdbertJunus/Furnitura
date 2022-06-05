<form action="productProcess.jsp" method="GET">
  <div class="product">
    <input type="hidden" name="id" value="${param.id}" />
    <img src="${param.img}" alt="" />
    <div class="product__upper">
      <h6>${param.name}</h6>
      <p>${param.desc}</p>
    </div>
    <div class="product__lower">
      <p>Rp. ${param.price}</p>
      <button class="product__btnAddToCart" type="submit">Add to Cart</button>
    </div>
  </div>
</form>
