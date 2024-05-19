package com.admin;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("mail");
        String password = request.getParameter("password");

        Connection con = DBConnect.getConnection();
        try {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM admin WHERE email=? AND password=?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Admin login is successful
                HttpSession session = request.getSession();
                session.setAttribute("loggedInAdminID", rs.getString("ad_id"));
                response.sendRedirect("home.jsp"); // Redirect to the home page
            } else {
                // Invalid login
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                response.sendRedirect("login.jsp");
                out.println("<script>alert('Invalid login credential'); window.location = 'login.jsp';</script>");
                                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
