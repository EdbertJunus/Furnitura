<%@include file="../db/connect.jsp"%>
<%@page import="java.io.*, java.util.Date, javax.servlet.*, java.text.*, java.sql.*, java.util.*"%>

<%
  int userId = (Integer)session.getAttribute("userId");
  String[] qtys = request.getParameterValues("qty");
  String[] totalPrices = request.getParameterValues("totalPrice");

  if(totalPrices == null) {
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
      }

      query = String.format("SELECT * FROM mycart WHERE UserId = %d", userId);
      rs = con.executeQuery(query);

	    Vector<String> queryList = new Vector<String>();
      int index = 0;
      while(rs.next()) {
          queryList.add(String.format("INSERT INTO cart VALUES (%d, %d, %d, %d, %d)", rs.getInt("FurnitureId"), transactionId, userId, Integer.parseInt(qtys[index]), Integer.parseInt(totalPrices[index])));
          index++;
      }

      for(int i = 0; i < queryList.size(); i++) {
        con.executeUpdate(queryList.get(i));
      }

      // Empty Mycart
      query = String.format("DELETE FROM mycart WHERE UserId = %d", userId);
      con.executeUpdate(query);
        
      response.sendRedirect("../jsp/transaction.jsp");
  }
%>