package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import library.model.BlockedUser;
import library.util.ConnectionFactory;

public class BlockedUsersDAO {
	
	public List<BlockedUser> getBlockedUsers() {
		String sql = "SELECT * FROM BLOCKED_USERS";
		List<BlockedUser> users = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				BlockedUser bs = new BlockedUser();
				bs.setCpf(rs.getString("USER_CPF"));
				bs.setBlockReason(rs.getString("REASON"));
				bs.setBlockDate(rs.getLong("BLOCK_DATE"));
				
				users.add(bs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return users;
	}
	
	public boolean isBlocked(String cpf) {
		String sql = "SELECT * FROM BLOCKED_USERS WHERE USER_CPF = ?";		
		Connection conn = null;
		PreparedStatement ps = null;
		
		boolean result = false;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, cpf);
			
			ResultSet rs = ps.executeQuery();
			
			result = rs.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return result;
	}
	
	public void remove(String cpf) {
		String sql = "DELETE FROM BLOCKED_USERS WHERE USER_CPF = ?";		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, cpf);
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public void add(BlockedUser user) {
		String sql = "INSERT INTO BLOCKED_USERS(USER_CPF, REASON, BLOCK_DATE) VALUES (?, ?, ?)";
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement(sql);
			
			int index = 1;
			ps.setString(index++, user.getCpf());
			ps.setString(index++, user.getBlockReason());
			ps.setLong(index++, user.getBlockDate());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
}
