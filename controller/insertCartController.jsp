<%@include file="../db/connect.jsp"%>
<%@page import="java.sql.*, java.util.*"%>

<%
  Connect con2 = Connect.getConnection();
  String query = String.format("SELECT * FROM mycart WHERE UserId = %d", 1);
  ResultSet rs2 = con2.executeQuery(query);
  
  int transactionId = (Integer)session.getAttribute("transactionId");

  while(rs2.next()) {
    query = String.format("INSERT INTO cart VALUES (%d %d %d %d %d)", rs2.getInt("FurnitureId"), transactionId, 1, 1, 100000);

    con2.executeUpdate(query);
  }

  response.sendRedirect("../jsp/transaction.jsp");
%>