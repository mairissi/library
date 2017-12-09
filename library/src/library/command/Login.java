package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.dao.UserDAO;
import library.model.User;
import library.util.Encrypt;

public class Login implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setEmail(email);
		user.setPassword(Encrypt.generateHash(email, password));
		Integer cpf = UserDAO.checkUser(user);
		if(cpf != null) {
			//request.setAttribute("role", new Integer(role));
			
			user = UserDAO.getUser(user.getEmail());
			
			if (user != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user.getName());
				session.setAttribute("cpf", user.getCpf());	
				session.setAttribute("role", user.getRole());
			}
			
			return "allBooks.jsp";
		}
		request.setAttribute("alert", "alert alert-danger");
		request.setAttribute("message", "Email ou senha incorretos!");
		return "allBooks.jsp";
	}
	
}
