package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.UserDAO;
import library.model.User;

public class SignUp implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		System.out.println("SignUp");
		return "signUp.jsp";		
	}

}
