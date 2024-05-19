package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/acceptRejectServlet")
public class AcceptRejectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String licenseId = request.getParameter("licenseId");

        if (action != null && licenseId != null) {
            if (action.equals("Accept")) {
                // Insert data into verified_driver
                insertIntoVerifiedDriver(licenseId);

                // Delete the record from driver_licens
                deleteRecordFromDriverLicens(licenseId);
            } else if (action.equals("Reject")) {
                // Delete the record from driver_licens
                deleteRecordFromDriverLicens(licenseId);
            }

            // Redirect to a success page or perform other actions
            response.sendRedirect("licenseRequest.jsp");
        }
    }

    private void insertIntoVerifiedDriver(String licenseId) {
        try {
            Connection con = DBConnect.getConnection();

            // Copy the record from driver_licens to verified_driver
            PreparedStatement copyStmt = con.prepareStatement("INSERT INTO verified_driver (driver_id, name, email, location, password) " +
                    "SELECT driver_id, driver_name, driver_email, driver_location, driver_password FROM driver_licens WHERE licens_id = ?");
            copyStmt.setString(1, licenseId);
            copyStmt.executeUpdate();

            copyStmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteRecordFromDriverLicens(String licenseId) {
        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement deleteStmt = con.prepareStatement("DELETE FROM driver_licens WHERE licens_id = ?");
            deleteStmt.setString(1, licenseId);
            deleteStmt.executeUpdate();
            deleteStmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
