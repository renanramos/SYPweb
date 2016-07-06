<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf" %>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Informações do Segurado<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<!-- CONTEUDO DA PAGINA -->
<div class="panel-group" id="accordion" style="margin-left: 40px; min-height: 530px;">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #428bca;">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="color: white;">
                    Pessoal
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body" >
                <fieldset disabled>
                    <div class="col-xs-8 col-md-8" style="padding-bottom: 15px;">
                        <span>Nome</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.nome}" placeholder="Nome">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>E-mail</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.email}" placeholder="Email">
                    </div>

                    <c:if test="${apoliceId.segurado_pf.cpf != '0'}"> 
                        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                            <span>CPF</span>
                            <input class="form-control" type="text" value="${apoliceId.segurado_pf.cpf}" placeholder="CPF">
                        </div> 
                    </c:if>

                    <c:if test="${apoliceId.segurado_pf.cpf <= '0'}">  
                        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                            <span>CNPJ</span>
                            <input class="form-control" type="text" value="${apoliceId.segurado_pj.cnpj}" placeholder="CPF">
                        </div> 
                    </c:if>

                    <c:if test="${data_nascimento >= '0'}">
                        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                            <span>Data Nascimento</span>
                            <input class="form-control" type="text" value="${data_nascimento}" placeholder="Data Nascimento">
                        </div>
                    </c:if>

                    <c:if test="${apoliceId.segurado_pf.sexo != null}">
                        <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                            <span>Sexo</span>
                            <input class="form-control" type="text" value="${apoliceId.segurado_pf.sexo}" placeholder="Sexo">
                        </div>
                    </c:if>

                    <div class="col-xs-8 col-md-8" style="padding-bottom: 15px;">
                        <span>Município</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.cidade.nome}" placeholder="Cidade">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>UF</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.cidade.estado.sigla}" placeholder="Estado">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>Telefone</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.telefone}" placeholder="Telefone">
                    </div>

                    <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                        <span>Bairro</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.bairro}" placeholder="Bairro">
                    </div>

                    <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                        <span>Rua</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.rua}" placeholder="Rua">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>Número</span>
                        <input class="form-control" type="text" value="${apoliceId.usuario.numero}" placeholder="Número">
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #428bca;">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" style="color: white;">
                    Veículo
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body" >
                <fieldset disabled>
                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Marca</span>
                        <input class="form-control" type="text" value="${apoliceId.veiculo.marca}" placeholder="Marca">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Modelo</span>
                        <input class="form-control" type="text" value="${apoliceId.veiculo.modelo}" placeholder="Modelo">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Cor</span>
                        <input class="form-control" type="text" value="${apoliceId.veiculo.cor}" placeholder="Cor">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Placa</span>
                        <input class="form-control" type="text" value="${apoliceId.veiculo.placa}" placeholder="Placa">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Chassi</span>
                        <input class="form-control" type="text" value="${apoliceId.veiculo.chassi}" placeholder="Chassi">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>Ano Fabricação</span>
                        <input class="form-control" type="text" value="${ano_fabricacao}" placeholder="Ano Fabricação">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>Ano Modelo</span>
                        <input class="form-control" type="text" value="${ano_modelo}" placeholder="Ano Modelo">
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color: #428bca;">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" style="color: white;">
                    Corretor
                </a>
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse">
            <div class="panel-body" >
                <fieldset disabled>
                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Registro</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.registro}" placeholder="Registro">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>CNPJ</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.cnpj}" placeholder="CNPJ">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>Telefone</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.telefone}" placeholder="Telefone">
                    </div>

                    <div class="col-xs-8 col-md-8" style="padding-bottom: 15px;">
                        <span>Nome</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.nome}" placeholder="Nome">
                    </div>

                    <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                        <span>E-mail</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.email}" placeholder="Email">
                    </div>

                    <div class="col-xs-10 col-md-10" style="padding-bottom: 15px;">
                        <span>Município</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.cidade.nome}" placeholder="Cidade">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>UF</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.cidade.estado.nome}" placeholder="Estado">
                    </div>

                    <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                        <span>Bairro</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.bairro}" placeholder="Bairro">
                    </div>

                    <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                        <span>Rua</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.rua}" placeholder="Rua">
                    </div>

                    <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                        <span>Número</span>
                        <input class="form-control" type="text" value="${apoliceId.corretor.usuario.numero}" placeholder="Número">
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>