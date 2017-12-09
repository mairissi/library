package library.command;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookControlDAO;
import library.model.BookControl;

public class RenewBorrow extends BookControlCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BookControl control = createBookControlFromRequest(request);
		BookControlDAO dao = getDao();
		
		
		request.setAttribute("pageType", "donator_books");
		
		String cpf = control.getUserCpf();
		int isbn = control.getIsbn();
		int code = control.getCode();
		
		if (canRenewBook(control)) {
			control.setRenewalNumber(dao.getRenewalNumber(isbn, code, cpf) + 1);
			
			if (dao.update(control)) {
				// success
				request.setAttribute("alert", "alert alert-success");
				request.setAttribute("message", "Renovação realizada com sucesso!");
				return "bookList.jsp";
			}
			
			// error
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao efetuar renovação.");
			
			return "bookList.jsp";
		}
		
		// error
		request.setAttribute("alert", "alert alert-danger");
		request.setAttribute("message", "O usuário informado não pode efetuar mais renovações para este livro.");
		
		return "bookList.jsp";
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = super.createBookControlFromRequest(request);
		bc.setExpireDate(super.getExpireDateForBorrow());
		bc.setCode(Integer.parseInt(request.getParameter("code").toString()));
		
		return bc;
	}
}
