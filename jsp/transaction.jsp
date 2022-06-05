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
                        //Header already has below variable, so just reuse
                        //Connect con = Connect.getConnection();
                        query = "SELECT * FROM transaction";
                        rs = con.executeQuery(query);
    
                        while(rs.next()){
                    %>
                    <tr class="table-item">
                        <td><%= rs.getDate("TransactionDate")%></td>
                        <td><%= rs.getString("TransactionStatus")%></td>
                        <td>
                            <a href="transaction-detail.jsp?TransactionId=<%= rs.getInt("TransactionId")%>">See Detail</a>
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