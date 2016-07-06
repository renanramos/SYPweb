<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("jsp/teste/teste.jsp");
    }
%>
