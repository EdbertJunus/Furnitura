<%@include file="../db/connect.jsp"%>
<%@page import="java.io.*, java.util.Date, javax.servlet.*, java.text.*, java.sql.*"%>

<%
  int totalPrice = 1; //Integer.parseInt(request.getParameter("totalPrice"));

  if(totalPrice == 0) {
      response.sendRedirect("productDetails.jsp");
  } else {
      String transactionStatus = "False";

      // Get Date
      Date date = new Date();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String dateNow = sdf.format(date);

      // Insert into DB
      Connect con = Connect.getConnection();
      String query = String.format("INSERT INTO transaction (TransactionDate, TransactionStatus) VALUES ('%s','%s')", dateNow, transactionStatus);
      con.executeUpdate(query);

      query = "SELECT * FROM transaction";
      ResultSet rs = con.executeQuery(query);

      int transactionId = 0;
      if(rs != null) {
        rs.last();
        transactionId = rs.getInt("TransactionId");
        out.println(transactionId);
      }

      Connect con2 = Connect.getConnection();
          String query2 = String.format("SELECT * FROM mycart WHERE UserId = %d", 1);
          ResultSet rs2 = con.executeQuery(query2);

      query2 = "";
      while(rs2.next()) {
          query2 += String.format("INSERT INTO cart VALUES (%d, %d, %d, %d, %d);", rs2.getInt("FurnitureId"), transactionId, 1, 1, totalPrice);
          con2.executeUpdate(query2);
      }
      
      //out.println(query2);

      // response.sendRedirect("../jsp/transaction.jsp") ;
  }
%>