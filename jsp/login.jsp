<%@ include file="header.jsp" %>

<section class="content login">
    <!-- Login Title -->
    <span class="feature-title">
        <h2>Login</h2>
        <hr />
      </span>
    
    <!-- Login -->
    <form action="../controller/login-validation.jsp" method="post" name="LoginForm">
        <div class="login-container">

            <!-- Email -->
            <div class="login-content">
                <label for="email">Email:</label>
                <input type="text" name="email" id="" placeholder="Email">
            </div>

            <!-- Password -->
            <div class="login-content">
                <label for="password">Password:</label>
                <input type="password" name="password" id="" placeholder="Password">
            </div>

            <!-- Button Login -->
            <div class="login-content">
                <button type="submit">Login</button>
            </div>

            <!-- Redirect to register -->
            <a href="register.jsp" id="redirect-register">Don't have account? Register!</a>
        </div>
    </form>
    <%
        if (request.getParameter("err") != null){
            out.println("<br><span style='color:red; font-size: 14px;'>" + request.getParameter("err") + "</span>");
        }
    %>

</section>

<%@ include file="../html/footer.html" %>
