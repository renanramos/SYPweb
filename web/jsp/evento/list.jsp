<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Eventos<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<!-- CONTEUDO DA PAGINA -->
<div class="container" style="min-height:700px;">
    <!-- PESQUISA -->
    <mtw:form action="Eventos.mtw" method="post">
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
            <h3 class="panel-title">Lista de Eventos</h3>
        </div>
        <div class="panel-body">
            <display:table name="lista" id="lista" requestURI="" defaultsort="1" pagesize="10">
                <!--<isplay:column property="id" title="Código" sortable="true" defaultorder="descending" style="width:10%"/>  "-->
                <display:column property="tipoEvento.nome" title="Tipo Evento" sortable="true" style="width:20%;text-align:left;"/> 
                <display:column property="apolice.apolice" title="Apólice" sortable="true" style="width:20%;text-align:left;"/>              
                <display:column title="Data" sortable="true" defaultorder="descending" property="dataHoraCadastro" format="{0,date,dd/MM/yyyy HH:MM}" style="width:20%; text-align:left;"/>
                <display:column value="<i class='icon-map-marker'></i>" href="Mapa.mtw" title="Mapa" paramId="id" paramProperty="id" style="width:5%;text-align:center;"/>
            </display:table>  
        </div>
    </div>
</div>