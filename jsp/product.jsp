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
      <%
        String userRole = (String)session.getAttribute("userRole");

        if(userRole != null) {
      %>
          <button class="product__btnAddToCart" type="submit">Add to Cart</button>
      <%
        } else {
      %>
          <button class="product__btnAddToCart" type="button" disabled>Please Login</button>
      <%
        }
      %>
    </div>
  </div>
</form>
