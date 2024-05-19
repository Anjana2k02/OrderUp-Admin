package com.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static List<Admin> validate(String email, String password){
		
		ArrayList<Admin> admin = new ArrayList<>();
		
		
		
		
		
		//validate 
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT *FROM admin WHERE email='"+email+"' and password='"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String uad_id = rs.getString(1);
				String uname = rs.getString(2);
				String uemail = rs.getString(3);
				String upass = rs.getString(4);
				
				Admin a = new Admin(uad_id , uname, uemail, upass);
				admin.add(a);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return admin;
		
	}

}
