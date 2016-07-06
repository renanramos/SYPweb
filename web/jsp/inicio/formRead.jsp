<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf"%>


<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Início<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>


<!-- CONTEUDO DA PAGINA -->
<div class="container" style="min-height:700px;">
    <h3>Filtro por período</h3>
    <mtw:form action="Home.mtw" method="post">
        <div class="inline">            
            <h5><b>De:</b></h5><input type="date" id="dataIni" name="dataIni" value="${dataIni}"/>&nbsp;&nbsp;                        
            <h5><b>Até:</b></h5><input type="date" id="dataFim" name="dataFim" value="${dataFim}"/><br> 
        </div>  <br>
        <input class="btn btn-primary" type="submit"/>
    </mtw:form>
    <span class="">${aviso}</span>    
    <br/>
    <br/>
    
    <input type="hidden" id="acidente" name="acidente" value="${Acidente}" />
    <input type="hidden" id="colisao" name="colisao" value="${Colisão}" />
    <input type="hidden" id="furto" name="furto" value="${Furto}" />
    <input type="hidden" id="pane" name="pane" value="${Pane}" />
    <input type="hidden" id="roubo" name="roubo" value="${Roubo}" />
    <input type="hidden" id="ref" name="ref" value="${apoliceOcorridos}" />  
    <input type="hidden" id="apolice" name="apolice" value="${apolice}" />  
    
    <div style="width: 500px; min-height: 300px; margin-right: 50px; display: table; float: left; padding-bottom: 80px;">
        <div style="width: 500px; height: 30px; margin-bottom: 40px;">
            <p style="font-weight: bold; font-size: 14px;">Quantidade de ocorridos por evento</p>
        </div>
        <div id="canvas-holder" style="width:55%; float: left;">
            <canvas id="chart-area" width="150" height="150"/>
        </div>
        <div style=" width: 150px; height: auto; display: table; margin-left: 50px; float: left;">
            <div style="width: 150px; height: auto; display: table;">
                <p style="float: left; font-weight: bold;">Legenda</p><br/>
            </div>
            <div style="width: 150px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #F7464A;"></div><p style="float: left;">&nbsp;&nbsp;&nbsp;Acidente</p><br/>
            </div>
            <div style="width: 150px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #46BFBD;"></div><p style="float: left;">&nbsp;&nbsp;&nbsp;Colisão</p><br/>
            </div>
            <div style="width: 150px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #FDB45C;"></div><p style="float: left;">&nbsp;&nbsp;&nbsp;Furto</p><br/>
            </div>
            <div style="width: 150px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #3CB371;"></div><p style="float: left;">&nbsp;&nbsp;&nbsp;Pane</p><br/><!--949FB1-->
            </div>
            <div style="width: 150px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #4D5360;"></div><p style="float: left;">&nbsp;&nbsp;&nbsp;Roubo</p><br/>
            </div>
        </div>
    </div>

    <div style="width: 750px; min-height: 300px; display: table; float: left; padding-bottom: 80px;">
        <div style="width: 500px; height: 30px; margin-bottom: 40px;">
            <p style="font-weight: bold; font-size: 14px;">Índice de eventos</p>
        </div>
        <div style="width: 55%; float: left;">
            <canvas id="canvas" height="350" width="500"></canvas>
        </div>
        <div style=" width: 230px; height: auto; display: table; margin-left: 50px; float: left;">
            <div style="width: 230px; height: auto; display: table;">
                <p style="float: left; font-weight: bold;">Legenda</p><br/>
            </div>
            <div style="width: 230px; height: auto; display: table;">
                <a data-toggle="modal" data-target="#modalTipo1" style="cursor: pointer; float: left;"><span  class="glyphicon glyphicon-search"></span></a><p style="float: left;">&nbsp;&nbsp;&nbsp;De 1 a 3 ocorridos</p><br/>
            </div>
            <div style="width: 230px; height: auto; display: table;">
                <a data-toggle="modal" data-target="#modalTipo2" style="cursor: pointer; float: left;"><span  class="glyphicon glyphicon-search"></span></a><p style="float: left;">&nbsp;&nbsp;&nbsp;De 4 a 7 ocorridos</p><br/>
            </div>
            <div style="width: 230px; height: auto; display: table;">
                <a data-toggle="modal" data-target="#modalTipo3" style="cursor: pointer; float: left;"><span  class="glyphicon glyphicon-search"></span></a><p style="float: left;">&nbsp;&nbsp;&nbsp;De 8 a 10 ocorridos</p><br/>
            </div>
            <div style="width: 230px; height: auto; display: table;">
                <a data-toggle="modal" data-target="#modalTipo4" style="cursor: pointer; float: left;"><span  class="glyphicon glyphicon-search"></span></a><p style="float: left;">&nbsp;&nbsp;&nbsp;Superior a 10 ocorridos</p><br/>
            </div>
        </div>
    </div>


    <div style="width: 750px; min-height: 300px; display: table; float: left; padding-bottom: 80px;">
        <div style="width: 500px; height: 30px; margin-bottom: 40px;">
            <p style="font-weight: bold; font-size: 14px;">Aplicativos registrados</p>
        </div>
        <div style="width: 35%; float: left;">
            <canvas id="chart-area2" width="200" height="200"/>
        </div>
        <div style=" width: 250px; height: auto; display: table; margin-left: 50px; float: left;">
            <div style="width: 250px; height: auto; display: table;">
                <p style="float: left; font-weight: bold;">Legenda</p><br/>
            </div>
            <div style="width: 250px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #46BFBD;"></div><p style="float: left;"><a data-toggle="modal" data-target="#modalTipo5" style="cursor: pointer; float: left; margin-left: 20px;"><span  class="glyphicon glyphicon-search"></span></a>&nbsp;&nbsp;&nbsp;Registrados&nbsp;(<span id="pregistrado"></span>)</p><br/>
            </div>
            <div style="width: 250px; height: auto; display: table;">
                <div style="width: 20px; height: 20px; float: left; background-color: #F7464A;"></div><p style="float: left;"><a data-toggle="modal" data-target="#modalTipo6" style="cursor: pointer; float: left; margin-left: 20px;"><span  class="glyphicon glyphicon-search"></span></a>&nbsp;&nbsp;&nbsp;Não Registrados&nbsp;(<span id="pnregistrado"></span>)</p><br/>
            </div>
        </div>
    </div>

    <script>
        // Pizza
        var apolice = $('#apolice').val();
        var saida = apolice.split(",");
        var i = 0

        var apolice = [];
        var registro = [];
        var tipo5 = 0;
        var tipo6 = 0;

        for (var i = 0; i <= saida.length - 1; i++) {
            if (i % 2 == 0) {
                apolice[apolice.length] = saida[i];
            } else {
                registro[registro.length] = saida[i];
                if (saida[i] == 0) {
                    tipo5++;
                } else if (saida[i] == 1) {
                    tipo6++;
                }
            }
        }
        var regist = tipo6;
        var nregist = tipo5;

        var soma = parseInt(regist) + parseInt(nregist);
        var pregist = (regist * 100) / soma;
        var pnregist = (nregist * 100) / soma;
        $("#pregistrado").html(pregist.toFixed(2) + "%");
        $("#pnregistrado").html(pnregist.toFixed(2) + "%");

        var doughnutData = [
            {
                value: parseInt(regist),
                color: "#46BFBD",
                highlight: "#5AD3D1",
                label: "Registrado"
            },
            {
                value: parseInt(nregist),
                color: "#F7464A",
                highlight: "#FF5A5E",
                label: "Não Registrado"
            }
        ];

        // Circulo
        var acidente = $('#acidente').val();
        var colisao = $('#colisao').val();
        var furto = $('#furto').val();
        var pane = $('#pane').val();
        var roubo = $('#roubo').val();

        if (acidente == '') {
            acidente = 0;
        }
        if (colisao == '') {
            colisao = 0;
        }
        if (furto == '') {
            furto = 0
        }
        if (pane == '') {
            pane = 0;
        }
        if (roubo == '') {
            roubo = 0;
        }

        var polarData = [
            {
                value: acidente,
                color: "#F7464A",
                highlight: "#FF5A5E",
                label: "Acidente"
            },
            {
                value: colisao,
                color: "#46BFBD",
                highlight: "#5AD3D1",
                label: "Colisão"
            },
            {
                value: furto,
                color: "#FDB45C",
                highlight: "#FFC870",
                label: "Furto"
            },
            {
                value: pane,
                color: "#3CB371",//00FF66
                highlight: "#8FBC8F",//A8B3C5
                label: "Pane"
            },
            {
                value: roubo,
                color: "#4D5360",
                highlight: "#616774",
                label: "Roubo"
            }
        ];

        // Barras
        var ref = $('#ref').val();
        var saida = ref.split(",");
        var i = 0

        var apolice = [];
        var qtdOcorrido = [];
        var tipo1 = 0;
        var tipo2 = 0;
        var tipo3 = 0;
        var tipo4 = 0;

        for (var i = 0; i <= saida.length - 1; i++) {
            if (i % 2 == 0) {
                apolice[apolice.length] = saida[i];
            } else {
                qtdOcorrido[qtdOcorrido.length] = saida[i];
                if (saida[i] <= 3) {
                    tipo1++;
                } else if (saida[i] >= 4 && saida[i] <= 7) {
                    tipo2++;
                } else if (saida[i] >= 8 && saida[i] <= 10) {
                    tipo3 = 0;
                } else {
                    tipo4++;
                }
            }
        }

        var barChartData = {
            labels: ["1-3", "4-7", "8-10", "11+"],
            datasets: [
                {
                    fillColor: "rgba(92,127,238,0.5)",
                    strokeColor: "rgba(92,127,238,0.8)",
                    highlightFill: "rgba(92,127,238,0.75)",
                    highlightStroke: "rgba(92,127,238,1)",
                    data: [tipo1, tipo2, tipo3, tipo4]
                }
            ]
        }

        window.onload = function() {
            var ctx = document.getElementById("chart-area").getContext("2d");
            window.myPolarArea = new Chart(ctx).PolarArea(polarData, {
                responsive: true
            });

            var ctx = document.getElementById("canvas").getContext("2d");
            window.myBar = new Chart(ctx).Bar(barChartData, {
                responsive: true
            });

            var ctx = document.getElementById("chart-area2").getContext("2d");
            window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
                responsive: true});

        };
    </script>

    <div class="modal fade" id="modalTipo1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Apólices envolvidas de 1 a 3 ocorridos</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr style="background-color: #5C7FE3;">
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Apólice</label></td>
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Quantidade Ocorridos</label></td>
                        </tr>
                        <script>
                            if (tipo1 == 0) {
                                document.write("<p align='center' style='font-weight: bold; font-size: 14;'>NENHUMA APÓLICE ENCONTRADA!</p>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                            } else {
                                for (var i = 0; i <= qtdOcorrido.length - 1; i++) {
                                    document.write("<tr style='border-bottom:1px solid;'>")
                                    if (qtdOcorrido[i] <= 3) {
                                        document.write("<td><a href='ApoliceReadId.mtw?apolice=" + apolice[i] + "'><p style='padding: 0px; margin: 0px;'>" + apolice[i] + "</p></a></td>");
                                        document.write("<td><p style='padding: 0px; margin: 0px;'>" + qtdOcorrido[i] + "</p></td>");
                                    }
                                    document.write("</tr>")
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalTipo2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Apólices envolvidas de 4 a 7 ocorridos</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr style="background-color: #5C7FE3;">
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Apólice</label></td>
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Quantidade Ocorridos</label></td>
                        </tr>
                        <script>
                            if (tipo2 == 0) {
                                document.write("<p align='center' style='font-weight: bold; font-size: 14;'>NENHUMA APÓLICE ENCONTRADA!</p>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                            } else {
                                for (var i = 0; i <= qtdOcorrido.length - 1; i++) {
                                    document.write("<tr style='border-bottom:1px solid;'>")
                                    if (qtdOcorrido[i] >= 4 && qtdOcorrido[i] <= 7) {
                                        document.write("<td><a href='ApoliceReadId.mtw?apolice=" + apolice[i] + "'><p style='padding: 0px; margin: 0px;'>" + apolice[i] + "</p></a></td>");
                                        document.write("<td><p style='padding: 0px; margin: 0px;'>" + qtdOcorrido[i] + "</p></td>");
                                    }
                                    document.write("</tr>")
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalTipo3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Apólices envolvidas de 8 a 10 ocorridos</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr style="background-color: #5C7FE3;">
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Apólice</label></td>
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Quantidade Ocorridos</label></td>
                        </tr>
                        <script>
                            if (tipo3 == 0) {
                                document.write("<p align='center' style='font-weight: bold; font-size: 14;'>NENHUMA APÓLICE ENCONTRADA!</p>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                            } else {
                                for (var i = 0; i <= qtdOcorrido.length - 1; i++) {
                                    document.write("<tr style='border-bottom:1px solid;'>")
                                    if (qtdOcorrido[i] >= 8 && qtdOcorrido[i] <= 10) {
                                        document.write("<td><a href='ApoliceReadId.mtw?apolice=" + apolice[i] + "'><p style='padding: 0px; margin: 0px;'>" + apolice[i] + "</p></a></td>");
                                        document.write("<td><p style='padding: 0px; margin: 0px;'>" + qtdOcorrido[i] + "</p></td>");
                                    }
                                    document.write("</tr>")
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalTipo4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Apólices envolvidas em mais de 10 ocorridos</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr style="background-color: #5C7FE3;">
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Apólice</label></td>
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Quantidade Ocorridos</label></td>
                        </tr>
                        <script>
                            if (tipo4 == 0) {
                                document.write("<p align='center' style='font-weight: bold; font-size: 14;'>NENHUMA APÓLICE ENCONTRADA!</p>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                            } else {
                                for (var i = 0; i <= qtdOcorrido.length - 1; i++) {
                                    document.write("<tr style='border-bottom:1px solid;'>")
                                    if (qtdOcorrido[i] > 10) {
                                        document.write("<td><a href='ApoliceReadId.mtw?apolice=" + apolice[i] + "'><p style='padding: 0px; margin: 0px;'>" + apolice[i] + "</p></a></td>");
                                        document.write("<td><p style='padding: 0px; margin: 0px;'>" + qtdOcorrido[i] + "</p></td>");
                                    }
                                    document.write("</tr>")
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalTipo5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Apólices com aplicativos registrados</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr style="background-color: #5C7FE3;">
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Apólice</label></td>
                        </tr>
                        <script>
                            if (tipo6 == 0) {
                                document.write("<p align='center' style='font-weight: bold; font-size: 14;'>NENHUMA APÓLICE ENCONTRADA!</p>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                            } else {
                                for (var i = 0; i <= registro.length - 1; i++) {
                                    document.write("<tr style='border-bottom:1px solid;'>")
                                    if (registro[i] == 1) {
                                        document.write("<td><a href='ApoliceReadId.mtw?apolice=" + apolice[i] + "'><p style='padding: 0px; margin: 0px;'>" + apolice[i] + "</p></a></td>");
                                    }
                                    document.write("</tr>")
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalTipo6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Apólices com aplicativos não registrados</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr style="background-color: #5C7FE3;">
                            <td><label style="font-weight: bold; font-size: 14; color: #FFF;">Apólice</label></td>
                        </tr>
                        <script>
                            if (tipo5 == 0) {
                                document.write("<p align='center' style='font-weight: bold; font-size: 14;'>NENHUMA APÓLICE ENCONTRADA!</p>");
                                document.write("<td><p style='padding: 0px; margin: 0px;'>---</p></td>");
                            } else {
                                for (var i = 0; i <= registro.length - 1; i++) {
                                    document.write("<tr style='border-bottom:1px solid;'>")
                                    if (registro[i] == 0) {
                                        document.write("<td><a href='ApoliceReadId.mtw?apolice=" + apolice[i] + "'><p style='padding: 0px; margin: 0px;'>" + apolice[i] + "</p></a></td>");
                                    }
                                    document.write("</tr>")
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> Fechar</button>
                </div>
            </div>
        </div>
    </div>
</div>