<%@page import="java.util.*"%>

<%
  int id = Integer.parseInt(request.getParameter("id"));

  Cookie id_cookie = new Cookie("id_cookie", id + "");
  id_cookie.setMaxAge(24 * 60 * 60);
  response.addCookie(id_cookie);

  out.println(id);
%>