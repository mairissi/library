<%@ page
	import="library.dao.BookDAO"
	import="library.model.Book"
	import="library.model.BookControl"
	import="library.dao.BookControlDAO"
	import="java.util.ArrayList"
	import="library.enums.BookStatus"
	import="library.dao.BookControlDAO" %>

<form method=post action=control>
	<table class="table">
		<thead>
			<th>Título</th>
			<th>Autor</th>
			<th>Status</th>
		</thead>
		<tbody>
			<%
			
			ArrayList<Book> books = new ArrayList();
			
			books = BookDAO.getBookByCPF(request.getSession().getAttribute("cpf").toString());
			
			for (Book book : books) {
					%>
					<tr>
						<td><% out.print(book.getTitle()); %></td>
						<td><% out.print(book.getAuthor()); %></td>
						<td><% 
							if (book.getStatus() == BookStatus.PENDING.id()) {
								out.print("Pendente");
							}
							else {
								out.print("Aprovado");
							}
							%></td>
						<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
						<input type=hidden name="code" value= <% out.print(book.getCode()); %> >
					</tr>
					<%
			}
			
			%>
		</tbody>
	</table>
</form>