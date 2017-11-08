package library;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

public class Test extends HttpServlet {
	
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		System.out.println("Teste");
		
		Connection con = getConnection();
		
		System.out.println(con != null);
		
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	private Connection getConnection() {
		try {
			Class.forName("org.hsqldb.jdbcDriver");
			return DriverManager.getConnection(
					"jdbc:hsqldb:hsql://localhost/librarydb",
					"sa","");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
