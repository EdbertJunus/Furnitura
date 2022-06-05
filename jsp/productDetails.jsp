<%@include file="header.jsp"%>

<div class="productDetails">
  <%
    query = "SELECT * FROM furniture JOIN mycart ON furniture.FurnitureId = mycart.FurnitureId WHERE mycart.UserId = 1";
    rs = con.executeQuery(query);

    while(rs.next()) {
      String name = rs.getString("FurnitureName");
      String img = rs.getString("FurnitureImage");
      String desc = rs.getString("FurnitureDescription");
      int price = rs.getInt("FurniturePrice");
  %>
      <jsp:include page="productDetail.jsp">
        <jsp:param name="name" value="<%=name%>" />
        <jsp:param name="img" value="<%=img%>" />
        <jsp:param name="desc" value="<%=desc%>" />
        <jsp:param name="price" value="<%=price%>" />
      </jsp:include>
  <%
    }
  %>
</div>

<%@include file="../html/footer.html"%>