package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import library.enums.BookEnum;
import library.enums.BookStatus;
import library.model.Book;
import library.model.BookControl;
import library.util.ConnectionFactory;

public class BookDAO {
	
	static Connection conn = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;
	
	public static boolean addBook(Book book, int status) {
		try {
			int code = getLastCode(book.getIsbn()) + 1;
			
			conn = ConnectionFactory.getConnection();
			String sql = "insert into book (isbn, code, title, author, publisher, description, IMG_URL, STATUS_ID, cpf) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			ps = conn.prepareStatement(sql);
			
			int index = 1;
			ps.setInt(index++, book.getIsbn());
			ps.setInt(index++, code);
			ps.setString(index++, book.getTitle());
			ps.setString(index++, book.getAuthor());
			ps.setString(index++, book.getPublisher());
			ps.setString(index++, book.getDescription());
			ps.setString(index++, book.getImgUrl());
			ps.setInt(index++, status);
			ps.setString(index++, book.getCpf());
			
			ps.executeUpdate();		
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();			
			return false;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static ArrayList<Book> getBooks() {
		return getBooks(2);
	}
	
	public static ArrayList<Book> getBooks(int status) {
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement("select * from book where STATUS_ID = ? order by lower(TITLE)");
			ps.setInt(1, status);
			rs = ps.executeQuery();
			ArrayList<Book> listBook = new ArrayList<Book>();
			
			while(rs.next()) {
				Book book = new Book();
				
				book.setIsbn(rs.getInt(BookEnum.ISBN.header()));
				book.setTitle(rs.getString(BookEnum.TITLE.header()));
				book.setAuthor(rs.getString(BookEnum.AUTHOR.header()));
				book.setPublisher(rs.getString(BookEnum.PUBLISHER.header()));
				book.setDescription(rs.getString(BookEnum.DESCRIPTION.header()));
				book.setImgUrl(rs.getString(BookEnum.IMG_URL.header()));
				book.setStatus(rs.getInt(BookEnum.STATUS_ID.header()));
				book.setCpf(rs.getString(BookEnum.CPF.header()));
				
				listBook.add(book);
			}
			
			return listBook;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static ArrayList<Book> getBooksFromControls(List<BookControl> controls) {
		ArrayList<Book> books = new ArrayList<>();
		try {
			String sql = "SELECT * FROM BOOK WHERE ISBN = ? AND CODE = ?";
			conn = ConnectionFactory.getConnection();
			
			for (BookControl control : controls) {
				ps = conn.prepareStatement(sql);
				
				int index = 1;
				ps.setInt(index++, control.getIsbn());
				ps.setInt(index++, control.getCode());
				
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					Book book = new Book();
					book.setIsbn(control.getIsbn());
					book.setCode(control.getCode());
					book.setAuthor(rs.getString("AUTHOR"));
					book.setTitle(rs.getString("TITLE"));
					book.setPublisher(rs.getString("PUBLISHER"));
					book.setDescription(rs.getString("DESCRIPTION"));
					book.setImgUrl(rs.getString("IMG_URL"));
					book.setStatus(rs.getInt("STATUS_ID"));
					book.setCpf(control.getUserCpf());
					
					books.add(book);
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();		
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return books;
	}
	
	public static ArrayList<Book> getBookByCPF(String cpf){
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement("select * from book where cpf = ?");
			ps.setString(1, cpf);
			rs = ps.executeQuery();
			ArrayList<Book> listBook = new ArrayList<Book>();
			
			while(rs.next()) {
				Book book = new Book();
				
				book.setIsbn(rs.getInt(BookEnum.ISBN.header()));
				book.setTitle(rs.getString(BookEnum.TITLE.header()));
				book.setAuthor(rs.getString(BookEnum.AUTHOR.header()));
				book.setPublisher(rs.getString(BookEnum.PUBLISHER.header()));
				book.setDescription(rs.getString(BookEnum.DESCRIPTION.header()));
				book.setImgUrl(rs.getString(BookEnum.IMG_URL.header()));
				book.setStatus(rs.getInt(BookEnum.STATUS_ID.header()));
				book.setCpf(rs.getString(BookEnum.CPF.header()));
				
				listBook.add(book);
			}
			
			return listBook;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static ArrayList<Book> getBooksFromUser(String cpf) {
		BookControlDAO controlDAO = new BookControlDAO();
		List<BookControl> bookControlList = controlDAO.getBooksFromUser(cpf);
		return getBooksFromControls(bookControlList);	
	}
	
	public static Book getBook(int isbn) {
		try {
			conn = ConnectionFactory.getConnection();
			ps = conn.prepareStatement("select * from book where isbn = ?");
			ps.setInt(1, isbn);
			rs = ps.executeQuery();
			
			Book book = new Book();
			
			while(rs.next()) {				
				book.setIsbn(rs.getInt(BookEnum.ISBN.header()));
				book.setTitle(rs.getString(BookEnum.TITLE.header()));
				book.setAuthor(rs.getString(BookEnum.AUTHOR.header()));
				book.setPublisher(rs.getString(BookEnum.PUBLISHER.header()));
				book.setDescription(rs.getString(BookEnum.DESCRIPTION.header()));
				book.setImgUrl(rs.getString(BookEnum.IMG_URL.header()));
				book.setStatus(rs.getInt(BookEnum.STATUS_ID.header()));
				book.setCpf(rs.getString(BookEnum.CPF.header()));
			}
			
			return book;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static boolean updateBook(Book book) {
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "update book set title=?, author=?, publisher=?, description=? where isbn = " + book.getIsbn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, book.getTitle());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getPublisher());
			ps.setString(4, book.getDescription());
			ps.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();			
			return false;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static boolean updateStatus(Book book, int status) {
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "update book set status_id=? where isbn = ? and code = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, status);
			ps.setInt(2, book.getIsbn());
			ps.setInt(3, book.getCode());
			
			ps.executeUpdate();
			
			return true;
		} catch (SQLException e) {
			e.printStackTrace();			
			return false;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static boolean deleteBook(int isbn) {
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "update book set STATUS_ID = 3 where isbn = " + isbn;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();			
			return false;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	public static boolean approveBook(int isbn) {
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "update book set STATUS_ID = 2 where isbn = " + isbn;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();			
			return false;
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
	}
	
	private static int getLastCode(int isbn) {
		String sql = "SELECT MAX(CODE) FROM BOOK WHERE ISBN = ?";
		
		try {
			conn = ConnectionFactory.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, isbn);
			
			ResultSet resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return 0;
	}
	
	public static int getFirstAvailableCode(int isbn) {
		String sql = "SELECT MIN(CODE) FROM BOOK WHERE ISBN = ? AND STATUS_ID = ?";
		
		try {
			conn = ConnectionFactory.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, isbn);
			ps.setInt(2, BookStatus.AVAILABLE.id());
			
			ResultSet resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				return resultSet.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return -1;
	}
	
	public int getStatus(int isbn, int code) {
		String sql = "SELECT * FROM BOOK WHERE ISBN = ? AND CODE = ?";	
		
		try {
			conn = ConnectionFactory.getConnection();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, isbn);
			ps.setInt(2, code);
						
			ResultSet resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				return resultSet.getInt("STATUS_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn);
		}
		
		return BookStatus.NOT_FOUND.id();
	}
}
