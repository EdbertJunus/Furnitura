<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
  int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
  if(totalPrice == 0) {
    response.sendRedirect("productDetails.jsp");
  }
  else {
    Connect con = Connect.getConnection();

    // USERID AKAN DISESUAIKAN NANTI
    String query = "DELETE FROM mycart WHERE UserId = 1";

    query = "DELETE FROM mycart WHERE UserId = 1";
    con.executeUpdate(query);

    response.sendRedirect("transaction.jsp");
  }
%>