<%
String paginaActual = request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : "");

// Guardar la página en la sesión solo si no es el login
if (session.getAttribute("usuario") == null && !paginaActual.contains("login.jsp")) {
    session.setAttribute("paginaPrevia", paginaActual);
    response.sendRedirect("/jsp/login.jsp");
    return;
}
%>
