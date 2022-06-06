<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
  int id = Integer.parseInt(request.getParameter("id"));

  if(id >= 0) {
    Connect con = Connect.getConnection();

    String query = "DELETE FROM mycart WHERE FurnitureId = " + id;
    con.executeUpdate(query);
    response.sendRedirect("productDetails.jsp");
  } else {
    response.sendRedirect("productDetails.jsp");
  }
%>