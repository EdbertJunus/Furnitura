<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>
<%@include file="header.jsp" %>
    <section class="content transaction">
        <span class="feature-title">
            <h2>Transactions</h2>
            <hr />
        </span>
        <!-- Testing for insert transaction -> later in cart -->
        <!-- <form action="controller/insertTransactionController.jsp">
            <label for="transactionProcess">Transaction Process: </label>
            <input type="text" name="transactionProcess">
            <input type="submit" value="Insert">
        </form> -->
        <div class="table-wrapper">
            <table class="transaction-table">
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
                    <tr class="table-item">
                        <td><%= rs.getDate("TransactionDate")%></td>
                        <td><%= rs.getString("TransactionStatus")%></td>
                        <td>
                            <a href="transaction-detail.jsp">See Detail</a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </section>

<%@ include file="../html/footer.html" %>