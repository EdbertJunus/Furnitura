<%

    // Get Values
    String old_pwd = request.getParameter("old-password");
    String new_pwd = request.getParameter("new-password");
    String pwd_confirm = request.getParameter("confirm-password");

    String ALPHABET_REGEX = "^[a-zA-Z]+$";
    String NUMBER_REGEX = "^[0-9]+$";

    // Validate
    if(old_pwd == ""){
        response.sendRedirect("change-password.jsp?err=Old Password Cannot be Empty!");
    }
    // Must match with current user password -> check database

    else if(new_pwd == ""){
        response.sendRedirect("change-password.jsp?err=New Password Cannot be Empty!");
    }
    else if(new_pwd.length() < 6){
        response.sendRedirect("change-password.jsp?err=New Password must be at least 6 characters!");
    }
    else if(new_pwd.matches(ALPHABET_REGEX) || new_pwd.matches(NUMBER_REGEX)){
        response.sendRedirect("change-password.jsp?err=New Password must contain both alphabet and number!");
    }
    else if(!pwd_confirm.equals(new_pwd)){
        response.sendRedirect("change-password.jsp?err=Confirm password does not match new password!");
    }

    // Update DB lalu redirect balik ke profile
%>