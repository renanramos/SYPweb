<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mtw" uri="http://www.mentaframework.org/tags-mtw/"%>
<%@include file="../../WEB-INF/imports.jspf"%>
<%@taglib prefix="template" uri="/template"%>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="<c:url value="includes/img/icons/favicon.png"/>">

        <title>.:: SYPSeguros ::.</title>

        <link href="<c:url value="/includes/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" media="screen">
        <link href="<c:url value="/includes/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
        <link href="<c:url value="/includes/bootstrap/font-awesome/css/font-awesome.css"/>" rel="stylesheet">
        <link href="<c:url value="/includes/css/tabela.css"/>" rel="stylesheet" media="screen">
        <link href="<c:url value="/includes/themes/syp/style.css"/>" rel="stylesheet">

        <!-- jQuery UI CSS -->
        <link href="//code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" type="text/css" rel="stylesheet">

        <!-- Tokenfield CSS -->
        <link href="<c:url value="/includes/css/autocomplete/bootstrap-tokenfield.css"/>" type="text/css" rel="stylesheet">      

        <!-- FAGNER: NÃO REMOVER
        <link href="<:url value="/includes/css/autocomplete/token-input.css"/>" rel="stylesheet" />
        <link href="<:url value="/includes/css/autocomplete/token-input-facebook.css"/>" rel="stylesheet" />
        -->    
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    </head>
    <body>
        <template:block id="menu"/>
        <div id="content-area" style="margin-left: 160px;">
            <template:block id="header"/>
            <template:block id="body"/>
            <template:block id="footer"/>
        </div>
    </body>
</html>