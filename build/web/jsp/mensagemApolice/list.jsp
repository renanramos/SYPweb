<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Mensagens Enviadas<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<!-- CONTEUDO DA PAGINA -->
<div class="container" style="min-height:700px;">
     <!-- PESQUISA -->
     <mtw:form action="MensagemRead.mtw" method="post">
        <div class="row">
            <div class="col-xs-4 col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" id="busca" name="busca" type="text" placeholder="Descrição">
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
            <h3 class="panel-title">Lista de Mensagens Enviadas</h3>
        </div>
        <input type="hidden" id="user" name="user" />
        <div class="panel-body">
            <display:table name="lista" id="lista" requestURI="" defaultsort="1" pagesize="15">
                <display:column property="mensagem.descricao" title="Descrição" maxLength="40" sortable="true" style="width:35%"/>
                <display:column property="apolice.apolice" title="Apólice" sortable="true" style="width:25%"/> 
                <display:column property="dataHoraColeta" title="Data/Hora" format="{0,date,dd/MM/yyyy HH:MM}" sortable="true" style="width:25%"/>   
            </display:table>  
        </div>
    </div>    
    <a class="btn btn-primary" type="button" style="float: right;" href="MensagemRead.mtw">Voltar</a>
</div>