package library.command;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import library.dao.BlockedUsersDAO;
import library.dao.BookControlDAO;
import library.dao.BookDAO;
import library.model.BookControl;

public abstract class BookControlCommand implements Command {
	
	private BookControlDAO dao;
	
	public BookControlCommand() {
		this.dao = new BookControlDAO();
	}
	
	protected BookControlDAO getDao() {
		return this.dao;
	}
	
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = new BookControl();
		
		bc.setIsbn(Integer.parseInt(request.getParameter("isbn")));
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
	
	protected boolean canReserveBook(BookControl bc) {
		BlockedUsersDAO blockedUsersDAO = new BlockedUsersDAO();
		
		boolean isUserBlocked = blockedUsersDAO.isBlocked(bc.getUserCpf());
		
		if (!isUserBlocked) {
			return dao.canBorrow(bc.getUserCpf());
		}
		
		return false;
	}
	
	protected boolean canRenewBook(BookControl bc) {
		BlockedUsersDAO blockedUsersDAO = new BlockedUsersDAO();
		
		boolean isUserBlocked = blockedUsersDAO.isBlocked(bc.getUserCpf());
		
		if (!isUserBlocked) {
			return dao.canRenewBook(bc.getUserCpf(), bc.getIsbn(), bc.getCode());
		}
		
		return false;
	}
	
	protected boolean canBorrowBook(BookControl bc) {
		BlockedUsersDAO blockedUsersDAO = new BlockedUsersDAO();
		
		boolean isUserBlocked = blockedUsersDAO.isBlocked(bc.getUserCpf());
		
		if (!isUserBlocked) {
			return dao.canBorrow(bc.getUserCpf());
		}
		
		return false;
	}
}
