<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, com.admin.DBConnect" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<% 
    HttpSession Session = request.getSession();
    String adminID = (String) session.getAttribute("loggedInAdminID");
    if (adminID == null) {
        response.sendRedirect("login.jsp");
    } else {
        Connection con = DBConnect.getConnection();
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM admin WHERE ad_id = ?");
        stmt.setString(1, adminID);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
            String password = rs.getString("password"); // Retrieve the password
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Details</title>
    <style>
        /* Center-align the content */
        body {
            text-align: center;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        /* Style the "Back to Account" button */
        .btn-back {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-back:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h4>Name : <%= name %></h4>
    <h4>Email: <%= email %></h4>
    <h4>Password: <%= password %></h4>
     <a href="account.jsp" class="btn-back">Back to Account</a>
     
    <!-- You can add more admin details here as needed -->
</body>
</html>

<%
        } else {
            response.sendRedirect("login.jsp");
        }
    }
%>
