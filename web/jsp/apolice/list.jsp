<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Segurados<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<!-- CONTEUDO DA PAGINA -->
<div class="container" style="min-height:700px;">
    <!-- PESQUISA -->
    <mtw:form action="ApoliceRead.mtw" method="post">
        <div class="row">
            <div class="col-xs-4 col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" id="busca" name="busca" type="text" placeholder="Apólice">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit"><i class="icon-search"></i> Pesquisar</button>
                    </span>
                </div>
            </div>
        </div>
    </mtw:form>
    <br/><br/>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Lista de Apólices</h3>
        </div>
        <input type="hidden" id="user" name="user" />
        <div class="panel-body">
            <display:table class="table table-striped table-hover btn-damage" name="lista" id="lista" requestURI="" defaultsort="1" pagesize="20">
                <display:column  property="usuario.nome" title="Nome" sortable="true" style="width:20%;text-align:left;"/>
                <display:column property="apolice" title="Apólice" sortable="true" style="width:10%;text-align:left;"/>
                <%--<display:column property="documento" title="CPF/ CNPJ" sortable="true" style="width:20%;text-align:right;"/>--%>
                <display:column property="veiculo.placa" title="Placa" sortable="true" style="width:10%"/>
                <display:column value="<i class='glyphicon glyphicon-search'></i>" href="ApoliceReadId.mtw" title="Visualizar" paramId="apolice" paramProperty="apolice" style="width:5%; text-align:center;"/>
            </display:table>  
        </div>
    </div>
</div>