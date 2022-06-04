<%@include file="../connect.jsp"%>
<%@page import="java.io.*, java.util.Date, javax.servlet.*, java.text.*"%>

<%

    // Get Values -> Nanti tinggal update via detail page
    String transactionStatus = "False";
    
    // Get Date
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String dateNow = sdf.format(date);
    
    if(transactionStatus.isEmpty()){
        response.sendRedirect("../transaction.jsp");
    }
    else {
        // Insert to db
        Connect con = Connect.getConnection();
        String query = String.format("INSERT INTO transaction (TransactionDate, TransactionStatus) VALUES ('%s','%s')", dateNow,transactionStatus);
        con.executeUpdate(query);
        response.sendRedirect("../transaction.jsp");
    }
%>