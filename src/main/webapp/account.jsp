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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Up</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include your custom CSS file if needed -->
    <link rel="stylesheet" type="text/css" href="styles.css">
    <!-- Custom CSS for the food-themed background and navigation bar -->
    <style>
        body {
            background-image: url('images/f.jpg'); /* Replace with your food-themed image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: limegreen; /* Font color in luminous green */
        }
        .navbar {
            background-color: black; /* Black navigation bar */
        }
        .custom-container {
            width: 440px;
            height: 1080px;
            margin: 0 auto;
            padding: 30px;
            background: transparent;
          
        }
        button{
        	margin-top : 20px;
        	
        }
        button[id="logoutButton"]{
        	height : 40px;
        	width : 85px;
        	radius : 7px;
        	margin-left: auto;
        	margin-right: 10px;
        	margin-top: 5px;
        	}
        
        button.native{
        	margin-top : 20px;
        }
    </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">Order Up</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="licenseRequest.jsp">License Request</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manageAccount.jsp">Manage Account</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="account.jsp">My Account</a>
            </li>
            
        </ul>
    </div>
</nav>
<div class="navbar-nav ml-auto">
    <a class="btn btn-danger btn-sm" href="logout">Log Out</a>

</div>


    <!-- Content goes here -->
    
     <div class="container mt-5 custom-container">
        <h2>Edit User Profile</h2>
        <form style="background: transparent" action = "UpdateProfileServlet" method = "post" >
            <div class="form-group">
                <label for="username">Name</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="<%= name %>">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="New password">
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm password">
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
    </div>
    
   <%
        } else {
            response.sendRedirect("login.jsp");
        }
    }
%> 
    
    
    <script>
function validateForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
        alert("Password does not match!");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
