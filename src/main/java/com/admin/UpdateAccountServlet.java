package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String adminID = (String) session.getAttribute("loggedInAdminID");

        if (adminID == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String newName = request.getParameter("username");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword)) {
            Connection con = DBConnect.getConnection();
            try {
                PreparedStatement stmt = con.prepareStatement("UPDATE admin SET name=?, password=? WHERE ad_id=?");
                stmt.setString(1, newName);
                stmt.setString(2, newPassword);
                stmt.setString(3, adminID);
                stmt.executeUpdate();
                response.sendRedirect("data.jsp"); // Redirect to the user profile page
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Password does not match'); window.location = 'data.jsp';</script>");
        }
    }
}
