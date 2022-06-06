<%@include file="header.jsp" %>

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
                <p>Name Placeholder</p>
                <p>Email Placeholder</p>
                <p>Role Placeholder</p>
            </div>
        </div>
        <button><a href="change-password.jsp?UserId=<%= rs.getInt("UserId")%>">Change Password</a></button>
    </div>

</section>

<%@ include file="../html/footer.html" %>