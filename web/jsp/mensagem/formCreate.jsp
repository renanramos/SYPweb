<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>

<link rel="stylesheet" href="./includes/js/messi/messi.min.css" />
<script type="text/javascript" src="./includes/js/messi/messi.js"></script>

<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Modelo de Mensagem<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<!-- CONTEUDO DA PAGINA -->
<div class="container" style="min-height:700px;">
    <mtw:form action="MensagemCreate.mtw" id="formMensagem" method="post">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Novo modelo de mensagem</h3>
            </div>
            <!-- DADOS PESSOAIS -->
            <div class="panel-body" >
                <fieldset>
                    <div class="col-xs-12 col-md-12" style="padding-bottom: 15px;">
                        <h3 class="panel-title" style="float: left; width: 85%;">Descrição</h3>
                        <label style="float: left; font-weight: bold; font-size: 14px;">(&nbsp</label><label id="cont" style="float: left; font-weight: bold; font-size: 14px;">1000 </label><label style="float: left; font-weight: bold; font-size: 16px;">&nbsp caracteres)</label>
                        <br/>
                        <textarea class="form-control" rows="15" resize="none" id="descricao" name="descricao"></textarea>
                    </div>
                </fieldset>
            </div>
        </div>
        <a class="btn btn-primary" type="button" onclick="validaForm()">Salvar</a>
        <a class="btn btn-primary" type="button" href="MensagemRead.mtw">Voltar</a>

    </mtw:form>
</div>

<script>
    
    function validaForm() {
        if($("#descricao").val() == ""){
            $("#formMensagem").attr("action","");
            new Messi('Preencha o campo Descrição', {
                title: 'Erro!',
                titleClass: 'anim error',
                buttons: [{id: 0, label: 'OK', val: 'X'}]});

            $("button[class='btn ']").click(function(){
                $('#descricao').css("border", "2px solid #FF0000");
                $('#descricao').focus();
            }); 
        } else {
            $("#formMensagem").attr("action","/MensagemCreate.mtw");
            $("#formMensagem").submit();
        }
    }
    
    $(function (){ 
        $("#descricao").keyup(function(){
            var limite = 1000;
            var tamanho = $(this).val().length;
            if(tamanho > limite)
                tamanho -= 1
            var contador = limite - tamanho
            $("#cont").text(contador)
            if(limite >= tamanho){
                var txt = $(this).val().substring(0, limite)
                $(this).val(txt)
            }
            else if(tamanho > limite )
                $("#cont").css("color","#FF0000")
            
            if (tamanho > limite) {
                alert("Ultrapassou a quantidade de caracteres!");
                var txt = $(this).val().substring($("#cont").text(contador), limite)
                $(this).val(txt)
                $("#cont").text(0)
            }
        })
    })
</script>
