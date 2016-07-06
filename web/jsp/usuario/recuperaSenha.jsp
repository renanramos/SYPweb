<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mtw" uri="http://www.mentaframework.org/tags-mtw/"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href="<c:url value="/includes/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
<link href="<c:url value="/includes/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/includes/bootstrap/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
<link href="<c:url value="/includes/css/tabela.css"/>" rel="stylesheet" media="screen">
<link href="<c:url value="/includes/themes/syp/style.css"/>" rel="stylesheet">


<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina" style="margin-left: 150px;float: left;">Recuperar Senha<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>


<!-- MENU -->
<div class="navbar navbar-default navbar-fixed-top visible-xs">
    <div class="container-fluid ">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Home.mtw">SYP<span class="strap">SEGUROS</span></a>
        </div>
<!--        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Home.mtw">Inicio</a></li>
                <li><a href="ApoliceRead.mtw">Segurados</a></li>
                <li><a href="Eventos.mtw">Eventos</a></li>
                <li><a href="MensagemRead.mtw">Mensagens</a></li>
                <li><a href="RelatorioRead.mtw">Relatórios</a></li>
                <li><a href="PerfilRead.mtw">Perfil</a></li>
                <li><a href="Logout.">Sair</a></li>
            </ul>
        </div>-->
    </div>
</div>

<ul id="sidemenu" class="sidemenu hidden-xs">
    <li><a class="sidemenu-brand" href="Home.mtw">SYP<span class="strap">&nbsp;SEGUROS</span></a></li>
</ul>

<!--<div class="container">
    <mtw:form action="RecuperarSenha.mtw" method="post">
            E-mail:<br/>
            <mtw:input name="email" type="text"/><br/>
            <mtw:submit value="Confirmar"/>
        </mtw:form> 
    
</div>-->

<div class="container-fluid">
                <div class="login-box">
                    <div class="login-header">
                        <h4>SYP Seguros</h4>
                    </div>
                    <div class="login-form">
                        <mtw:form action="RecuperarSenha.mtw" method="post">
                                <div class="input-group">
                                    <span class="input-group-addon">@</span><!--<i class="icon-user"></i>-->
                                    <input type="text" id="email" name="email" class="form-control" type="text" placeholder="Digite seu email"/>                                
                                </div>                                   
                                 <span class="label label-danger">${error.error}</span>
                            <div class="row">
                                <div class="col-sm-12 cta">
                                    <button class="btn btn-main btn-large" type="submit"><i class="icon-arrow-right"></i> Recuperar senha</button>
                                </div>
                            </div>					
                        </mtw:form>
                    </div>
                </div>
            </div>
<input id="sMenu" value="max" type="hidden" />
<script>
    $(document).ready(function() {
        $("#recizeMenu").click(function() {
            var val = $('#sMenu').val();

            if (val == 'max') {
                $(".sidemenu").animate({width: '4.5%'});
                $("#content-area").animate({marginLeft: '4.5%'});
                $(".lblMenu").css("display", "none");
                $(".sidemenu li a").css("padding-bottom", "28px");
                val = $('#sMenu').val('min');
                //$(".sidemenu-brand").html("<img src='includes/img/syp_img.png' />");
                $(".sidemenu-brand").html("<img src='includes/img/icons/unnamed.png' />");
                $(".sidemenu-brand").css("height", "90px");
                $("#recizeMenu").attr("src", "includes/img/icon_right.png");
                $("#recizeMenu").css("margin-left", "26%");

            } else {
                $(".sidemenu").animate({width: '12%'});
                $("#content-area").animate({marginLeft: '12%'});
                $(".lblMenu").css("display", "");
                $(".sidemenu li a").css("padding-bottom", "3px");
                val = $('#sMenu').val('max');
                $(".sidemenu-brand").html("SYP SEGUROS");
                $(".sidemenu-brand").css("padding-bottom", "25px");
                $("#recizeMenu").attr("src", "includes/img/icon_left.png");
                $("#recizeMenu").css("margin-left", "31%");
            }
        });
    });
</script>

<style>
    #mBtnEventos.selected {
        background-color: #398439;
    }
</style>


<!-- RODAPE DA PAGINA -->
<br/>
<div class="navbar navbar-fixed-bottom" >
    <div id="footer-bottom"> &copy; 2014 SYP Seguros. Todos os direitos reservados.</div>
</div>

<script src="/includes/js/jquery-2.0.3.min.js"/></script>
<script src="/includes/bootstrap/js/bootstrap.min.js"/></script>
<script src="/includes/js/default.js"/></script>
<script src="/includes/js/funcoes.js"/></script>


<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="/includes/js/autocomplete/bootstrap-tokenfield.js" charset="UTF-8"></script>
<script src="/includes/js/autocomplete/scrollspy.js" charset="UTF-8"></script>
<script src="/includes/js/autocomplete/docs.min.js" charset="UTF-8"></script>
<script src="/includes/js/grafico/Chart.js" charset="UTF-8"></script>