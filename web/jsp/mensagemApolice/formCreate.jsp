<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>

<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Enviar Mensagem<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<input type="hidden" name="listaApolice" id="listaApolice" value="${listaApolice}" />

<script type="text/javascript">
    
    var ref = $('#listaApolice').val();
    var aux = ref.split(";");
    
    var vetor1 = [];
    for (var i = 0; i <= aux.length-1 ; i++) {
        vetor1[vetor1.length] = aux[i];
    }
    $(document).ready(function(){
        $('input[type="radio"]').click(function(){
            document.getElementById('tokenfield-1').value = '';
            if (this.id == "selecionado") {
                $('#tipoEnvio').css("display", "");
            } else if (this.id = "todos") {
                $('#tipoEnvio').css("display", "none");
            }
        });
    });
    
    
</script>

<div class="container" style="min-height:700px;">
    <mtw:form action="MsgApoliceCreate.mtw" method="post">
        <div class="panel-body">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Para:</h3>
                </div>
                <div style="margin-left: 50px;">
                    <mtw:input type="radio" name="modoEnvio" value="todos" id="todos" /><span>&nbsp;&nbsp;&nbsp;Todos</span>
                    <br/>
                    <mtw:input type="radio" name="modoEnvio" value="selecionado" id="selecionado" /><span>&nbsp;&nbsp;&nbsp;Selecionar...</span>
                </div>
            </div>

            <div class="form-group" id="tipoEnvio" style="display: none;">
                <input type="text" class="" id="tokenfield-1" name="tokenfield-1" value="" placeholder="Entre com o nome..." style="width: 1500px"/>
            </div>

        </div>
        <mtw:input type="hidden" name="id"></mtw:input> 
        <fieldset>
            <div class="col-xs-12 col-md-12" style="padding-bottom: 15px;">
                <h3 class="panel-title" style="float: left; width: 85%;">Descrição</h3>
                <br/>
                <textarea class="form-control" rows="15" resize="none" id="descricao" name="descricao">${descricao}</textarea>
            </div>
        </fieldset>
            <input type="submit" style="float: right;" class="btn btn-primary" value="Enviar"/>
    </mtw:form>
</div>