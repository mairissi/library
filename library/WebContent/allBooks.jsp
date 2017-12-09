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
		<%@include file="header.jsp" %>
	</head>
	
	<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	<% Integer role = null;
		objRole = request.getSession().getAttribute("role");
	    if (objRole != null) {
	    	role = Integer.parseInt(objRole.toString());
	    }
    %>
		
		

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
					out.print("<div class=book>");//1
						if (role == null){
	                        out.print("<img src="+ book.getImgUrl() + " onerror=\"this.src='resources/images/notFound.gif'\">");
						}
						else{
							out.print("<form method=post action=control><button title=Visualizar type=Submit class=imageButton>"
									+ "<img src="+ book.getImgUrl() + " onerror=\"this.src='resources/images/notFound.gif'\">"
									+ "</button>"
									+ "<input type=hidden name=command value=getDetails>"
									+ "<input type=hidden name=isbn value=" + book.getIsbn() + "></form>");
						}
						out.print("<div class=option>");//2
							out.print("<div class=title>" + book.getTitle() + "</div>");
							out.print("<div class=author>" + book.getAuthor() + "</div>");
						if(role != null){
								if(role == 1){
									out.print("<div>");//3
										out.print("<div class=option-edit>" 
												+ "<form method=post action=control><button title=Editar type=Submit class=\"btn btn-link option-edit\">Editar</button>"
												+ "<input type=hidden name=command value=EditBook>"
												+ "<input type=hidden name=isbn value=" + book.getIsbn() + ">"
												+ "<input type=hidden name=currentPage value=" + request.getRequestURI() + "></form>"
											+ "</div>");
										out.print("<div class=option-remove>" 
													+ "<form method=post action=control><button title=Remover type=Submit class=\"btn btn-link option-remove\">Remover</button>"
													+ "<input type=hidden name=command value=DeleteBook>"
													+ "<input type=hidden name=isbn value=" + book.getIsbn() + "></form>"
												+ "</div>");
									out.print("</div>");//3
								}
						}
							out.print("</div>");//2
					out.print("</div>");//1
				}
			}else{
				out.print("<img class=notFound src=\"resources/images/404.png\">");
			}
			%>
		
		</div>
	</body>
</html>