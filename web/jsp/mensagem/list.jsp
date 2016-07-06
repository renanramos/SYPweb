<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Mensagem<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<!-- CONTEUDO DA PAGINA -->
<div class="container" style="min-height:700px;">

    <!-- MENU -->
    <div style="padding-bottom: 10px;">
        <a class="btn btn-primary" type="button" href="MsgApolice.mtw">Novo</a>
        <a class="btn btn-primary" type="button" href="MsgApoliceRead.mtw">Enviados</a>
    </div>
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
    <input type="hidden" id="valMag" name="valMag" value="${valMag}">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">Lista de Mensagens</h3>
        </div>
        <input type="hidden" id="user" name="user" />
        <div class="panel-body">

            <display:table name="lista" id="lista" requestURI="" defaultsort="1" pagesize="15">
                <display:column property="descricao" title="Descrição" maxLength="40" sortable="true" style="width:35%"/>
                <display:column property="usuario.nome" title="Usuário" sortable="true" style="width:25%"/> 
                <display:column property="dataHoraCadastro" title="Data/Hora" format="{0,date,dd/MM/yyyy HH:MM}" sortable="true" style="width:25%"/>                
                <display:column class="${lista.id}" value="<i class='glyphicon glyphicon-pencil'></i>" href="MensagemShowForm.mtw" title="Atualizar" paramId="id" paramProperty="id" style="width:10%; text-align:center;" />
                <display:column class="${lista.id}" value="<i class='glyphicon glyphicon-trash'></i>" href="MensagemDelete.mtw" title="Excluir" paramId="id" paramProperty="id" style="width:10%; text-align:center;"/>
                <display:column class="${lista.id}" value="<i class='glyphicon glyphicon-envelope'></i>" href="MsgApolice.mtw" title="Encaminhar" paramId="id" paramProperty="id" style="width:10%; text-align:center;"/>
            </display:table>  
        </div>
    </div>
    
    <!-- MODAL PARA VISUALIZAR A MENSAGEM -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Informações da Mensagem</h4>
                </div>
                <div class="modal-body" id="descOn">
                    <!--display:column value="<i class='glyphicon glyphicon-search' data-toggle='modal' data-target='#myModal'></i>" href="" title="Visualizar" style="width:10%; align:center;"/>-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        var ids = $('#valMag').val();
        var vetId = ids.split(";");

        for(var i = 0; i < vetId.length; i++) {
            $('.'+vetId[i]+' a').css("display","none");
        }
    });

</script>