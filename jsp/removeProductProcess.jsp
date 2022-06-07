<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
  int userId = (Integer)session.getAttribute("userId");
  int id = Integer.parseInt(request.getParameter("id"));

  if(id >= 0) {
    Connect con = Connect.getConnection();

    String query = String.format("DELETE FROM mycart WHERE UserId = %d AND FurnitureId = %d", userId, id);
    con.executeUpdate(query);

    response.sendRedirect("productDetails.jsp");
  } else {
    response.sendRedirect("productDetails.jsp");
  }
%>