<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mtw" uri="http://www.mentaframework.org/tags-mtw/"%>
<%@include file="../../WEB-INF/imports.jspf"%>
<%@taglib prefix="template" uri="/template"%>

<!-- LOGOUT -->


<div class="user-strip">
    <ul class="nav" style="list-style-type:none; margin-top: 25px !important;">                            
        <li>
            <span data-toggle="dropdown" style="background: #0075e5; padding: 5px 10px; color:#FFFFFF;font-size:13px;font-weight: 500; border-radius:3px; cursor: pointer;">                                   
                <i class="icon icon-user "></i>&nbsp;&nbsp;${usuarioLogado.nome}<span class="caret"></span></span>
            <ul class="dropdown-menu">
                <li>
                    <a href="PerfilRead.mtw"><i class="icon-th-list" ></i>&nbsp;&nbsp;Perfil</a>
                </li>                
                <li>
                    <a href="AlterarSenha.mtw"><i class="icon-key" ></i>&nbsp;&nbsp;Alterar senha</a>
                </li>                
                <li class="divider"></li>
                <li>
                    <a href="Logout.mtw"><i class="icon-power-off"></i>&nbsp;&nbsp;Sair</a>
                </li>
            </ul>
        </li>
    </ul>
</div>