package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import library.model.User;
import library.util.ConnectionFactory;

public class UserDAO {
	
	public static void addUser(User user) throws SQLIntegrityConstraintViolationException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "insert into accounts (cpf, name, email, password, tel, cep, street, address_number, district, city, state, role)"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getCpf());
			ps.setString(2, user.getName());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getTel());
			ps.setString(6, user.getCep());
			ps.setString(7, user.getStreet());
			ps.setString(8, user.getNumber());
			ps.setString(9, user.getDistrict());
			ps.setString(10, user.getCity());
			ps.setString(11, user.getState());
			ps.setString(12, user.getRole());
			ps.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException sqle){
			throw sqle;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static User getUser(String email) {
		String sql = "SELECT * FROM ACCOUNTS WHERE EMAIL = ?";
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				User user = new User();
				user.setCpf(rs.getString("CPF"));
				user.setEmail(email);
				user.setName(rs.getString("NAME"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setTel(rs.getString("TEL"));
				user.setCep(rs.getString("CEP"));
				user.setStreet(rs.getString("STREET"));
				user.setNumber(rs.getString("ADDRESS_NUMBER"));
				user.setDistrict(rs.getString("DISTRICT"));
				user.setCity(rs.getString("CITY"));
				user.setState(rs.getString("STATE"));
				user.setRole(rs.getString("ROLE"));
				
				return user;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return null;
	}
	
	public static int checkUser(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement("select role from accounts where email=? and password=?");
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			if (conn != null)
				ConnectionFactory.closeConnection(conn);
		}
		
	}	

}
