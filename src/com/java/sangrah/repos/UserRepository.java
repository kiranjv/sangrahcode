package com.java.sangrah.repos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.sangrah.models.User;


public class UserRepository {

	public User getUserDetails(String username) {
		Connection conn = LocalDbConfiguration.getConnection();
		String sql = "SELECT * FROM vtiger_users where user_name = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			ResultSet result = pstmt.executeQuery();
			User user = null;
			while (result.next()) {
				user = new User();
				user.setUsername(result.getString("user_name"));
				user.setEncrypted_password(result.getString("user_password"));
				user.setConform_password(result.getString("confirm_password"));
				user.setUser_hash(result.getString("user_hash"));
				user.setAcesskey(result.getString("accesskey"));
				user.setCrypt_type(result.getString("crypt_type"));
				user.setStatus(result.getString("status"));
				System.out.println("User details:" + user.toString());
			}
			return user;
		} catch (SQLException e) {
			System.err.println("Exception while getting user details");
			e.printStackTrace();
			return null;
		}

	}
}
