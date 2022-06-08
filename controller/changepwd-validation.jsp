<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@include file="../db/connect.jsp"%>
<%

    // Get Values
    String old_pwd = request.getParameter("old-password");
    String new_pwd = request.getParameter("new-password");
    String pwd_confirm = request.getParameter("confirm-password");

    String ALPHABET_REGEX = "^[a-zA-Z]+$";
    String NUMBER_REGEX = "^[0-9]+$";

    Connect con = Connect.getConnection();
    String email = (String)session.getAttribute("userEmail");
    String query = String.format("SELECT * FROM users WHERE UserEmail = ('%s')", email);
    ResultSet rs = con.executeQuery(query);

    String curr_pwd = "";

    while(rs.next()){
        curr_pwd = rs.getString("UserPassword");
    }
    // Validate
    if(old_pwd.equals("")){
        response.sendRedirect("../jsp/changePassword.jsp?err=Old Password Cannot be Empty!");
    }
    // Must match with current user password -> check database
    else if(!curr_pwd.equals(old_pwd)){
        // Check if password in database is correct
        response.sendRedirect("../jsp/changePassword.jsp?err=Old Password Incorrect!");
    }
    else if(new_pwd == ""){
        response.sendRedirect("../jsp/changePassword.jsp?err=New Password Cannot be Empty!");
    }
    else if(new_pwd.length() < 6){
        response.sendRedirect("../jsp/changePassword.jsp?err=New Password must be at least 6 characters!");
    }
    else if(new_pwd.matches(ALPHABET_REGEX) || new_pwd.matches(NUMBER_REGEX)){
        response.sendRedirect("../jsp/changePassword.jsp?err=New Password must contain both alphabet and number!");
    }
    else if(!pwd_confirm.equals(new_pwd)){
        response.sendRedirect("../jsp/changePassword.jsp?err=Confirm password does not match new password!");
    }
    else{
        // Update DB lalu redirect balik ke profile
        String query_update = String.format("UPDATE users SET UserPassword = ('%s') WHERE UserEmail = ('%s')", new_pwd, email);
        con.executeUpdate(query_update);
        // Check send Redirect not working
        response.sendRedirect("../jsp/profile.jsp");
    }
%>