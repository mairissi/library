package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import library.model.User;
import library.util.ConnectionFactory;

public class UserDAO {
	
	public void addUser(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "insert into accounts (cpf, email, password) values (?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getCpf());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				ConnectionFactory.closeConnection(conn);
		}
	}
	
	public boolean checkUser(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement("select * from accounts where email=? and password=?");
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (conn != null)
				ConnectionFactory.closeConnection(conn);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
