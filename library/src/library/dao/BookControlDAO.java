package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import library.model.Book;
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
			ConnectionFactory.closeConnection(connection);
		}
	}
	
	public String getCpf(Book book) {
		
		System.out.println(book.getIsbn() + " " + book.getCode());
		
		try {
			   String sql = "SELECT * FROM BOOK_CONTROL WHERE BOOK_ISBN = ? AND BOOK_CODE = ?";
			   
			   connection = ConnectionFactory.getConnection();
			    preparedStatement = connection.prepareStatement(sql);
			    
			    int index = 1;
			    preparedStatement.setInt(index++, book.getIsbn());
			    preparedStatement.setInt(index++, book.getCode());
			    
			    ResultSet result =  preparedStatement.executeQuery();
			    if (result.next()) {
			     return result.getString("USER_CPF");
			    }
			   
			  } catch (SQLException e) {
			   e.printStackTrace();
			  } finally {
			   ConnectionFactory.closeConnection(connection);
			  }
		return null;
		
	}
	
	public ArrayList<BookControl> getBooks(List<Book> books) {
		  ArrayList<BookControl> controls = new ArrayList<>();
		  
		  
		  try {
		   String sql = "SELECT * FROM BOOK_CONTROL WHERE BOOK_ISBN = ? AND BOOK_CODE = ?";
		   
		   connection = ConnectionFactory.getConnection();
		   
		   for (Book book : books) {
		    preparedStatement = connection.prepareStatement(sql);
		    
		    int index = 1;
		    preparedStatement.setInt(index++, book.getIsbn());
		    preparedStatement.setInt(index++, book.getCode());
		    
		    ResultSet result =  preparedStatement.executeQuery();
		    if (result.next()) {
		     BookControl control = new BookControl();
		     control.setCode(result.getInt("BOOK_CODE"));
		     control.setIsbn(result.getInt("BOOK_ISBN"));
		     control.setUserCpf(result.getString("USER_CPF"));
		     control.setRenewalNumber(result.getInt("RENEWAL_NUMBER"));
		     control.setExpireDate(result.getLong("EXPIRE_DATE"));
		     
		     controls.add(control);
		    }
		   }
		   
		  } catch (SQLException e) {
		   e.printStackTrace();
		  } finally {
		   ConnectionFactory.closeConnection(connection);
		  }
		  
		  return controls;
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
			ConnectionFactory.closeConnection(connection);
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
			ConnectionFactory.closeConnection(connection);
		}
	}
	
	public boolean canBorrow(String cpf) {
		int bookCount = getBookCount(cpf);
		return (bookCount > -1) && (bookCount < BORROW_LIMIT);
	}
	
	public boolean canRenewBook(String cpf, int isbn, int code) {
		int renewalNumber = getRenewalNumber(isbn, code, cpf);
		return (renewalNumber > -1) && (renewalNumber < RENEW_LIMIT);
	}
	
	public int getBookCount(String cpf) {
		try {
			String sql = "SELECT COUNT(*) FROM BOOK_CONTROL WHERE USER_CPF = ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
						
			int index = 1;
			preparedStatement.setString(index++, cpf);
			
			ResultSet result =  preparedStatement.executeQuery();
			
			if (result.next()) {
				return result.getInt(1);
			}
			
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;			
		} finally {
			ConnectionFactory.closeConnection(connection);
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
			
			if (result.next()) {
				return result.getInt("RENEWAL_NUMBER");
			}
			
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;			
		} finally {
			ConnectionFactory.closeConnection(connection);
		}
	}
	
	public List<BookControl> getExpired() {
		List<BookControl> books = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM BOOK_CONTROL WHERE EXPIRE_DATE < ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setLong(1, getLimitOfToday());
			
			ResultSet result =  preparedStatement.executeQuery();
			
			while (result.next()) {
				BookControl book = new BookControl();
				book.setCode(result.getInt("BOOK_CODE"));
				book.setIsbn(result.getInt("BOOK_ISBN"));
				book.setUserCpf(result.getString("USER_CPF"));
				book.setRenewalNumber(result.getInt("RENEWAL_NUMBER"));
				book.setExpireDate(result.getLong("EXPIRE_DATE"));
				
				books.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(connection);
		}
		
		return books;
	}
	
	private long getLimitOfToday() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		
		return calendar.getTimeInMillis();
	}

	public ArrayList<BookControl> getBooksFromUser(String cpf) {
		ArrayList<BookControl> books = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM BOOK_CONTROL WHERE USER_CPF = ?";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
									
			int index = 1;
			preparedStatement.setString(index++, cpf);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				BookControl book = new BookControl();
				book.setIsbn(rs.getInt("BOOK_ISBN"));
				book.setCode(rs.getInt("BOOK_CODE"));
				book.setUserCpf(cpf);
				book.setExpireDate(rs.getLong("EXPIRE_DATE"));
				book.setRenewalNumber(rs.getInt("RENEWAL_NUMBER"));
				
				books.add(book);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				ConnectionFactory.closeConnection(connection);
			}
		}
		
		return books;
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
