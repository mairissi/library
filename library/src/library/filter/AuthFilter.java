package library.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter implements Filter {

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(true);
        
        String command = request.getParameter("command");
        
        boolean loginCommand = "Login".equals(command);
        boolean signUpCommand = "RegisterUser".equals(command);
        boolean loggedIn = session.getAttribute("user") != null;;
        boolean isallBooksURI = isallBooksURI(request);
        boolean isStaticResource = request.getRequestURI().startsWith("/resources/");
        
        boolean allowRequest = isStaticResource || isallBooksURI || loggedIn || signUpCommand || loginCommand;
        
        if (allowRequest) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect("allBooks.jsp");
        }
		
	}
	
	private boolean isallBooksURI(HttpServletRequest request) {
		String allBooksURI = request.getContextPath() + "/allBooks.jsp";
		return (request.getRequestURI().equals(allBooksURI)) || (request.getRequestURI().equals(request.getContextPath()));
	}
	
	public void doFilter2(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {    
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/login";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);

        if (loggedIn || loginRequest) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }
    }
	
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {}

}
