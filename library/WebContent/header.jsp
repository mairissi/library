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
            <form method="post" action="control" class="pull-right">
                <input class="form-control login-input" placeholder="E-mail" name="email" type="email" autofocus="" />
                <input class="form-control login-input" placeholder="Senha" name="password" type="password" value="" />
                
                <input id="Login" name="Login" class="btn login-submit" type="Submit" value="Login" />
                <input type=hidden name=command value=Login />
            
                <br>
            
                <a class="login-container-link" href="signUp.jsp">Não possui conta? Cadastre-se aqui</a>
            </form>
        </div>
    </div>
        
    <!-- Menu -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">INÍCIO</a></li>
                    <li><a href="#">DOAR LIVRO</a></li>
                    <li><a href="#">DOAÇÕES</a></li>
                    <li><a href="#">GERENCIAR LIVROS</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
