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
    <%@include file="header.jsp" %>
            <%    Integer role = (Integer) request.getAttribute("role");    %>
    

    <div class="container" style="margin-top: 80px">
        <div class="panel-body">
            <div class="form-group">
                    <div class="col-md-12 control-label">
                        <p class="help-block" style="text-align: end">
                            <h11>*</h11> Campo Obrigatório </p>
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
                <label class="col-md-2 control-label" for="Titulo" style="text-align:left">URL imagem da capa
                    <h11>*</h11>
                </label>
                <div class="col-md-10">
                    <input id="IMR_URL" name="image_url" placeholder="" class="form-control input-md" required="" type="text" value="<%
                    		if(isbn!=null){out.println(request.getAttribute("image_url"));}%>">
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-1 control-label" for="ISBN" style="text-align:left">ISBN
                    <h11>*</h11>
                </label>
                <div class="col-md-3">
                    <input id="ISBN" name="isbn" placeholder="Somente números" class="form-control input-md" required="" type="text" maxlength="13" value="<%
                    		if(isbn!=null){out.println(isbn);}%>" <%if(isbn!=null){out.println(" readonly");}%>>
                </div>

                <label class="col-md-2 control-label" for="Editora" style="text-align:right">Editora
                    <h11>*</h11>
                </label>
                <div class="col-md-6">
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
            <input id="Registrar" name="Registrar" class="btn submit" type="Submit" value=<% if(isbn!=null) out.println("Doar"); else out.print("Editar");%>>
            <input type=hidden name=command value=<% if(isbn!=null) out.println("RegisterBook"); else out.print("UpdateBook");%>>
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