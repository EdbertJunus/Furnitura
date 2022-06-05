<%@include file="header.jsp"%>

<div class="productDetails">
  <%
    // USERID AKAN DISESUAIKAN NANTI
    query = "SELECT * FROM furniture JOIN mycart ON furniture.FurnitureId = mycart.FurnitureId WHERE mycart.UserId = 1";
    rs = con.executeQuery(query);

    int totalItem = 0;
    int totalPrice = 0;
    boolean hasData = false;
    while(rs.next()) {
      hasData = true;
      String name = rs.getString("FurnitureName");
      String img = rs.getString("FurnitureImage");
      String desc = rs.getString("FurnitureDescription");
      int price = rs.getInt("FurniturePrice");
      
      totalItem += 1;
      totalPrice += price;
  %>
      <jsp:include page="productDetail.jsp">
        <jsp:param name="name" value="<%=name%>" />
        <jsp:param name="img" value="<%=img%>" />
        <jsp:param name="desc" value="<%=desc%>" />
        <jsp:param name="price" value="<%=price%>" />
      </jsp:include>
  <%
    }

    if(hasData == false) {
  %>
      <div class="productDetails__noData">
        <h1>Your cart is empty.</h1>
        <a href="<%=request.getContextPath()%>/jsp/productList.jsp">Add Something</a>
      </div>
  <%
    }
  %>

  <form class="productDetails__form show" action="checkoutProcess.jsp" method="POST">
    <div class="productDetails__checkoutBox">
      <h4><%=totalItem%> item(s)</h4>
      <p class="productDetails__priceTitle">Price:</p>
      <p class="productDetails__price">Rp. <%=totalPrice%></p>
      <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
      <button class="productDetails__btnCheckout" type="submit">Checkout</button>
    </div>
  </form>
</div>

<%@include file="../html/footer.html"%>