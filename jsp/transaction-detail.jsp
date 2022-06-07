<%@include file="header.jsp" %>
<section class="content transaction transaction-detail">
        <span class="feature-title">
            <h2>Transactions Detail</h2>
            <hr />
        </span>
        <div class="table-wrapper">
            <table class="transaction-table">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String transId = request.getParameter("TransactionId");
                        String userId, furnitureId;

                        query = String.format("SELECT * FROM furniture f LEFT JOIN cart c ON f.FurnitureId = c.FurnitureId LEFT JOIN transaction t ON t.TransactionId = c.TransactionId WHERE t.TransactionId = ('%s')", transId);
                        rs = con.executeQuery(query);

                        int grandTotal = 0;
                        int transactionId = 0;
                        String transStatus = "";
                        while(rs.next()){
                            grandTotal += rs.getInt("CartTotal");
                            transactionId = rs.getInt("TransactionId");
                            transStatus = rs.getString("TransactionStatus");
                    %>
                    <tr class="table-item">
                        <td class="image-item">
                            <img src="<%= rs.getString("FurnitureImage")%>" alt="">
                        </td>
                        <td><b><%= rs.getString("FurnitureName")%></b></td>
                        <td><%= rs.getInt("CartQuantity")%></td>
                        <td><%= rs.getInt("FurniturePrice")%></td>
                        <td><%= rs.getInt("CartTotal")%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="total-price">
                <%
                    if(transStatus.equals("False")){
                        %>
                        <p><b>Total : </b><%= grandTotal%></p>
                        <a href="../controller/updateTransaction.jsp?TransactionId=<%= transactionId%>" class="btn-prime btn-success">Process</a>
                        <%
                    }
                    else if(transStatus.equals("True")){
                        %>
                        <p><b>Total : </b><%= grandTotal%></p>
                        <%
                    }
                %>
            </div>
        </div>
    </section>
<%@ include file="../html/footer.html" %>