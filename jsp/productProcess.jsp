<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
  int id = Integer.parseInt(request.getParameter("id"));
  out.println(id);

  Connect con = Connect.getConnection();

  // USERID AKAN DISESUAIKAN NANTI
  String query = "INSERT INTO mycart (UserId, FurnitureId) VALUES (1, " + id + ")";
  con.executeUpdate(query);
  response.sendRedirect("productList.jsp");
%>