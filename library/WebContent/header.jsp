<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
    
    <div class="container navbar-fixed-top header">                            
        <img class="logo" src="resources/images/logo.png" href="index.jsp" />
        
        <form method="post" action="control" class="pull-left">
            <input     type="text" 
                            id="search-books" 
                            class="form-control search-input"
                            placeholder="Pesquisar livro..." />
            
            <button type="Submit" class="btn search-button ">
                    <span class="glyphicon glyphicon-search" />
            </button>
        </form>
        
        <!-- Renderizar apenas se o usuário não estiver logado -->
        <div>
            <% String user = (String) request.getSession().getAttribute("user");
        
	        	if (user == null) {
	        		out.print("<form method=\"post\" action=\"control\" class=\"pull-right\">");
	        		out.print("<input class=\"form-control login-input\" placeholder=\"E-mail\" name=\"email\" type=\"email\" autofocus=\"\" />");
	        		out.print("<input class=\"form-control login-input\" placeholder=\"Senha\" name=\"password\" type=\"password\" value=\"\" />");
	        		out.print("<input id=\"Login\" name=\"Login\" class=\"btn submit\" type=\"Submit\" value=\"Login\" />");
	        		out.print("<input type=hidden name=command value=Login />");
	        		out.print("<br>");
	        		out.print("<a class=\"login-container-link\" href=\"signUp.jsp\">Não possui conta? Cadastre-se aqui</a>");
	        		out.print("</form>");
	        	}
	        	else {
	        		out.print("<form method=\"post\" action=\"control\" class=\"pull-right\">");
	        		out.print("<p class=\"header-text\">Bem-vindo " + user + "! </p>");
	        		out.print("<input id=\"Logout\" name=\"Logout\" class=\"btn submit\" type=\"Submit\" value=\"Sair\" />");
	        		out.print("<input type=hidden name=command value=Logout />");
	        		out.print("</form>");
	        	}
	        %>
        </div>
    </div>
        
    <!-- Menu -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                	<li><a href="allBooks.jsp">INÍCIO</a></li>
                	
                	<% 
                		Object objRole = request.getSession().getAttribute("role");
                		
                		if (objRole != null) {
                			int roleHeader = Integer.parseInt(objRole.toString());
                			
                			if (roleHeader == 1) {
                    			out.print("<li><a href=\"#\">DOAÇÕES</a></li>");
                    			out.print("<li><a href=\"#\">GERENCIAR LIVROS</a></li>");
                    		} else if (roleHeader == 2) {
                    			out.print("<li><a href=\"#\">MEUS LIVROS</a></li>");
                    		} else if (roleHeader == 3) {
                    			out.print("<li><a href=\"registerBook.jsp\">DOAR LIVRO</a></li>");
                    			out.print("<li><a href=\"#\">DOAÇÕES</a></li>");
                    		}
                		}
                		
                	%>
                    
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
