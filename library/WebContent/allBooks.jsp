<%@page 
	import="library.dao.BookDAO"
	import="library.model.Book"
	import="java.util.ArrayList"
 	language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gerenciamento de livros</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
	</head>
	
	<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<%	Integer role = (Integer) request.getAttribute("role");	%>
		<%@include file="header.jsp" %>
		

		<div class="container" style="margin-top: 150px">
		<% 		
	       	String message = (String) request.getAttribute("message");
	       	String alert = (String) request.getAttribute("alert");
	       	if(message != null && alert != null){
	       		out.println("<div class=\"" + alert + "\">" + message + "</div>");
	       	}
        %>
		</div>
		
<div id="post-wrapper" class="post-wrapper clearfix" style="margin: 0 auto; min-width: 800px; max-width: 1600px;">

	<%
	Integer status = (Integer) request.getAttribute("status");
	if(status == null){
		status = 2;
	}
	ArrayList<Book> books = BookDAO.getBooks(status);
	
	if(books != null){
		for(Book book : books){
			out.print("<div class=book>");
			out.print("<img src="+ book.getImgUrl() + " onerror=\"this.src='resources/images/notFound.gif'\">");
			out.print("<div class=info>");
			out.print("<div class=title>" + book.getTitle() + "</div>");
			out.print("<div class=author>" + book.getAuthor() + "</div>");
			out.print("<div class=description>" + book.getDescription() + "</div>");
			if(role != null && role == 1){
				out.print("<div align=center>" 
					+ "<form method=post action=control><button title=Editar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-pencil\"></span></button>"
					+ "<input type=hidden name=command value=EditBook>"
					+ "<input type=hidden name=isbn value=" + book.getIsbn() + "></form>"
					+ "</div>");
				out.print("<div align=center>" 
						+ "<form method=post action=control><button title=Remover type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\"></span></button>"
						+ "<input type=hidden name=command value=DeleteBook>"
						+ "<input type=hidden name=isbn value=" + book.getIsbn() + "></form>"
						+ "</div>");
				/*out.print("<div align=center style=\"margin-left:100px\">");
				out.print("<div style=\"float: left;\"><form method=post action=control><button title=Editar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-pencil\"></span></button>");
				out.print("<input type=hidden name=command value=EditBook>");
				out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></div>");
				out.print("</span><span style=\"float:left\">");
				out.print("<div style=\"float: left;\"><form method=post action=control><button title=Remover type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\"></span></button>");
				out.print("<input type=hidden name=command value=DeleteBook>");
				out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></span></div>");
				if(status == 1){
					out.print("<div style=\"float: left;\"<form method=post action=control><button title=Aprovar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-check\"></span></button>");
					out.print("<input type=hidden name=command value=Approve>");
					out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></div>");
				}
				out.print("</div>");*/
			}
			out.print("</div></div>");
		}
	}
	%>

</div>

			
			
			<!-- <table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>T�tulo</th>
						<th>Autor</th>
						<th>A��o</th>
					</tr>
				</thead>
				<tbody>
				<% /*
					Integer status = (Integer) request.getAttribute("status");
					if(status == null){
						status = 2;
					}					
					ArrayList<Book> books = BookDAO.getBooks(status);					
					
					if(books != null){
						for(Book book : books){
							if(book != null){
								out.println("<tr>");
								out.println("<td>" + book.getIsbn() + "</td>");
								out.println("<td>" + book.getTitle() + "</td>");
								out.println("<td>" + book.getAuthor() + "</td>");
								out.print("<td><span style=\"float:left\">");
								if(role == 1){
								out.print("<form method=post action=control><button title=Editar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-pencil\"></span></button>");
								out.print("<input type=hidden name=command value=EditBook>");
								out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form>");
								out.print("</span><span style=\"float:left\">");
								out.print("<form method=post action=control><button title=Remover type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\"></span></button>");
								out.print("<input type=hidden name=command value=DeleteBook>");
								out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></span>");
									if(status == 1){
									out.print("<form method=post action=control><button title=Aprovar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-check\"></span></button>");
									out.print("<input type=hidden name=command value=Approve>");
									out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form>");
									}
								} else {
									
								}
								out.print("</td>");
								out.println("</tr>");
							}
						}
					}
				*/ %>
				</tbody>
			</table> -->
	</body>
</html>