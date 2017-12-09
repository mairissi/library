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
			<th>Devolução</th>
			<th>Ação</th>
			<th style="text-align:center">Renovações</th>
		</thead>
		<tbody>
			<% 	ArrayList<Book> books = new ArrayList();
				ArrayList<BookControl> controls = new ArrayList();
				BookControlDAO controlDAO = new BookControlDAO();
				
				controls = controlDAO.getBooksFromUser(request.getSession().getAttribute("cpf").toString());
				books = BookDAO.getBooksFromControls(controls);
				
				for(Book book : books) { %>
                <tr>
                    <td><% out.print(book.getTitle()); %></td>
                    <td><% out.print(book.getAuthor()); %></td>
                    
                   <% for (BookControl control : controls) {
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
				}
				%>
                </tr>
		</tbody>
	</table>
</form>