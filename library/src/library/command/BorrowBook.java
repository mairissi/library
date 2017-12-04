package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookControlDAO;
import library.model.BookControl;

public class BorrowBook extends BookControlCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BookControl control = createBookControlFromRequest(request);
		BookControlDAO dao = new BookControlDAO();
		
		if (dao.canBorrow(control.getUserCpf())) {
			if (dao.add(control)) {
				// success
				request.setAttribute("alert", "alert alert-success");
				request.setAttribute("message", "Empréstimo realizado com sucesso!");
				return "";
			}
			
			// error
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao efetuar empréstimo.");
			
			return "";
		}
		
		// error
		request.setAttribute("alert", "alert alert-danger");
		request.setAttribute("message", "O usuário informado não pode efetuar mais empréstimos.");
		
		return "";
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = super.createBookControlFromRequest(request);
		bc.setRenewalNumber(0);
		bc.setExpireDate(super.getExpireDateForBorrow());
		
		return super.createBookControlFromRequest(request);
	}
}
