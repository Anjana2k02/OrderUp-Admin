<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Up</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS for the food-themed background and navigation bar -->
    <style>
        body {
            background-image: url('images/e.jpg'); /* Replace with your food-themed image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: limegreen; /* Font color in luminous green */
        }
        .navbar {
            background-color: black; /* Black navigation bar */
        }
        
        h2 {
        	color : "black";
        	https://kinsta.com/blog/best-google-fonts/#5-oswaldhttps://kinsta.com/blog/best-google-fonts/#5-oswald;
        	font-family: kanista;
        
        }
    </style>
    <style>
    	/* Define a dark background color for the page */
body {
    background-color: #233142;
    color: #233142;
}

/* Style the table */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    background-color: #222;
    color: #fff;
    border: 1px solid #444;
}

/* Style the table headers */
table th {
    background-color: #111;
    color: #fff;
    padding: 10px;
}

/* Style the table rows */
table tr {
    border-bottom: 1px solid #444;
}

/* Style the table data cells */
table td {
    padding: 10px;
}

/* Style buttons */
input[value="Accept"] {
    background-color: #03C03C;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Change button color on hover */
input[value="Accept"]:hover {
    background-color: #00693E;
}
/* Style buttons */
input[value="Reject"] {
    background-color: #FF4500;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[value="Reject"]:hover {
    background-color: #8B0000;
}

/* Add some margin to the buttons */
table td input[type="submit"] {
    margin: 5px;
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
                <li class="nav-item active">
                    <a class="nav-link" href="licenseRequest.jsp">License Request</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="manageAccount.jsp">Manage Account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="account.jsp">My Account</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Content goes here -->
    <h1>Pending Driver License</h1>
    
    
    <table border="1">
        <tr>
            <th>License ID</th>
            <th>Driver ID</th>
            <th>Details</th>
            <th>Date</th>
            <th>Action</th>
        </tr>
        <%
            Connection con = com.admin.DBConnect.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM driver_licens");

            while (rs.next()) {
                String licenseId = rs.getString("licens_id");
                String driverId = rs.getString("driver_id");
                String details = rs.getString("details");
                Date date = rs.getDate("date");
        %>
        <tr>
            <td><%= licenseId %></td>
            <td><%= driverId %></td>
            <td><%= details %></td>
            <td><%= date %></td>
            <td>
                <form action="acceptRejectServlet" method="post">
                    <input type="hidden" name="licenseId" value="<%= licenseId %>">
                    <input type="submit" name="action" value="Accept">
                    <input type="submit" name="action" value="Reject">
                </form>
            </td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
    
    <!-- Include Bootstrap JS and jQuery for Bootstrap functionality -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
