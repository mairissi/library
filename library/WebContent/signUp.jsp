<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Cadastro</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
                <li><a href="registerBook.jsp">Mock Cadastrar Livro</a></li>
                <li><a href="#portfolio">Item 2</a></li>
                <li><a href="#pricing">Item 3</a></li>
            </ul>
            </div>
        </div>
    </nav>
    <form class="form-horizontal" style="margin-top: 80px" method=post action=control>
        <div class="panel-body">
            <div class="form-group">
                <div class="col-md-11 control-label">
                    <p class="help-block">
                        <h11>*</h11> Campo Obrigatório </p>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="Nome" style="text-align:left; margin-left: 105px;">Nome
                    <h11>*</h11>
                </label>
                <div class="col-md-9">
                    <input id="Nome" name="name" placeholder="" class="form-control input-md" required="" type="text">
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="Nome" style="text-align:left; margin-left: 105px;">CPF
                    <h11>*</h11>
                </label>
                <div class="col-md-2">
                    <input id="cpf" name="cpf" placeholder="Apenas números" class="form-control input-md" required="" type="text" maxlength="11"
                        pattern="[0-9]+$">
                </div>

                <label class="col-md-2 control-label" for="Nome">Nascimento
                    <h11>*</h11>
                </label>
                <div class="col-md-2">
                    <input id="dtnasc" name="birthdate" placeholder="DD/MM/AAAA" class="form-control input-md" required="" type="text" maxlength="10"
                        OnKeyPress="formatar('##/##/####', this)" onBlur="showhide()">
                </div>

                <!-- Multiple Radios (inline) -->
                <label class="col-md-1 control-label" for="radios">Sexo
                    <h11>*</h11>
                </label>
                <div class="col-md-3">
                    <label required="" class="radio-inline" for="radios-0">
                        <input name="sex" id="sexo" value="feminino" type="radio" required> Feminino
                    </label>
                    <label class="radio-inline" for="radios-1">
                        <input name="sex" id="sexo" value="masculino" type="radio"> Masculino
                    </label>
                </div>
            </div>

            <!-- Prepended text-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="prependedtext" style="text-align:left; margin-left: 105px;">Telefone
                    <h11>*</h11>
                </label>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-earphone"></i>
                        </span>
                        <input id="prependedtext" name="tel" class="form-control" placeholder="XX XXXXX-XXXX" required="" type="text" maxlength="13"
                            pattern="\[0-9]{2}\ [0-9]{4,6}-[0-9]{3,4}$" OnKeyPress="formatar('## #####-####', this)">
                    </div>
                </div>
            </div>

            <!-- Prepended text-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="prependedtext" style="text-align:left; margin-left: 105px;">Email
                    <h11>*</h11>
                </label>
                <div class="col-md-5">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-envelope"></i>
                        </span>
                        <input id="prependedtext" name="email" class="form-control" placeholder="email@email.com" required="" type="email"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-1 control-label" for="prependedtext" style="text-align:left; margin-left: 105px;">Senha
                    <h11>*</h11>
                </label>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-barcode"></i>
                        </span>
                        <input id="prependedtext" name="password1" class="form-control" placeholder="Senha" required="" type="password">
                    </div>
                    <div class="input-group" style="margin-top: 5px;">
                         <span class="input-group-addon">
                            <i class="glyphicon glyphicon-barcode"></i>
                        </span>
                        <input id="prependedtext" name="password2" class="form-control" placeholder="Confirmar senha" required="" type="password">
                    </div>
                </div>
            </div>

            <!-- Search input-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="CEP" style="text-align:left; margin-left: 105px;">CEP
                    <h11>*</h11>
                </label>
                <div class="col-md-2">
                    <input id="cep" name="cep" placeholder="Apenas números" class="form-control input-md" required="" value="" type="search"
                        maxlength="8" pattern="[0-9]+$">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" onclick="pesquisacep(cep.value)">Pesquisar</button>
                </div>
            </div>

            <!-- Prepended text-->
            <div class="form-group">
                <label class="col-md-1 control-label" for="prependedtext" style="text-align:left; margin-left: 105px;">Endereço</label>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon">Rua</span>
                        <input id="rua" name="street" class="form-control" placeholder="" required="" type="text">
                    </div>

                </div>
                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon">Nº
                            <h11>*</h11>
                        </span>
                        <input id="numero" name="number" class="form-control" placeholder="" required="" type="text">
                    </div>

                </div>

                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">Bairro</span>
                        <input id="bairro" name="district" class="form-control" placeholder="" required="" type="text">
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-md-2 control-label" for="prependedtext"></label>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon">Cidade</span>
                        <input id="cidade" name="city" class="form-control" placeholder="" required="" type="text">
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="input-group">
                        <span class="input-group-addon">Estado</span>
                        <input id="estado" name="state" class="form-control" placeholder="" required="" type="text">
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-1 control-label" for="prependedtext" style="text-align:left; margin-left: 105px;">Apoie</label>
                <div class="col-md-2">
                      	<input id="doador" name="donor" class="form-check-input" placeholder="" required="" readonly="readonly" type="checkbox"> Quero ser um doador
                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-2 control-label" for="Cadastrar"></label>
                <div class="col-md-8">
                    <input id="Cadastrar" name="Cadastrar" class="btn btn-success" type="Submit" value=Cadastrar>
                    <button id="Cancelar" name="Cancelar" class="btn btn-danger" type="Reset">Cancelar</button>
                </div>
            </div>
        </div>
        <input type="hidden" name=command value=RegisterUser>
    </form>
</body>

</html>