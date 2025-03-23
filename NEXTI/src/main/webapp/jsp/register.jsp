<%@page import="controller.ClienteController"%>
<%@page import="model.Cliente"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro | Nextel</title>
    <!-- Enlace de los iconos -->
    <script src="https://kit.fontawesome.com/d06af9e14f.js" crossorigin="anonymous"></script> 
    <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
    <link rel="stylesheet" href="/CSS/Login.css">
    <link rel="stylesheet" href="/CSS/NavBar.css">
    <link rel="stylesheet" href="/CSS/Footer.css">

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
                    <a href="/jsp/login.jsp?redirect=<%= request.getRequestURI() + (request.getQueryString() != null ? "?" + request.getQueryString() : "") %>" class="login-button">Iniciar Sesión</a>


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
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String email = request.getParameter("email");
            String contrasena = request.getParameter("contrasena");
            long numero_cli = Long.parseLong(request.getParameter("numero_cli"));

            // Verificar que la contraseña no esté vacía
            if (contrasena == null || contrasena.trim().isEmpty()) {
                out.println("<p style='color:red;'>La contraseña no puede estar vacía.</p>");
            } else {
                // Crear un objeto Cliente con los parámetros recibidos
                Cliente cliente = new Cliente(id, nombre, apellidos, email, contrasena, numero_cli);

                // Crear una instancia del controlador
                ClienteController clienteController = new ClienteController();

                // Llamar al método registrarCliente del controlador para insertar el cliente en la base de datos
                clienteController.registrarCliente(cliente);

                // Redirigir a la página de login tras el registro exitoso
                response.sendRedirect("login.jsp");
            }
        }
    %>
        
        
        <div class="signupFrm">
            <h1>Regístrate</h1><br>
            <p class="subtitle">Por favor, rellene los siguientes campos:</p>
            
            <form id="registerForm" class="register-form" method="POST">
                
            <!-- Paso 1 -->
            <div id="step1" class="step">
                <div class="input-container">
                    <input type="text" name="nombre" placeholder="Nombre" required maxlength="20" oninput="limitLength(this, 20)">
                </div>
                <div class="input-container">
                    <input type="text" name="apellidos" placeholder="Apellido" required maxlength="20" oninput="limitLength(this, 20)">
                </div>
                <button type="button" class="next-button">Continuar</button>
            </div>

            <!-- Paso 2 -->
            <div id="step2" class="step" style="display:none;">
                <div class="input-container">
                    <input type="number" name="id" placeholder="DNI" required minlength="8" maxlength="8" oninput="limitLength(this, 8, 8)">
                </div>
                <div class="input-container">
                    <input type="number" name="numero_cli" placeholder="Número de Celular" required minlength="9" maxlength="9" oninput="limitLength(this, 9, 9)">
                </div>
                <button type="button" class="next-button">Continuar</button>
            </div>

            <!-- Paso 3 -->
            <div id="step3" class="step" style="display:none;">
                <div class="input-container">
                    <input type="email" name="email" placeholder="Correo electrónico" required maxlength="40" oninput="limitLength(this, 40)">
                    <i class="fa-solid fa-envelope" style="margin-left: -30px; color: gray;"></i>
                </div>
                <div class="input-container">
                    <input type="password" name="contrasena" placeholder="Contraseña" required maxlength="40" oninput="limitLength(this, 40)">
                    <i class="fa-solid fa-eye toggle-password" style="cursor: pointer; margin-left: -30px;"></i>
                </div>
                <button type="submit">Registrarme</button>
            </div>


            </form>
            <p class="register">¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión</a></p>
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

