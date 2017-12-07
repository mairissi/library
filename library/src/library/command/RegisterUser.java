package library.command;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.UserDAO;
import library.model.User;

public class RegisterUser implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		String password = request.getParameter("password1");
		String passwordConfirm = request.getParameter("password2");
		
		if(isPasswordValid(password, passwordConfirm)) {
			User user = createUserFromRequest(request);
			try {
				UserDAO.addUser(user);
				request.setAttribute("message", "Usuário cadastrado com sucesso!");
				request.setAttribute("alert", "alert alert-success");
				return "allBooks.jsp";
			}catch(SQLIntegrityConstraintViolationException sqle){
				request.setAttribute("message", "CPF já cadastrado!");
				request.setAttribute("alert", "alert alert-danger");
				return "/signUp.jsp";
			}catch(Exception e) {
				request.setAttribute("message", "Falha ao cadastrar, tente novamente mais tarde!");
				request.setAttribute("alert", "alert alert-danger");
				return "/signUp.jsp";
			}
		} else {
			request.setAttribute("message", "Senhas não conferem!");
			request.setAttribute("alert", "alert alert-danger");
			return "/signUp.jsp";
		}
		
	}
	
	private boolean isPasswordValid(String password, String passwordConfirm) {
		if ((password == null) || (passwordConfirm == null) || (password.isEmpty()) || (passwordConfirm.isEmpty())) {
			return false;
		}
		
		return password.equals(passwordConfirm);
	}
	
	private User createUserFromRequest(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password1");
		
		User user = new User();		
		user.setCpf(request.getParameter("cpf"));
		user.setEmail(email);
		user.setPassword(encrypt(email, password));
		user.setName(request.getParameter("name"));
		//user.setBirth_date(request.getParameter("birthdate"));
		user.setCep(request.getParameter("cep"));
		user.setCity(request.getParameter("city"));
		user.setDistrict(request.getParameter("district"));
		//user.setSex(request.getParameter("sex"));
		user.setTel(request.getParameter("tel"));
		user.setState(request.getParameter("state"));
		user.setStreet(request.getParameter("street"));
		user.setNumber(request.getParameter("number"));
		user.setRole(request.getParameter("role"));
		
		return user;
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
