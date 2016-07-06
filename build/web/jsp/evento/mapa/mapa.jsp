<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../../WEB-INF/imports.jspf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
        <link rel="shortcut icon" href="includes/img/icons/favicon.png">

        <title>.:: SYPSeguros ::.</title>

        <link rel="stylesheet" href="http://js.arcgis.com/3.9/js/dojo/dijit/themes/claro/claro.css"/>
        <link rel="stylesheet" href="http://js.arcgis.com/3.9/js/esri/css/esri.css"/>
        <link rel="stylesheet" href="./includes/css/bootstrap-responsive.css"/>
        <link rel="stylesheet" href="./includes/css/bootstrap-responsive.min.css"/>
        <link rel="stylesheet" href="./includes/css/bootstrap.css"/>
        <link rel="stylesheet" href="./includes/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./includes/css/reset.css"/>

        <link href="./includes/bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="./includes/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="./includes/themes/syp/style.css" rel="stylesheet">
        <style>
            #map {
                height:70%;
                width:100%;
                margin: 0;
                padding: 0;
                float: left;
                margin-left: 20px;
            }
            #BasemapToggle {
                position: absolute;
                top: 95px;
                right: 30px;
                z-index: 1;
            }
            #address, #reverse{
                width:300px;
            } 
            #box{
                z-index: 1;
                height:70%;
                width:70%;
                margin-top: 600px;
                padding: 600px;
            }
            @-webkit-keyframes
            pulse
            {
                0%
                {
                opacity: 1.0;

            }
            45%
            {
                opacity: .20;

            }
            100%
            {
                opacity: 2.0;

            }
            }

            @-moz-keyframes
            pulse
            {
                0%
                {
                opacity: 1.0;
            }
            45%
            {
                opacity: .20;

            }
            100%
            {
                opacity: 1.0;
            }
            }

            #map_graphics_layer {
                -webkit-animation-duration: 5s;
                -webkit-animation-iteration-count: infinite;
                -webkit-animation-name: pulse;
                -moz-animation-duration: 5s;
                -moz-animation-iteration-count: infinite;
                -moz-animation-name: pulse;
            }
            
        </style>
        <script src="http://js.arcgis.com/3.11/"></script>
        <script>
            function init(lo, la, evento) {
                var lat = la;
                var longi = lo;
                //var precisao = prec*10;
                var even = evento;
                var imgEvento = "";
                var map;
                
                if (even == "Acidente") {
                    imgEvento = "includes/img/ico_acidente.png"
                } else if (even == "Colisão") {
                    imgEvento = "includes/img/ico_colisao.png"
                } else if (even == "Furto") {
                    imgEvento = "includes/img/ico_furto.png"
                } else if (even == "Pane") {
                    imgEvento = "includes/img/ico_pane.png"
                } else if (even == "Roubo") {
                    imgEvento = "includes/img/ico_roubo.png"
                } else {
                    imgEvento = ""
                }
                        
                require([
                    "esri/map", "esri/geometry/Point", "esri/dijit/HomeButton", "esri/tasks/locator",
                    "esri/symbols/SimpleMarkerSymbol", "esri/graphic", "esri/dijit/BasemapToggle",
                    "dojo/_base/array", "dojo/dom-style", "dojox/widget/ColorPicker", "esri/InfoTemplate", "dojo/dom",
                    "dojo/domReady!"
                ], function(
                Map, Point, HomeButton, Locator,
                SimpleMarkerSymbol, Graphic, BasemapToggle,
                arrayUtils, domStyle, ColorPicker, InfoTemplate, dom
            ) {
                    map = new Map("map", {
                        basemap: "streets", //"satellite", "hybrid", "topo", "gray", "oceans", "osm", "national-geographic", "streets"
                        center: [longi, lat],
                        zoom: 15
                    });
                    var locator = new Locator("http://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer");
                    map.on("load", mapLoaded);

                    function mapLoaded() {

                        var points = [longi, lat];
                        //var initColor = "#000000";
                        var imagem = new esri.symbol.PictureMarkerSymbol({
                            "type": "esriPMS",
                            "url": imgEvento,
                            "contentType": "image/png",
                            "color": null,
                            "width": 25,
                            "height": 39,
                            "angle": 0,
                            "xoffset": 0,
                            "yoffset": 15
                        });
                        var symbol = new SimpleMarkerSymbol({
                            "color": [205, 255, 255, 64],
                            "angle": 10,
                            "size": 1,
                            "xoffset": 0,
                            "yoffset": 0,
                            "type": "esriSMS",
                            "style": "esriSMSCircle",
                            "outline": {
                                "color": [0, 0, 0, 145],
                                "width": 0.5,
                                "type": "esriSLS",
                                "style": "esriSLSSolid"
                            }
                        });
                        //var raio = precisao * 2;
                        //symbol.setSize(raio);
                        var RANGE_IN_METERS = 30;

                        locator.locationToAddress(new Point([longi, lat]), RANGE_IN_METERS, function(item) {

                            var address = item.address.address;

                            var endereco = item.address.Address;
                            dom.byId('endereco').value = endereco;
                            var cep = item.address.Postal;
                            dom.byId('cep').value = cep;
                            var cidade = item.address.City;
                            dom.byId('cidade').value = cidade;
                            var estado = item.address.Region;
                            dom.byId('estado').value = estado;

                            var infoTemplate = new InfoTemplate("Evento: <b>"+even+"</b>", "<b>Informações do local</b><br><b>Endereco:	</b>" + endereco + "<br><b>Cidade: </b>" + cidade + "<br>" +
                                "<b>Estado: </b>" + estado + "<br><b>CEP: </b>" + cep + "<br><br><br><b>Coodernadas</b><br><b>Latitude: </b>"+lat+"<br><b>Longitude: </b>"+longi+"<br><br><span style='text-align: center;'>SYP Seguros</span>");

                            var grafico = new Graphic(new Point([longi, lat]), symbol, address, infoTemplate);
                            map.graphics.add(grafico);

                            var grafico = new Graphic(new Point([longi, lat]), imagem, address, infoTemplate);
                            map.graphics.add(grafico);

                            map.infoWindow.setTitle("Evento: <b>"+even+"</b>");
                            map.infoWindow.setContent("<b>Informações do local</b><br><b>Endereco:	</b>" + endereco + "<br><b>Cidade: </b>" + cidade + "<br>" +
                                "<b>Estado: </b>" + estado + "<br><b>CEP: </b>" + cep + "<br><br><br><b>Coodernadas</b><br><b>Latitude: </b>"+lat+"<br><b>Longitude: </b>"+longi+"<br><br><span style='text-align: center;'>SYP Seguros</span>");

                            var screenPnt = map.toScreen(new Point([longi, lat]));
                            map.infoWindow.resize(350,450);
                            map.infoWindow.show(new Point([longi, lat]), map.onload);

                        });
                    };

                    var toggle = new BasemapToggle({
                        map: map,
                        basemap: "hybrid"
                    }, "BasemapToggle");
                    toggle.startup();
                });
            }
        </script>
    </head>

    <input id="sMenu" value="max" type="hidden" />
    <body onLoad="init(lo.value, la.value, evento.value);">

        <input type="hidden"  id="la" value="${evento.latitude}"/>
        <input type="hidden"  id="lo" value="${evento.longitude}"/>
        <input type="hidden"  id="prec" value="${evento.precisao}">
        <input type="hidden"  id="evento" value="${evento.tipoEvento.nome}"/>
        <input type="hidden" class="form-control" id="cidade" />
        <input type="hidden" class="form-control" id="estado"/>
        <input type="hidden" class="form-control" id="endereco" />
        <input type="hidden" class="form-control" id="cep"/>

        <!-- TITULO DA PAGINA -->
        <div class="page-header">
            <div class="container" style="margin-left: 0;">
                <h3 id="tituloPagina">Localização do Evento<small class="pull-right hidden-xs"></small></h3>
            </div>			
        </div>

        <style>
            .titleTab {
                font-weight: bold;
            }
        </style>

        <!-- MAPA -->
        <div class="container" style="min-width: 100%; min-height: 200px;">            
            <!-- APRESENTAÇÃO DO MAPA -->
            <div class="map" id="map">
                <div id="BasemapToggle"></div>
                <img style="position: absolute; left: 800px; top: 400px;" style="margin-right: 200px; margin-top: 100px;" src="./includes/img/carregando.gif">
            </div>
        </div>

        <!-- CONTEUDO DA PAGINA -->
        <div class="panel-group" id="accordion" style="margin-left: 40px; padding-top: 50px; min-height: 530px;">
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
                                <input class="form-control" type="text" value="${apolice.usuario.nome}" placeholder="Nome">
                            </div>
                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>E-mail</span>
                                <input class="form-control" type="text" value="${apolice.usuario.email}" placeholder="Email">
                            </div>

                            <c:if test="${apolice.segurado_pf.cpf == '0'}">  
                                <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                    <span>CNPJ</span>
                                    <input class="form-control" type="text" value="${apolice.segurado_pj.cnpj}" placeholder="CPF">
                                </div> 
                            </c:if>

                            <c:if test="${apolice.segurado_pf.cpf != '0'}">  
                                <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                    <span>CPF</span>
                                    <input class="form-control" type="text" value="${apolice.segurado_pf.cpf}" placeholder="CPF">
                                </div> 
                            </c:if>

                            <c:if test="${apolice.segurado_pf.cpf != '0'}">  
                                <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                    <span>Data Nascimento</span>
                                    <input class="form-control" type="text" value="${data_nascimento}" placeholder="Data Nascimento">
                                </div>
                            </c:if>

                            <c:if test="${apolice.segurado_pf.cpf != '0'}">  
                                <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                    <span>Sexo</span>
                                    <input class="form-control" type="text" value="${apolice.segurado_pf.sexo}" placeholder="Sexo">
                                </div>
                            </c:if>

                            <div class="col-xs-8 col-md-8" style="padding-bottom: 15px;">
                                <span>Município</span>
                                <input class="form-control" type="text" value="${apolice.usuario.cidade.nome}" placeholder="Cidade">
                            </div>

                            <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                                <span>UF</span>
                                <input class="form-control" type="text" value="${apolice.usuario.cidade.estado.nome}" placeholder="Estado">
                            </div>

                            <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                                <span>Telefone</span>
                                <input class="form-control" type="text" value="${apolice.usuario.telefone}" placeholder="Telefone">
                            </div>

                            <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                                <span>Bairro</span>
                                <input class="form-control" type="text" value="${apolice.usuario.bairro}" placeholder="Bairro">
                            </div>

                            <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                                <span>Rua</span>
                                <input class="form-control" type="text" value="${apolice.usuario.rua}" placeholder="Rua">
                            </div>

                            <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                                <span>Número</span>
                                <input class="form-control" type="text" value="${apolice.usuario.numero}" placeholder="N?mero">
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
                                <input class="form-control" type="text" value="${apolice.veiculo.marca}" placeholder="Marca">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>Modelo</span>
                                <input class="form-control" type="text" value="${apolice.veiculo.modelo}" placeholder="Modelo">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>Cor</span>
                                <input class="form-control" type="text" value="${apolice.veiculo.cor}" placeholder="Cor">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>Placa</span>
                                <input class="form-control" type="text" value="${apolice.veiculo.placa}" placeholder="Placa">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>Chassi</span>
                                <input class="form-control" type="text" value="${apolice.veiculo.chassi}" placeholder="Chassi">
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
                                <input class="form-control" type="text" value="${apolice.corretor.registro}" placeholder="Registro">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>CNPJ</span>
                                <input class="form-control" type="text" value="${apolice.corretor.cnpj}" placeholder="CNPJ">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>Telefone</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.telefone}" placeholder="Telefone">
                            </div>

                            <div class="col-xs-8 col-md-8" style="padding-bottom: 15px;">
                                <span>Nome</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.nome}" placeholder="Nome">
                            </div>

                            <div class="col-xs-4 col-md-4" style="padding-bottom: 15px;">
                                <span>E-mail</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.email}" placeholder="Email">
                            </div>

                            <div class="col-xs-10 col-md-10" style="padding-bottom: 15px;">
                                <span>Município</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.cidade.nome}" placeholder="Cidade">
                            </div>

                            <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                                <span>UF</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.cidade.estado.nome}" placeholder="Estado">
                            </div>

                            <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                                <span>Bairro</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.bairro}" placeholder="Bairro">
                            </div>

                            <div class="col-xs-5 col-md-5" style="padding-bottom: 15px;">
                                <span>Rua</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.rua}" placeholder="Rua">
                            </div>

                            <div class="col-xs-2 col-md-2" style="padding-bottom: 15px;">
                                <span>Número</span>
                                <input class="form-control" type="text" value="${apolice.corretor.usuario.numero}" placeholder="N?mero">
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<script>
    
    function rolar_para(elemento) {
        $('html, body').animate({
            scrollTop: $(elemento).offset().top
        }, 2000);
    }
</script>