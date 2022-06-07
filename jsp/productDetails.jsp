<%@include file="header.jsp"%>

<div class="productDetails">
  <%
    int userId = (Integer)session.getAttribute("userId");

    query = String.format("SELECT * FROM furniture JOIN mycart ON furniture.FurnitureId = mycart.FurnitureId WHERE mycart.UserId = %d", userId);
    rs = con.executeQuery(query);

    boolean hasData = false;
    while(rs.next()) {
      hasData = true;
      int id = rs.getInt("FurnitureId");
      String name = rs.getString("FurnitureName");
      String img = rs.getString("FurnitureImage");
      String desc = rs.getString("FurnitureDescription");
      int price = rs.getInt("FurniturePrice");
  %>
      <jsp:include page="productDetail.jsp">
        <jsp:param name="id" value="<%=id%>" />
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

  <form class="productDetails__form" action="<%=request.getContextPath()%>/controller/insertTransactionController.jsp" method="GET">
    <%
      if(hasData) {
    %>
        <div class="productDetails__checkoutBox">
    <%
      } else {
    %>
        <div class="productDetails__checkoutBox hide">
    <%
      }
    %>
      <h4 id="productDetails__itemQty"></h4>
      <div id="productDetails__priceList" class="productDetails__priceList"></div>
      <p class="productDetails__priceTitle">Price:</p>
      <p id="productDetails__price" class="productDetails__price"></p>
      <button class="productDetails__btnCheckout" type="submit">Checkout</button>
    </div>
  </form>
</div>

<script src="<%=request.getContextPath()%>/js/productDetails.js"></script>

<%@include file="../html/footer.html"%>