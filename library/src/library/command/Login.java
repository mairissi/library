package library.command;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.dao.UserDAO;
import library.model.User;

public class Login implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User user = new User();
		user.setEmail(email);
		user.setPassword(encrypt(email, password));
		int role = UserDAO.checkUser(user);
		if(role > 0) {
			request.setAttribute("role", new Integer(role));
			
			String cpf = UserDAO.getUserCpf(user.getEmail());
			
			HttpSession session = request.getSession(true);
			session.setAttribute("user", user.getEmail());
			session.setAttribute("cpf", cpf);
			
			return "allBooks.jsp";
		}
		request.setAttribute("alert", "alert alert-danger");
		request.setAttribute("message", "Email ou senha incorretos!");
		return "index.jsp";
	}
	
	private String encrypt(String email, String password) {
		String concat = email + password;
		try {
			StringBuffer encrypted = new StringBuffer();			
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(concat.getBytes(StandardCharsets.UTF_8));
			for(int i=0; i<hash.length; i++) {
				encrypted.append(hash[i]);
			}
			return encrypted.toString();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
