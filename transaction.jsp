<%@page import="java.sql.*"%>
<%@include file="connect.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>transaction</title>
</head>
<body>
    <!-- Testing for insert transaction -> later in cart -->
    <form action="controller/insertTransactionController.jsp">
        <label for="transactionProcess">Transaction Process: </label>
        <input type="text" name="transactionProcess">
        <input type="submit" value="Insert">
    </form>
    <table>
        <thead>
            <tr>
                <th>Transaction Date</th>
                <th>Transaction Process</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connect con = Connect.getConnection();
                String query = "SELECT * FROM transaction";
                ResultSet rs = con.executeQuery(query);

                while(rs.next()){
            %>
            <tr>
                <td><%= rs.getDate("TransactionDate")%></td>
                <td><%= rs.getString("TransactionStatus")%></td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</body>
</html>