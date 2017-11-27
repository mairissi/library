<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Cadastro Livro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
							<form method=post action=control>
							<button class="btn btn-link pull-right" name=command type=Submit value="Logout">Sair</button>						
							</button></form></li>

				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="container">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a><form method=post action=control><button class="btn btn-link" >Biblioteca</button><input type=hidden name=command value=ListBooks></form></a></li>
						<%
						Integer role = (Integer) request.getAttribute("role");
						if(role == null){
							role = 2;
						}	
						
						if(role == 1){
						out.print("<li><a><form method=post action=control>");
						out.print("<button class=\"btn btn-link\" type=Submit>Doações</button>");
						out.print("<input type=hidden name=command value=getPending>");
						out.print("</form></a></li>");
						}
						%>
						<%
						if (role == 3){
							out.print("<li><a><form method=post action=control>");
							out.print("<button class=\"btn btn-link\" type=Submit>Doar Livro</button>");
							out.print("<input type=hidden name=command value=Donate>");
							out.print("</form></a></li>");
						}
						%>
					</ul>
				</div>
			</div>
		</nav>

    <div class="container" style="margin-top: 80px">
        <div class="panel-body">
            <div class="form-group">
                    <div class="col-md-12 control-label">
                        <p class="help-block" style="text-align: end">
                            <h11>*</h11> Campo Obrigatório </p>
                    </div>
                </div>
                </div>
        <div class="panel panel-default">
            <div class="panel-heading"><strong>Upload de Arquivo</strong> <small>Capa do livro</small></div>
            <div class="panel-body">
                <!-- Standar Form -->
                    <form method=post action=control enctype="multipart/form-data" id="js-upload-form">
                        <div class="form-inline">
                            <div class="form-group">
                                <input type="file" name="files[]" id="js-upload-files" multiple>
                            </div>
                            <button type="button" class="btn btn-primary" style="margin-left: 10px" id="js-upload-submit">Fazer Upload</button>
                        </div>
                    </form>

                <!-- Upload Finished -->
                <div class="js-upload-finished">
                    <h4 style="margin-bottom: 10px">Arquivo Processado</h4>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">OK</span>image-01.jpg</a>
                    </div>
                </div>
            </div>  
        </div>

        <form class="form-horizontal" style="margin-top: 10px" method=post action=control>
        <% String isbn = (String) request.getAttribute("isbn"); %>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="Titulo" style="text-align:left">Título
                    <h11>*</h11>
                </label>
                <div class="col-md-11">
                    <input id="Titulo" name="title" placeholder="" class="form-control input-md" required="" type="text" value="<%
                    		if(isbn!=null){out.println(request.getAttribute("title"));}%>">
                </div>
            </div>
        
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="Autor" style="text-align:left">Autor
                    <h11>*</h11>
                </label>
                <div class="col-md-11">
                    <input id="Autor" name="author" placeholder="" class="form-control input-md" required="" type="text" value="<%
                    		if(isbn!=null){out.println(request.getAttribute("author"));}%>">
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-1 control-label" for="ISBN" style="text-align:left">ISBN
                    <h11>*</h11>
                </label>
                <div class="col-md-2">
                    <input id="ISBN" name="isbn" placeholder="Somente números" class="form-control input-md" required="" type="text" maxlength="13" value="<%
                    		if(isbn!=null){out.println(isbn);}%>" <%if(isbn!=null){out.println(" readonly");}%>>
                </div>

                <label class="col-md-2 control-label" for="Editora" style="text-align:right">Editora
                    <h11>*</h11>
                </label>
                <div class="col-md-4">
                    <input id="Editora" name="publisher" placeholder="" class="form-control input-md" required="" type="text" value="<%
                    		if(isbn!=null){out.println(request.getAttribute("publisher"));}%>">
                </div>

            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="Descricao" style="text-align:left">Descrição
                    <h11>*</h11>
                </label>
                <div class="col-md-12">
                    <textarea id="Descricao" name="description" placeholder="" required=""
                        style="width:-webkit-fill-available; height: 200px; resize:none;"><%if(isbn!=null){out.println(request.getAttribute("description"));}%></textarea>
                </div>
            </div>
            <input id="Registrar" name="Registrar" class="btn btn-success" type="Submit" value="<% if(isbn==null){out.println("Doar");}else{out.println("Salvar");}%>">
            <input type=hidden name=command value=<% if(isbn==null){out.print("RegisterBook");}else{out.print("UpdateBook");}%>>
            <% 
            	String message = (String) request.getAttribute("message");
            	String alert = (String) request.getAttribute("alert");
            	if(message != null && alert != null){
            		out.println("<div class=" + alert + ">" + message + "</div>");
            	}
            %>
        </form>
    </div> 
    <!-- /container -->
</body>

</html>