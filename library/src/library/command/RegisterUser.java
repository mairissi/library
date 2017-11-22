package library.command;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.UserDAO;
import library.model.User;

public class RegisterUser implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		String cpf = request.getParameter("cpf");
		String email = request.getParameter("email");
		String password = request.getParameter("password1");
		String name = request.getParameter("name");
		//String Date = request.getParameter("birthdate");
		//String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		String cep = request.getParameter("cep");
		String street = request.getParameter("street");
		String number = request.getParameter("number");
		String district = request.getParameter("district");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String role = request.getParameter("role");
		
		if(password.equals(request.getParameter("password2"))) {
			User user = new User();		
			user.setCpf(cpf);
			user.setEmail(email);
			user.setPassword(encrypt(email, password));
			user.setName(name);
			//user.setBirth_date(birthdate);
			user.setCep(cep);
			user.setCity(city);
			user.setDistrict(district);
			//user.setSex(sex);
			user.setTel(tel);
			user.setState(state);
			user.setStreet(street);
			user.setNumber(number);
			user.setRole(role);
			
			if (UserDAO.addUser(user)) {
				System.out.println("Sucess!");
				request.setAttribute("mensagem", "Usuário cadastrado com sucesso!");
			
				return "index.jsp";
			}
			else {
				System.out.println("FAIL!");
				request.setAttribute("mensagem", "Senhas não conferem!");
				
				return "/signUp.jsp";
			}
		} else {
			System.out.println("FAIL!");
			request.setAttribute("mensagem", "Senhas não conferem!");
			return "/signUp.jsp";
		}
		
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
