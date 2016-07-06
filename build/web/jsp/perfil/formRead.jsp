<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf" %>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Perfil<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<div class="panel-body" style="min-height: 450px;">
    <fieldset disabled>
        <div class="col-xs-8 col-md-8" style="padding-bottom: 15px;">
            <span>Nome</span>
            <input class="form-control" type="text" value="${usuarioLogado.nome}" placeholder="Nome">
        </div>
        
        <c:if test="${usuarioSyp.regSusep == '0'}"> 
        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
            <span>Registro</span>
            <input class="form-control" type="text" value="${usuarioSyp.regSusep}" placeholder="Registro">
        </div>
        </c:if>

        <c:if test="${usuarioSyp.regSusep == '0'}"> 
        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
            <span>CNPJ</span>
            <input class="form-control" type="text" value="" placeholder="CNPJ">
        </div>
        </c:if>        

        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
            <span>Telefone</span>
            <input class="form-control" type="text" value="${usuario.telefone}" placeholder="Telefone">
        </div>        

        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
            <span>E-mail</span>
            <input class="form-control" type="text" value="${usuarioSyp.email}" placeholder="Email">
        </div>

        <div class="col-xs-10 col-md-10" style="padding-bottom: 15px;">
            <span>Município</span>
            <input class="form-control" type="text" value="${usuario.cidade.nome}" placeholder="Cidade">
        </div>

        <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
            <span>UF</span>
            <input class="form-control" type="text" value="${usuario.cidade.estado.sigla}" placeholder="Estado">
        </div>

        <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
            <span>Bairro</span>
            <input class="form-control" type="text" value="${usuario.bairro}" placeholder="Bairro">
        </div>

        <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
            <span>Rua</span>
            <input class="form-control" type="text" value="${usuario.rua}" placeholder="Rua" >
        </div>

        <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
            <span>Número</span>
            <input class="form-control" type="text" value="${usuario.numero}" placeholder="Número">
        </div>                       
    </fieldset>
        <br/>
        <a type="submit" class="btn btn-primary" style="float: right; margin-right: 15px;" href="AlterarSenha.mtw"><i class="icon-key" ></i>&nbsp;&nbsp;Alterar Senha</a>
</div>