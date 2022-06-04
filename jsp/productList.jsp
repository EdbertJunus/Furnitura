<%@page import="java.sql.*"%> <%@include file="header.jsp" %> <%@include
file="../db/connect.jsp"%>

<div class="productList">
<<<<<<< Updated upstream
  <% Connect con = Connect.getConnection(); String query = "SELECT * FROM
  furniture"; ResultSet rs = con.executeQuery(query); while(rs.next()) { String
  name = rs.getString("FurnitureName"); String img =
  rs.getString("FurnitureImage"); String desc =
  rs.getString("FurnitureDescription"); int price = rs.getInt("FurniturePrice");
  %>
  <jsp:include page="product.jsp">
    <jsp:param name="img" value="<%=img%>" />
    <jsp:param name="name" value="<%=name%>" />
    <jsp:param name="desc" value="<%=desc%>" />
    <jsp:param name="price" value="<%=price%>" />
  </jsp:include>
=======
  <%
    con = Connect.getConnection();
    query = "SELECT * FROM furniture";
    rs = con.executeQuery(query);
    while(rs.next()) {
      int id = rs.getInt("FurnitureId");
      String name = rs.getString("FurnitureName");
      String img = rs.getString("FurnitureImage");
      String desc = rs.getString("FurnitureDescription");
      int price = rs.getInt("FurniturePrice");
  %>
    <jsp:include page="product.jsp">
      <jsp:param name="id" value="<%=id%>" />
      <jsp:param name="img" value="<%=img%>" />
      <jsp:param name="name" value="<%=name%>" />
      <jsp:param name="desc" value="<%=desc%>" />
      <jsp:param name="price" value="<%=price%>" />
    </jsp:include>
>>>>>>> Stashed changes
  <% } %>
</div>

<%@ include file="../html/footer.html" %>
