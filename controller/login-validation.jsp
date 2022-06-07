<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>

<%

    // Get Values
    String email = request.getParameter("email");
    String pwd = request.getParameter("password");

    Connect con = Connect.getConnection();
    String query = String.format("SELECT * FROM users WHERE UserEmail = ('%s')", email);
    ResultSet rs = con.executeQuery(query);

    // Validate Email
    // Validate @ and .
    boolean isEmailContainDot = false;
    int countAt = 0;
    boolean isSymbolCorrect = true;
    for (int i = 0 ; i < email.length() ; i++){
        if(email.charAt(i) == '@'){
            countAt++;
            if(i != email.length() - 1 && (email.charAt(i - 1) == '.' || email.charAt(i + 1) == '.')){
                isSymbolCorrect = false;
            }
        }
        else if(email.charAt(i) == '.'){
            isEmailContainDot = true;
        }
    }

    if (email == ""){
        response.sendRedirect("../jsp/login.jsp?err=Email Cannot be Empty!");
    }
    else if(countAt == 0 || isEmailContainDot == false){
        response.sendRedirect("../jsp/login.jsp?err=Email must contain both '@' and '.'");
    }
    else if(countAt > 1){
        response.sendRedirect("../jsp/login.jsp?err=Email can only contain one '@'");
    }
    else if(isSymbolCorrect == false){
        response.sendRedirect("../jsp/login.jsp?err=Email cannot have '@' and '.' side by side");
    }
    else if(rs.next() == false){
        // Check if email is in database
        response.sendRedirect("../jsp/login.jsp?err=Email is not registered!");
    }
    // Validate Password
    else if (pwd == ""){
        response.sendRedirect("../jsp/login.jsp?err=Password Cannot be Empty!");
    }
    else if(rs.getString("UserPassword").equals(pwd) == false){
        // Check if password in database is correct
        response.sendRedirect("../jsp/login.jsp?err=Password Incorrect!");
    }
    else{
        // Change user status in database
        String query_update = String.format("UPDATE users SET UserStatus = ('%s') WHERE UserEmail = ('%s')", "logged_in", email);
        session.setAttribute("userName", rs.getString("UserName"));
        session.setAttribute("userRole", rs.getString("UserRole"));
        session.setAttribute("userEmail", rs.getString("UserEmail"));
        con.executeUpdate(query_update);
        response.sendRedirect("../index.jsp");

    }

%>