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

                        query = String.format("SELECT f.FurnitureImage, f.FurnitureName, c.CartQuantity, f.FurniturePrice, c.CartTotal FROM furniture f LEFT JOIN cart c ON f.FurnitureId = c.FurnitureId LEFT JOIN transaction t ON t.TransactionId = c.TransactionId WHERE t.TransactionId = ('%s')", transId);
                        rs = con.executeQuery(query);

                        while(rs.next()){
                    %>
                    <tr class="table-item">
                        <td class="image-item">
                            <img src="<%= rs.getString("FurnitureImage")%>" alt="">
                        </td>
                        <td><a href="#"><%= rs.getString("FurnitureName")%></a></td>
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
                <p><b>Total : </b>*30000*</p>
                <form action="../controller/updateTransaction.jsp">
                    <input type="submit" value="Process" class="btn-prime btn-success">
                </form>
            </div>
        </div>
    </section>
<%@ include file="../html/footer.html" %>