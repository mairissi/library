<%@ page
	import="library.dao.BookDAO"
	import="library.model.Book"
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
		
		<table class="table">
			<thead>
				<tr>
					<th>Título</th>
					<th>Autor</th>
					
					<% 
					ArrayList<Book> books = null;
					if (role != null) {
						int roleInt = Integer.parseInt(role.toString());
						
						if (roleInt == 1) {
							books = BookDAO.getBooks(1);
							out.print("<th>Ação</th>");
						} else if (roleInt == 2) {
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
									</form>
								</div>
								<div class=pull-left>
									<form method=post action=control>
										<button type=Submit class="btn btn-default btn-edit">Excluir</button>
										<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
										<input type=hidden name=command value=DeleteBook>
									</form>
								</div>
							</div>
							</center></td>
						<%
						} else if (roleInt == 2) {
							out.print("<td>27/11/2017</td>");
							out.print("<td><button type=\"button\" class=\"btn btn-default\">Renovar</button></td>");
							out.print("<td style=\"text-align:center\">1/3</td>");
						} else if (roleInt == 3) {
							out.print("<td>Aceito</td>");
						}
					}
					
					%>
					
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>

</body>
</html>