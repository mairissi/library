package library.command;

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
		User user = new User();
		user.setCpf(cpf);
		user.setEmail(email);
		user.setPassword(password);
		if(password.equals(request.getParameter("password2"))) {
			UserDAO usuarioDAO = new UserDAO();
			usuarioDAO.addUser(user);
			System.out.println("Sucess!");
			request.setAttribute("mensagem", "Usuario cadastrado com sucesso!");
			return "index.jsp";
		} else {
			System.out.println("FAIL!");
			request.setAttribute("mensagem", "Senhas não conferem!");
			return "index.jsp";
		}
		
	}

}
