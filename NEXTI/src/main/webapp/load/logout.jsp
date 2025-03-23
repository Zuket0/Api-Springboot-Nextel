<%
    session.invalidate(); // Destruye la sesión
    response.sendRedirect("/jsp/login.jsp"); // Redirige al login
%>