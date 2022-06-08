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
                        String email = (String)session.getAttribute("userEmail");
                        query = String.format("SELECT t.TransactionId, t.TransactionDate, t.TransactionStatus FROM transaction t LEFT JOIN cart c ON t.TransactionId = c.TransactionId LEFT JOIN users u ON c.UserId = u.UserId WHERE u.UserEmail = ('%s')", email);
                        rs = con.executeQuery(query);

                        int transId = 0;
                        while(rs.next()){
                            if(transId == rs.getInt("TransactionId")){
                                continue;
                            }
                            else{
                    %>
                            <tr class="table-item">
                                <td><%= rs.getDate("TransactionDate")%></td>
                                <td><%= rs.getString("TransactionStatus")%></td>
                                <td>
                                    <a href="transactionDetail.jsp?TransactionId=<%= rs.getInt("TransactionId")%>">See Detail</a>
                                </td>
                            </tr>
                    <%
                            transId = rs.getInt("TransactionId");
                            
                        }
                    }
                    %>
                </tbody>
            </table>
        </div>
    </section>

<%@ include file="../html/footer.html" %>