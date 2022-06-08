<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
  int id = Integer.parseInt(request.getParameter("id"));

  Connect con = Connect.getConnection();

  int userId = (Integer)session.getAttribute("userId");
  String query = String.format("SELECT * FROM mycart WHERE UserId = %d", userId);
  ResultSet rs = con.executeQuery(query);

  int item = 0;

  if(rs.next() == false) {
    query = String.format("INSERT INTO mycart (UserId, FurnitureId) VALUES (%d, %d)", userId, id);
    con.executeUpdate(query);
  } else {
    query = String.format("SELECT * FROM mycart WHERE UserId = %d", userId);
    rs = con.executeQuery(query);

    while(rs.next()) {
      item = rs.getInt("FurnitureId");
      if(item == id) {
        item = 0;
        break;
      }
    }

    if(item != 0) {
      query = String.format("INSERT INTO mycart (UserId, FurnitureId) VALUES (%d, %d)", userId, id);
      con.executeUpdate(query);
    }
  }

  response.sendRedirect("productList.jsp");
%>