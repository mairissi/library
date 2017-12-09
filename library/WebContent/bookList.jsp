<%@page import="library.enums.BookStatus"%>
<%@page import="library.dao.BookControlDAO"%>
<%@ page
	import="library.dao.BookDAO"
	import="library.model.Book"
	import="library.model.BookControl"
	import="library.dao.BookControlDAO"
	import="java.util.ArrayList"
 language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%@include file="header.jsp" %>
	
	<div class="container" style="margin-top: 150px">
		
		<% Object role = request.getSession().getAttribute("role"); %>
		
		<h1> <% out.print(request.getParameter("pageType")); %> </h1>
		
		<form method=post action=control>
			<table class="table">
				<thead>
					<tr>
						<th>Título</th>
						<th>Autor</th>
						
						<%
						Object requestType = request.getParameter("requestType");
						ArrayList<Book> books = new ArrayList();
						ArrayList<BookControl> controls = new ArrayList();
						if (role != null) {
							int roleInt = Integer.parseInt(role.toString());
							
							if (roleInt == 1) {
								books = BookDAO.getBooks(1);
								out.print("<th>Ação</th>");
							} else if (requestType != null && requestType.equals("myDonations")){
								books = BookDAO.getBookByCPF(request.getSession().getAttribute("cpf").toString());
								out.print("<th>Status</th>");
							} else if (roleInt == 2 || roleInt == 3) {
								BookControlDAO controlDAO = new BookControlDAO();
								controls = controlDAO.getBooksFromUser(request.getSession().getAttribute("cpf").toString());
								books = BookDAO.getBooksFromControls(controls);
								
								out.print("<th>Devolução</th>");
								out.print("<th>Ação</th>");
								out.print("<th style=\"text-align:center\">Renovações</th>");
							} else if (roleInt == 3) {
								out.print("<th>Status</th>");
							}
						}
						
						%>
						
					</tr>
				</thead>
				<tbody>
				<% for(Book book : books){ %>
					<tr>
						<td><% out.print(book.getTitle()); %></td>
						<td><% out.print(book.getAuthor()); %></td>
						
						<%					
						if (role != null) {
							int roleInt = Integer.parseInt(role.toString());
							
							if (roleInt == 1) {
							%>
								<td><center>
								<div class=row style="align-content: center;">
									<div class=pull-left>
										<form method=post action=control>
											<button type=Submit class="btn btn-default btn-edit">Aceitar</button>
											<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
											<input type=hidden name=command value=Approve>
										</form>
									</div>
									<div class=pull-left>
										<form method=post action=control>
											<button type=Submit class="btn btn-default btn-edit">Ver Detalhes</button>
											<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
											<input type=hidden name=command value=getDetails>
											<input type=hidden name=currentPage value="<%out.print(request.getRequestURI());%>">
										</form>
									</div>
									<div class=pull-left>
										<form method=post action=control>
											<button type=Submit class="btn btn-default btn-edit">Rejeitar</button>
											<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
											<input type=hidden name=command value=DeleteBook>
										</form>
									</div>
								</div>
								</center></td>
							<%
							} else if (requestType != null && requestType.equals("myDonations")) {
								switch(book.getStatus()){
								case 1:
									out.print("<td>Aguardando revisão<td>");
									break;
								case 2:
								case 4:
								case 5:								
									out.print("<td>Aceito<td>");
									break;
								case 3:								
									out.print("<td>Rejeitado<td>");
									break;
								default:
									out.print("<td>Desconhecido");
								}
							} else if (roleInt == 2 || roleInt == 3) {								
								for (BookControl control : controls) {
									int isbn = book.getIsbn();
									int code = book.getCode();
									
									if ((control.getIsbn() == isbn) && (control.getCode() == code)) {
										%>
											<td><% out.print(control.getFormattedExpireDate()); %></td>
											
											<%
												if (book.getStatus() == BookStatus.BORROWED.id()) {
													%>
													<td><button type="submit" name=command value=RenewBorrow class="btn btn-default <% if (control.getRenewalNumber() == 3) out.print("disabled"); %>">Renovar</button></td>
													<td style="text-align:center"><% out.print(control.getRemainingRenewal()); %></td>
													<%
												} else if (book.getStatus() == BookStatus.RESERVED.id()) {
													%>
													<td>Reservado</td>
													<td style="text-align:center"> - </td>
													<%
												}
		
											%>
											
											
											
											
											
											<input type=hidden name="isbn" value= <% out.print(isbn); %>>
											<input type=hidden name="code" value= <% out.print(code); %> >
											<input type=hidden name="cpf" value= <% out.print(request.getSession().getAttribute("cpf")); %> >
										<%
										
										break;
									}
								}
							} else if (roleInt == 3) {
								out.print("<td>Aceito</td>");
							}
						}
						
						%>
					</tr>
					<% } %>
				</tbody>
			</table>		
		</form>
	</div>

</body>
</html>