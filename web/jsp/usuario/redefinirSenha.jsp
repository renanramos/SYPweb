<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <div class="page-header">
            <div class="container">
                <h3 id="tituloPagina">Início<small class="pull-right hidden-xs"></small></h3>
            </div>			
        </div>

        <input type="hidden" id="pontos" name="pontos" value="" />
        <mtw:form action="RedefinirSenha.mtw" method="post"> 
            <div class="container" style="min-width: 1200px;">
                <div class="">
                    <div class="col-md-12">
                        <div class="row ">
                            <div class="col-md-4 column">
                            </div>
                            <div class="col-md-4 column">
                                <div class="form-group">
                                    <!--<label for="novaSenha" class="col-sm-2 control-label">Senha nova:</label>-->
                                    <div class="col-sm-10">
                                        Senha nova: <input class="form-control" type="password" id="senhaTeste" name="senhaTeste" onkeyup="javascript:verifica()" size="40" />
                                    </div>
                                </div><br>
                                <div class="form-group">
                                    <!--<label for="confirmacao" class="col-sm-2 control-label">Confirmação:</label>-->
                                    <div class="col-sm-10">
                                        Confirmação:<input name="confirmacao" id="confirmacao" type="password" class="form-control" onkeyup="javascript:valida()" id="confirmacao" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!--<label for="confirmacao" class="col-sm-2 control-label">Confirmação:</label>-->
                                    <div class="col-sm-10">
                                        <span id="diferente" style="font-weight: bold; color: red; font-size: 11px;">${error.error}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <br>
                <div class="col-md-offset-5 col-sm-10">
                    <input class="btn btn-success" type="submit" name="enviar" style="display: none;" id="enviar" value="Confirmar"/>
                </div>
            </div>
            <br/>   

            <div class="col-md-offset-2 col-md-4" style="width: 1200px; height: 50px;">
                <div style="float: left; padding-right: 20px;"><img id="caract" src="includes/img/icons/unchecked.png" /><label id="lblCaract" style="color: #ccc; font-size: 10px;">Mais de 8 caracteres</label></div>
                <div style="float: left; padding-right: 20px;"><img id="minusc" src="includes/img/icons/unchecked.png" /><label id="lblMinusc" style="color: #ccc; font-size: 10px;">Mínimo de 1 letra minúscula</label></div>
                <div style="float: left; padding-right: 20px;"><img id="maiusc" src="includes/img/icons/unchecked.png" /><label id="lblMaiusc" style="color: #ccc; font-size: 10px;">Mínimo de 1 letra maiscula</label></div>
                <div style="float: left; padding-right: 20px;"><img id="espec" src="includes/img/icons/unchecked.png" /><label id="lblEspec" style="color: #ccc; font-size: 10px;">Mínimo de 1 caractere especial</label></div>
                <div style="float: left; padding-right: 20px;"><img id="num" src="includes/img/icons/unchecked.png" /><label id="lblNum" style="color: #ccc; font-size: 10px;">Mínimo de 1 número</label></div>
            </div>
            <br>
        </mtw:form>
    </body>
</html>

<style>
    #field {
        border: 1px solid #000;
        border-radius: 4px;
        box-shadow: inset 0 1px 5px #000;
        padding: 3px;
        width: 200px;
    }

    #field * {
        background: transparent;
        border: none;
    }

    #field input {
        display: block;
        float: left;
        font: 16pt bold Verdana, Geneva, sans-serif;
        height: 40px;
        line-height: 40px;
        width: 150px;
    }

    #field button {
        display: block;
        height: 40px;
        margin: 0;
        margin-left: 160px;
        padding: 4px;
        width: 40px;
    }

    #field button img {
        height: 32px;
        width: 32px;
    }
</style>

<script>
    function modificaCampo() {
        var tipo = $('#senha').attr('type');
        if (tipo == "password") {
            $('#senha').attr('type', 'text');
            $('#btnTeste').attr('src', 'includes/img/icons/unpassword.png');
        } else {
            $('#senha').attr('type', 'password');
            $('#btnTeste').attr('src', 'includes/img/icons/password.png');
        }
    }

    function verifica() {
        senhaTeste = document.getElementById("senhaTeste").value;
        var pontos = 0;
        var senha = document.getElementById("senhaTeste").value;;
        var confSenha = document.getElementById("confirmacao").value;;
        
        if (senhaTeste.length >= 8) {
            $('#caract').attr('src', 'includes/img/icons/checked.png');
            $('#lblCaract').css('color', '#000');
            pontos++;
        } else {
            $('#caract').attr('src', 'includes/img/icons/unchecked.png');
            $('#lblCaract').css('color', '#ccc');
        }
        if (senhaTeste.match(/[a-z]+/)) {
            $('#minusc').attr('src', 'includes/img/icons/checked.png');
            $('#lblMinusc').css('color', '#000');
            pontos++;
        } else {
            $('#minusc').attr('src', 'includes/img/icons/unchecked.png');
            $('#lblMinusc').css('color', '#ccc');
        }
        if (senhaTeste.match(/[A-Z]+/)) {
            $('#maiusc').attr('src', 'includes/img/icons/checked.png');
            $('#lblMaiusc').css('color', '#000');
            pontos++
        } else {
            $('#maiusc').attr('src', 'includes/img/icons/unchecked.png');
            $('#lblMaiusc').css('color', '#ccc');
        }
        if (senhaTeste.match(/[0-9]+/)) {
            $('#num').attr('src', 'includes/img/icons/checked.png');
            $('#lblNum').css('color', '#000');
            pontos++;
        } else {
            $('#num').attr('src', 'includes/img/icons/unchecked.png');
            $('#lblNum').css('color', '#ccc');
        }
        if (senhaTeste.match(/[!@#$%¨&_-]/)) {
            $('#espec').attr('src', 'includes/img/icons/checked.png');
            $('#lblEspec').css('color', '#000');
            pontos++;
        } else {
            $('#espec').attr('src', 'includes/img/icons/unchecked.png');
            $('#lblEspec').css('color', '#ccc');
        }
        
        $("#pontos").val(pontos);
    }
    
    function valida() {
        var pontos = $("#pontos").val();
        var senha = $("#senhaTeste").val();
        var confSenha = $("#confirmacao").val();
   
        if ((pontos == 5) && (senha == confSenha)) {
            $("#enviar").css("display","table");
        }
    }
</script>