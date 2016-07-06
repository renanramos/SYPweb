<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/imports.jspf"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="<c:url value="includes/img/icons/favicon.png"/>">

        <title>.:: SYPSeguros ::.</title>

        <link href="<c:url value="/includes/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
        <link href="<c:url value="/includes/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
        <link href="<c:url value="/includes/bootstrap/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
        <link href="<c:url value="/includes/css/tabela.css"/>" rel="stylesheet" media="screen">
        <link href="<c:url value="/includes/themes/syp/style.css"/>" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="./includes/js/html5shiv.js"></script>
                <script src="./includes/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>     
        <div class="">
            <div class="container-fluid">
                <div class="login-box">
                    <div class="login-header">
                        <h4>Acesse sua conta</h4>
                    </div>
                    <div class="login-form">
                        <form action="Login.mtw" method="post">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="icon-user"></i></span>
                                    <input type="text" id="usuario" name="usuario" class="form-control" type="text" placeholder="Usuario"/>                                
                                </div>                                
                            <div class="input-group">
                                <span class="input-group-addon"><i class="icon-key"></i></span>
                                <input id="senha" name="senha" class="form-control" type="password" placeholder="Senha"/>                                
                            </div>
                            <div class="row">
                                <div class="col-sm-12 remember-me">
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="col-md-12 ">
                                    <h6><span class=""><a href=".\jsp\usuario\recuperaSenha.jsp">Esqueci minha senha!</a></span></h6>
                                </div>
                            </div>
                            <br> <span class="label label-danger">${error.error}</span>
                            <br> <span class="label label-info">${envio.envio}</span>
                            <div class="row">
                                <div class="col-sm-12 cta">
                                    <button class="btn btn-main btn-large" type="submit"><i class="icon-signin"></i> Entrar</button>
                                </div>
                            </div>					
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="./includes/js/jquery-2.0.3.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <script src="./includes/js/default.js"></script>
    </body>
</html>
