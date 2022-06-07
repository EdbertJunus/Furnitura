<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%
  int id = Integer.parseInt(request.getParameter("id"));

  Connect con = Connect.getConnection();

  // USERID AKAN DISESUAIKAN NANTI
  String query = String.format("SELECT * FROM mycart WHERE UserId = %d", 1);
  ResultSet rs = con.executeQuery(query);

  int item = 0;

  if(rs.next() == false) {
    query = String.format("INSERT INTO mycart (UserId, FurnitureId) VALUES (1, %d)", id);
    con.executeUpdate(query);
  } else {
    query = String.format("SELECT * FROM mycart WHERE UserId = %d", 1);
    rs = con.executeQuery(query);

    while(rs.next()) {
      item = rs.getInt("FurnitureId");
      if(item == id) {
        item = 0;
        break;
      }
    }

    if(item != 0) {
      query = String.format("INSERT INTO mycart (UserId, FurnitureId) VALUES (1, %d)", id);
      con.executeUpdate(query);
    }
  }
%>