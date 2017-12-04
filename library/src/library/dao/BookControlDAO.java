package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import library.model.BookControl;
import library.util.ConnectionFactory;

public class BookControlDAO {
	
	private final int BORROW_LIMIT = 8;
	private final int RENEW_LIMIT = 3;
	
	private Connection connection;
	private PreparedStatement preparedStatement;
			
	public boolean add(BookControl control) {
		try {
			String sql = "INSERT INTO BOOK_CONTROL(BOOK_ISBN, BOOK_CODE, USER_CPF, EXPIRE_DATE, RENEWAL_NUMBER) VALUES (?, ?, ?, ?, ?);";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			int index = 1;
			preparedStatement.setInt(index++, control.getIsbn());
			preparedStatement.setInt(index++, control.getCode());
			preparedStatement.setString(index++, control.getUserCpf());
			preparedStatement.setLong(index++, control.getExpireDate());
			preparedStatement.setInt(index++, control.getRenewalNumber());
			
			preparedStatement.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			
			return false;
		} finally {
			if (connection != null) {
				ConnectionFactory.closeConnection(connection);
			}
		}
	}
	
	public boolean update(BookControl control) {
		try {
			String sql = "UPDATE BOOK_CONTROL SET EXPIRE_DATE = ?, RENEWAL_NUMBER = ? WHERE BOOK_ISBN = ? AND BOOK_CODE = ? AND USER_CPF = ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			int index = 1;
			preparedStatement.setLong(index++, control.getExpireDate());
			preparedStatement.setInt(index++, control.getRenewalNumber());
			preparedStatement.setInt(index++, control.getIsbn());
			preparedStatement.setInt(index++, control.getCode());
			preparedStatement.setString(index++, control.getUserCpf());
			
			preparedStatement.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			
			return false;
		} finally {
			if (connection != null) {
				ConnectionFactory.closeConnection(connection);
			}
		}
	}
	
	public boolean remove(BookControl control) {
		try {
			String sql = "DELETE FROM BOOK_CONTROL WHERE BOOK_ISBN = ? AND BOOK_CODE = ? AND USER_CPF = ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			int index = 1;
			preparedStatement.setInt(index++, control.getIsbn());
			preparedStatement.setInt(index++, control.getCode());
			preparedStatement.setString(index++, control.getUserCpf());
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;			
		} finally {
			if (connection != null) {
				ConnectionFactory.closeConnection(connection);
			}
		}
	}
	
	public boolean canBorrow(String cpf) {
		int bookCount = getBookCount(cpf);
		return (bookCount > -1) && (bookCount <= BORROW_LIMIT);
	}
	
	public boolean canRenewBook(String cpf, int isbn, int code) {
		int renewalNumber = getRenewalNumber(isbn, code, cpf);
		return (renewalNumber > -1) && (renewalNumber <= RENEW_LIMIT);
	}
	
	public int getBookCount(String cpf) {
		try {
			String sql = "SELECT COUNT(*) FROM BOOK_CONTROL WHERE USER_CPF = ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
						
			int index = 1;
			preparedStatement.setString(index++, cpf);
			
			ResultSet result =  preparedStatement.executeQuery();
			
			if (result.first()) {
				return result.getInt(0);
			}
			
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;			
		} finally {
			if (connection != null) {
				ConnectionFactory.closeConnection(connection);
			}
		}
	}
	
	public int getRenewalNumber(int isbn, int code, String cpf) {
		try {
			String sql = "SELECT * FROM BOOK_CONTROL WHERE BOOK_ISBN = ? AND BOOK_CODE = ? AND USER_CPF = ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
						
			int index = 1;
			preparedStatement.setInt(index++, isbn);
			preparedStatement.setInt(index++, code);
			preparedStatement.setString(index++, cpf);
			
			ResultSet result =  preparedStatement.executeQuery();
			
			if (result.first()) {
				return result.getInt("RENEWAL_NUMBER");
			}
			
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;			
		} finally {
			if (connection != null) {
				ConnectionFactory.closeConnection(connection);
			}
		}
	}
	
//	try {
//		String sql = "DELETE FROM BOOK_CONTROL WHERE BOOK_ISBN = ? AND BOOK_CODE = ? AND USER_CPF = ?";
//		
//		connection = ConnectionFactory.getConnection();
//		preparedStatement = connection.prepareStatement(sql);
//		
//		int index = 1;
//		
//		return true;
//	} catch (SQLException e) {
//		e.printStackTrace();
//		return false;			
//	} finally {
//		if (connection != null) {
//			ConnectionFactory.closeConnection(connection);
//		}
//	}
}
