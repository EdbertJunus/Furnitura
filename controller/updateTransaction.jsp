<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
    String transId = request.getParameter("TransactionId");
    Connect con = Connect.getConnection();
    String query_update = String.format("UPDATE transaction SET TransactionStatus = ('%s') WHERE TransactionId = ('%s')", "True", transId);
    con.executeUpdate(query_update);
    response.sendRedirect("../jsp/transaction.jsp");
%>