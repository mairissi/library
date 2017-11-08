package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.UserDAO;
import library.model.User;

public class Login implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		System.out.println("Login");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		UserDAO usuarioDAO = new UserDAO();
		System.out.println(usuarioDAO.checkUser(user));
		if(usuarioDAO.checkUser(user)) {
			return "index.jsp";
		}
		return "index.jsp";
	}

}
