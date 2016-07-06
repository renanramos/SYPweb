<%-- 
    Document   : relatorioForm
    Created on : 07/10/2014, 19:10:19
    Author     : Renan Rodrigues Ramo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/imports.jspf" %>
<!DOCTYPE html>
<!-- TITULO DA PAGINA -->
<div class="page-header">
    <div class="container">
        <h3 id="tituloPagina">Relatório<small class="pull-right hidden-xs"></small></h3>
    </div>			
</div>

<mtw:form action="RelatorioForm.mtw" >       
    <mtw:checkboxes list="tipoEventoOptions" name="tipoEvento"/><br>
    <input type="checkbox" name="todosEventos" value="Todos"/>Todos<br>
    <input name="enviar" type="submit"  value="Gerar Relatório"/>
</mtw:form>