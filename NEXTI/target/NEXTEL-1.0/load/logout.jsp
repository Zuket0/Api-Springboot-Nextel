<%
    session.invalidate(); // Destruye la sesi�n
    response.sendRedirect("/jsp/login.jsp"); // Redirige al login
%>