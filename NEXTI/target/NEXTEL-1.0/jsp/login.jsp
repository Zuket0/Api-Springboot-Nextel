<%@page import="controller.UsuarioController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ include file="/load/verificarSesion.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Icon Nextel -->
        <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
        <!-- Enlace de los iconos -->
        <script src="https://kit.fontawesome.com/d06af9e14f.js" crossorigin="anonymous"></script> 
        <!-- Enlace de CSS -->
        <link rel="stylesheet" href="/CSS/Login.css">
        <link rel="stylesheet" href="/CSS/NavBar.css">
        <link rel="stylesheet" href="/CSS/Footer.css">
        
        <title>Inicio Sesion | Nextel</title>
    </head>

    <body>
        
    <header>
        <div class="HeaderNav">
            <div class="logo_container">
            <a href="/jsp/index.jsp"><img src="/Pr_Cel/Nextel_Logo.png" alt="logo"></a></div>

        <!-- Botón del menú hamburguesa -->
        <div class="menu-toggle">
            <i class="fas fa-bars"></i>
        </div>
            
            <nav class="navbar">
                <ul>
                    <li><a href="/jsp/index.jsp">Inicio</a></li>
                    <li><a href="/jsp/Productos.jsp">Productos</a></li>
                    <li><a href="/jsp/Soporte.jsp">Soporte</a></li>
                    <li><a href="/jsp/Contactanos.jsp">Contáctanos</a></li>
                </ul>
            </nav>
            <div class="icons">
                <% if (session.getAttribute("usuario") == null) { %>
                    <!-- Si no hay sesión, mostrar botón "Iniciar Sesión" -->
                    <a href="/jsp/login.jsp" class="login-button">Iniciar Sesión</a>

                <% } else { %>
                    <!-- Si hay sesión, mostrar el icono de usuario con el menú desplegable -->
                    <div class="user-menu">
                        <i class="fa-solid fa-user user-icon" onclick="toggleMenu()"></i>
                    <div class="dropdown-menu" id="userDropdown" >
                        <a href="#"><i class="fa-solid fa-user-circle"></i> Mi cuenta</a>
                        <a href="#"><i class="fa-solid fa-box"></i> Mis pedidos</a>
                        <a href="/load/logout.jsp" class="logout"><i class="fa-solid fa-sign-out-alt"></i> Cerrar sesión</a>
                    </div>

                    </div>
                <% } %>

                <!-- Icono del carrito -->
                <div class="Carritox">
                    <i class="fa-solid fa-cart-plus"></i>
                </div>
            </div>

        </div>
    </header> 
    
    
    <main>
        
        
        <%
        if (request.getMethod().equals("POST")) {
            String email = request.getParameter("email");
            String contrasena = request.getParameter("contrasena");

            // Crear una instancia del controlador
            UsuarioController usuarioController = new UsuarioController();

            // Verificar las credenciales del usuario utilizando el controlador
            boolean inicioSesionExitoso = usuarioController.verificarCredenciales(email, contrasena);

                if (inicioSesionExitoso) {
                    session.setAttribute("usuario", email);

                    // Obtener la página previa desde la sesión
                    String paginaPrevia = (String) session.getAttribute("paginaPrevia");

                    // Si hay una página previa guardada, redirigir ahí; si no, ir al index
                    if (paginaPrevia != null && !paginaPrevia.contains("login.jsp")) {
                        session.removeAttribute("paginaPrevia"); // Eliminar la variable para evitar problemas futuros
                        response.sendRedirect(paginaPrevia);
                    } else {
                        response.sendRedirect("/jsp/index.jsp");
                    }
            } else {
                out.println("Las credenciales son incorrectas. Inténtalo de nuevo.");
            }
        }
        %>

        <%
            String redirectURL = request.getParameter("redirect");

            // Si hay una URL previa válida, guardarla en la sesión
            if (redirectURL != null && !redirectURL.contains("login.jsp")) {
                session.setAttribute("paginaPrevia", redirectURL);
            }
        %>

        

        <div class="Login-container">
            <h1>Iniciar Sesión</h1><br>
            <p class="subtitle">¡Que bueno tenerte de vuelta!</p>

            <form class="login_formulario" method="POST">
                <input type="hidden" name="redirect" value="<%= request.getHeader("referer") %>">
                <div class="input-container">
                    <input type="text" name="email" id="email" placeholder="Correo electrónico" required maxlength="40">
                    <i class="fa-solid fa-envelope" style="position: absolute; margin-left: -30px; color: gray;"></i>
                </div>
                <div class="input-container">
                    <input type="password" name="contrasena" id="contrasena" placeholder="Contraseña" required maxlength="40">
                    <i class="fa-solid fa-eye toggle-password" style="cursor: pointer; margin-left: -30px;"></i>
                </div>
                <button type="submit" class="ingresarbtn">INICIAR SESIÓN</button>
            </form>

                <p class="register">¿No tienes una cuenta? <a href="register.jsp">Regístrate</a></p>
        </div>
        
        
        </main>   
        
            <div class="ButtonWhatsApp">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
                <a href="https://api.whatsapp.com/send?phone=+51993393418&text=Hola, me gustaria Obtener más información" class="float pulse" target="_blank">
                <i class="fa fa-whatsapp my-float "></i>
                </a>
            </div>
        
        <hr style="width: 100%; background-color: white;">
        <footer class="footer">
            <div class="containerr">
                <div class="row">
                    <div class="footer-col">
                    <h4>Páginas</h4>
                    <ul>
                        <li><a href="/jsp/index.jsp">Inicio</a></li>
                        <li><a href="/jsp/Productos.jsp">Productos</a></li>
                        <li><a href="/jsp/Soporte.jsp">Servicio Técnico</a></li>
                        <li><a href="/jsp/Contactanos.jsp">Contáctanos</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Soporte</h4>
                    <ul>
                        <li><a href="/jsp/Contactanos.jsp">Contáctanos</a></li>
                            <li><a href="/Footer/WorkwUs.jsp">Trabaja con Nosotros</a></li>
                            <li><a href="/Footer/Politics.jsp">Politicas de Privacidad</a></li>
                            <li><a href="/Footer/Terms.jsp">Términos y Condiciones</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Recursos</h4>
                        <ul>
                            <li><a href="/Footer/Tutos.html">Tutoriales y Guías</a></li>
                            <li><a href="https://checatuimei.renteseg.osiptel.gob.pe/consultaIMEI.xhtml" target="_blank">Consulta de IMEI</a></li>
                            <li><a href="/Pr_Cel/otros/Llamada-por-llamada.pdf" target="_blank">Llamada por llamada</a></li>
                            <li><a href="https://fast.com/es/" target="_blank">Test de Velocidad de Internet</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Siguenos</h4>
                        <div class="rrss">
                            <a href="https://www.instagram.com/ju44n.x/?hl=es" target="_blank"><i class="fab fa-instagram"></i></a>
                            <a href="https://www.facebook.com/NEXTELCORP/?locale=es_LA" target="_blank"><i class="fab fa-facebook"></i></a>
                            <a href="https://www.tiktok.com/@loopbarlima" target="_blank"><i class="fab fa-tiktok"></i></a>
                            <a href="https://www.youtube.com/@NextelPeruSA" target="_blank"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>       
 
        <script src="/js/LogReg.js"></script>
        
    </body>
</html>