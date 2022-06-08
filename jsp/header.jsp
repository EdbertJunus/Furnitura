<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Furnitura</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/transaction.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/product.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/productList.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/productDetails.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/profile.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/change-pwd.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/register.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" />
  </head>
  <body>
    <header>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a id="nav-logo" class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Furnitura</a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/jsp/productList.jsp">Product List</a>
            </li>
          </ul>
          <div class="navbar-text d-flex flex-column flex-lg-row nav-right ">
            <%
                Connect con = Connect.getConnection();
                String query = "SELECT * FROM users";
                ResultSet rs = con.executeQuery(query);
                
                String userRole = (String)session.getAttribute("userRole");
                String userName = (String)session.getAttribute("userName");
                
                if(userRole == null){
            %>
                  <a class="nav-link login-btn" href="<%=request.getContextPath()%>/jsp/login.jsp">
                    <button type="button" class="btn">LOGIN</button>
                  </a>
            <%
                }
                else{
            %>
                <a class="nav-link" href="#" style="pointer-events: none;">
                Hello, <%=userName%>
                </a>
                <a class="nav-link" href="<%=request.getContextPath()%>/jsp/profile.jsp">
                  Account
                </a>
                <% 
                  if(userRole.equals("Member")){
                %>
                  <a class="nav-link" href="<%=request.getContextPath()%>/jsp/productDetails.jsp">
                    View Cart
                  </a>
                <%
                  }
                %>
                <a class="nav-link" href="<%=request.getContextPath()%>/jsp/transaction.jsp">
                  View Transaction
                </a>
                <a class="nav-link" href="<%=request.getContextPath()%>/controller/logoutController.jsp">
                  Logout
                </a>
            <%
                }
            %>
          </div>
        </div>
      </nav>
    </header>
