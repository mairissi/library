package library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import library.model.BookControl;
import library.util.ConnectionFactory;

public class BookControlDAO {
	
	private Connection connection;
	private PreparedStatement preparedStatement;
			
	public void add(BookControl control) {
		try {
			String sql = "INSERT INTO BOOK_CONTROL(BOOK_ISBN, BOOK_CODE, USER_CPF, EXPIRE_DATE, RENEWAL_NUMBER) VALUES (?, ?, ?, ?, ?);";
			
			connection = ConnectionFactory.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			int index = 1;
			preparedStatement.setInt(index++, control.getIsbn());
			preparedStatement.setInt(index++, control.getCode());
			preparedStatement.setString(index++, control.getUserCpf());
//			preparedStatement.set
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
