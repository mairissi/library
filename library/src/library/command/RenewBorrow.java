package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookControlDAO;
import library.model.BookControl;

public class RenewBorrow extends BookControlCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookControl control = createBookControlFromRequest(request);
		BookControlDAO dao = getDao();
		
		String cpf = control.getUserCpf();
		int isbn = control.getIsbn();
		int code = control.getCode();
		
		if (canRenewBook(control)) {
			control.setRenewalNumber(dao.getRenewalNumber(isbn, code, cpf) + 1);
			
			if (dao.update(control)) {
				// success
				request.setAttribute("alert", "alert alert-success");
				request.setAttribute("message", "Renova��o realizada com sucesso!");
				return "allBooks.jsp";
			}
			
			// error
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao efetuar renova��o.");
			
			return "allBooks.jsp";
		}
		
		// error
		request.setAttribute("alert", "alert alert-danger");
		request.setAttribute("message", "O usu�rio informado n�o pode efetuar mais renova��es para este livro.");
		
		return "allBooks.jsp";
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = super.createBookControlFromRequest(request);
		bc.setExpireDate(super.getExpireDateForBorrow());
		
		return bc;
	}
}
