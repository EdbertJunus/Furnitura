<%@ page import="java.util.*" %>
<%
    session.removeAttribute("userRole");
    session.removeAttribute("userName");

    response.sendRedirect("../index.jsp");
%>