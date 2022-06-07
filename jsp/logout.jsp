<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/connect.jsp"%>
<%

    // Update User Status in database to not_loggeedin
    Connect con = Connect.getConnection();
    String email = (String)session.getAttribute("userEmail");
    String query = String.format("UPDATE users SET UserStatus = ('%s') WHERE UserEmail = ('%s')", "not_loggedin",email);
    con.executeUpdate(query);

    session.removeAttribute("userRole");
    session.removeAttribute("userName");
    session.removeAttribute("userEmail");
    response.sendRedirect("../index.jsp");
%>