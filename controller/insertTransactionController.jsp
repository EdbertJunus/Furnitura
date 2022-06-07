<%@include file="../db/connect.jsp"%>
<%@page import="java.io.*, java.util.Date, javax.servlet.*, java.text.*, java.sql.*, java.util.*"%>

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

      query = String.format("SELECT * FROM mycart WHERE UserId = %d", 1);
      rs = con.executeQuery(query);

	  Vector<String> queryList = new Vector<String>();
      while(rs.next()) {
          queryList.add(String.format("INSERT INTO cart VALUES (%d, %d, %d, %d, %d)", rs.getInt("FurnitureId"), transactionId, 1, 1, totalPrice));
      }

	  for(int i = 0; i < queryList.size(); i++) {
		  con.executeUpdate(queryList.get(i));
	  }

	  // Empty Mycart
	  query = String.format("DELETE FROM mycart WHERE UserId = %d", 1);
	  con.executeUpdate(query);
      
      response.sendRedirect("../jsp/transaction.jsp");
  }
%>