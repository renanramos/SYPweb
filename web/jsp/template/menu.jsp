<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mtw" uri="http://www.mentaframework.org/tags-mtw/"%>
<%@include file="../../WEB-INF/imports.jspf"%>
<%@taglib prefix="template" uri="/template"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<!-- MENU -->
<div class="navbar navbar-default navbar-fixed-top visible-xs">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Home.mtw">SYP<span class="strap">SEGUROS</span></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Home.mtw">Inicio</a></li>
                <li><a href="ApoliceRead.mtw">Segurados</a></li>
                <li><a href="Eventos.mtw">Eventos</a></li>
                <li><a href="MensagemRead.mtw">Mensagens</a></li>
                <!--<li><a href="RelatorioRead.mtw">Relatórios</a></li>-->
                <li><a href="PerfilRead.mtw">Perfil</a></li>
                <li><a href="Logout.mtw">Sair</a></li>
            </ul>
        </div>
    </div>
</div>

<ul id="sidemenu" class="sidemenu hidden-xs">
    <li><a class="sidemenu-brand" href="Home.mtw">SYP<span class="strap">&nbsp;SEGUROS</span></a></li>
    <li><a id="mBtnHome" href="Home.mtw"><i class="icon-home icon-2x"></i><br/><label class="lblMenu">Início</label></a></li>
    <li><a id="mBtnSegurados" href="ApoliceRead.mtw" type="button"><i class="icon-briefcase icon-2x"></i> <br/><label class="lblMenu">Segurados</label></a></li>
    <li><a id="mBtnEventos" href="Eventos.mtw" type="button"><i class="icon-road icon-2x"></i> <br/><label class="lblMenu">Eventos</label></a></li>
    <li><a id="mBtnMensagem" href="MensagemRead.mtw"><i class="icon-envelope icon-2x"></i> <br/><label class="lblMenu">Mensagens</label></a></li>
    <!--<li><a id="mBtnRelatorio" href="RelatorioRead.mtw"><i class="icon-paper-clip icon-2x"></i> <br/><label class="lblMenu">Relatorios</label></a></li>-->
    <li><a id="mBtnPerfil" href="PerfilRead.mtw"><i class="icon-user icon-2x"></i> <br/><label class="lblMenu">Perfil</label></a></li>
    <li><a id="mBtnSair" href="Logout.mtw"><i class="icon-signout icon-2x"></i> <br/><label class="lblMenu">Sair</label></a></li>
    <li><img id="recizeMenu" src="includes/img/icon_left.png" style="margin-left: 31%; position: absolute;" /></li>
</ul>

<input id="sMenu" value="max" type="hidden" />
<script>
    $(document).ready(function(){
        $("#recizeMenu").click(function(){
            var val = $('#sMenu').val();
            
            if (val == 'max') {
                $(".sidemenu").animate({width:'4.5%'});
                $("#content-area").animate({marginLeft:'4.5%'});
                $(".lblMenu").css("display","none");
                $(".sidemenu li a").css("padding-bottom","28px");
                val = $('#sMenu').val('min');
                //$(".sidemenu-brand").html("<img src='includes/img/syp_img.png' />");
                $(".sidemenu-brand").html("<img src='includes/img/icons/unnamed.png' />");
                $(".sidemenu-brand").css("height", "90px");
                $("#recizeMenu").attr("src", "includes/img/icon_right.png");
                $("#recizeMenu").css("margin-left", "26%");
                
            } else {
                $(".sidemenu").animate({width:'12%'});
                $("#content-area").animate({marginLeft:'12%'});
                $(".lblMenu").css("display","");
                $(".sidemenu li a").css("padding-bottom","3px");
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