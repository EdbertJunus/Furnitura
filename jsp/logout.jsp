<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="../db/connect.jsp"%>
<%
    session.removeAttribute("userRole");
    session.removeAttribute("userName");

    response.sendRedirect("../index.jsp");
%>