<%@include file="header.jsp" %>
<%@include file="../controller/loginSessionController.jsp" %>
<section class="content profile">
    <!-- Profile Title -->
    <span class="feature-title">
        <h2>Profile</h2>
        <hr />
      </span>
    
    <div class="temp-container">
        <div class="profile-container">
            <div class="profile-content-title">
                <p>Name</p>
                <p>Email</p>
                <p>Role</p>
            </div>
            <div class="profile-content">
                <%
                    String email = (String)session.getAttribute("userEmail");
                    String query_select = String.format("SELECT * FROM users WHERE UserEmail = ('%s')", email);
                    rs = con.executeQuery(query_select);
    
                    while(rs.next()){
                %>
                <p><%= rs.getString("UserName")%></p>
                <p><%= rs.getString("UserEmail")%></p>
                <p><%= rs.getString("UserRole")%></p>
                <%
                    }
                %>
            </div>
        </div>
        <button><a href="changePassword.jsp">Change Password</a></button>
    </div>

</section>

<%@ include file="../html/footer.html" %>