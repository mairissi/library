package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.model.BookControl;

public class ReserveBook extends BookControlCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		return super.createBookControlFromRequest(request);
	}	
}
