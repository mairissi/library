package library.command;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import library.model.BookControl;

public abstract class BookControlCommand implements Command {
	
	
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = new BookControl();
		
		bc.setIsbn(Integer.parseInt(request.getParameter("isbn")));
		bc.setCode(Integer.parseInt(request.getParameter("code")));
		bc.setUserCpf(request.getParameter("cpf"));
		
		return bc;
	}
	
	protected long getExpireDateForBorrow() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 7);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		
		return calendar.getTimeInMillis();
	}
	
	protected long getExpireDateForReservation() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		
		return calendar.getTimeInMillis();
	}
}
