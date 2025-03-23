
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Soporte | Nextel</title>
      <!-- Icon Nextel -->
      <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
      <link rel="stylesheet" href="/CSS/Servicio Tecnico.css">
      <link rel="stylesheet" href="/CSS/Footer.css">
      <link rel="stylesheet" href="/CSS/NavBar.css">      
      <script src="https://kit.fontawesome.com/b7a335906c.js" crossorigin="anonymous"></script>

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
        <h1 class="support_title">Soporte en Línea</h1>
        <div class="perspective-element"></div>

        <div class="support_container">
            <div class="support_whatsapp">
                <h2 class="cardTitle">Dudas</h2>
                <p>Ayudarte ahora es más fácil a través de nuestro chat de Whatsapp Disponible 24 horas al día.</p>
                <button class="btnCell" type="button">
                <a href="https://wa.me/51993393418?text=Hola, quiero información general sobre su servicio" target="_blank">Escribenos un mensaje</a></button>
            </div>
            <div class="support_chat">
                <h2 class="cardTitle">Soporte por Chat</h2>
                <p>Recibe soporte para tus productos 24/7</p>
                <button class="btnCell" type="button">
                <a href="https://wa.me/51993393418?text=Hola, quiero solicitar soporte tecnico" target="_blank">Soporte por chat</a></button>
            </div>
            <div class="support_asistencia">
                <h2 class="cardTitle">Solicita asistencia</h2>
                <p>¿Tienes alguna pregunta sobre tu producto?<br>Consúltanos y te contactaremos</p>
                <button class="btnCell" type="button">
                    <a href="https://wa.me/51993393418?text=Buenas, tengo duda sobre uno de sus productos" target="_blank">
                        Solicita asistencia</a>
                </button>
            </div>
            <div class="support_mail">
                <h2 class="cardTitle">Envíanos un correo</h2>
                <p>Recibe soporte para el modelo especifico de producto  24/7</p>
                <button class="btnCell" type="button"><a href="/Contactanos.html">Envíanos un correo Nextel@gmail.com</a></button>
            </div>
            <div class="support_estado">
                <h2 class="cardTitle">Estado de mi reparación</h2>
                <p>Aquí podrás escribirnos para saber el estado de tu producto</p>
                <button class="btnCell" type="button">
                    <a href="https://wa.me/51993393418?text=Buenas, quisiera saber el estado de mi dispositivo en reparación" target="_blank">
                        Estado de mi reparación</a>
                </button>
            </div>
            <div class="support_sugerencia">
                <h2 class="cardTitle">Sugerencias</h2>
                <p>Envía una sugerencia a nuestro chat para mejorar nuestro servicio</p>
                <button class="btnCell" type="button">
                    <a href="https://wa.me/51993393418?text=Buenas, quisiera dar una sugerencia sobre su servicio" target="_blank">
                        Sugerencia al chat</a>
                </button>
            </div>
        </div>
        
            <div class="ButtonWhatsApp">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
                <a href="https://api.whatsapp.com/send?phone=+51993393418&text=Hola, me gustaria Obtener más información" class="float pulse" target="_blank">
                <i class="fa fa-whatsapp my-float "></i>
                </a>
            </div>      
        
    </main>
        
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
