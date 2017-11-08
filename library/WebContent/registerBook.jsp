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
            <a class="align-middle top-bar-content pull-right" href="#">Cadastrar</a>
            <a class="top-bar-content pull-right" href="#">Login</a>
            <a class="navbar-brand" href="#myPage">Logo</a>
        </div>
        <div class="container">
            <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#about">Home</a></li>
                <li><a href="#services">Item 1</a></li>
                <li><a href="#portfolio">Item 2</a></li>
                <li><a href="#pricing">Item 3</a></li>
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
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="Titulo" style="text-align:left">Título
                    <h11>*</h11>
                </label>
                <div class="col-md-11">
                    <input id="Titulo" name="title" placeholder="" class="form-control input-md" required="" type="text">
                </div>
            </div>
        
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="Autor" style="text-align:left">Autor
                    <h11>*</h11>
                </label>
                <div class="col-md-11">
                    <input id="Autor" name="author" placeholder="" class="form-control input-md" required="" type="text">
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-1 control-label" for="ISBN" style="text-align:left">ISBN
                    <h11>*</h11>
                </label>
                <div class="col-md-2">
                    <input id="ISBN" name="isbn" placeholder="Somente números" class="form-control input-md" required="" type="text" maxlength="13">
                </div>

                <label class="col-md-2 control-label" for="Editora" style="text-align:right">Editora
                    <h11>*</h11>
                </label>
                <div class="col-md-4">
                    <input id="Editora" name="publisher" placeholder="" class="form-control input-md" required="" type="text" maxlength="13">
                </div>

                <label class="col-md-2 control-label" for="Quantidade" style="text-align:right">Quantidade
                    <h11>*</h11>
                </label>
                <div class="col-md-1">
                    <input type="number" id="quantity" name="Quantidade" placeholder="" required=""
                        style="inline-size: -webkit-fill-available;"
                    >
                </div>

            </div>
            
            <div class="form-group">
                <label class="col-md-2 control-label" for="Descricao" style="text-align:left">Descrição
                    <h11>*</h11>
                </label>
                <div class="col-md-12">
                    <textarea id="Descricao" name="description" placeholder="" required="" type="text"
                        style="width: -webkit-fill-available; height: 200px; resize:none;" value="">
                    </textarea>
                </div>
            </div>
            <input id="Registrar" name="Registrar" class="btn btn-success" type="Submit" value="Cadastrar">
            <input type=hidden name=command value=RegisterBook>
        </form>
    </div> 
    <!-- /container -->
</body>

</html>