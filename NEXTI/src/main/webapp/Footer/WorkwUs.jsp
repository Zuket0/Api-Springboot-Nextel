
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trabaja con nosotros | Nextel</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Icon Nextel -->
        <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
        <link rel="stylesheet" href="/CSS/Styles.css">
        <link rel="stylesheet" href="/CSS/Footer.css">
        <link rel="stylesheet" href="/CSS/estilos.css">
        <link rel="stylesheet" href="/CSS/NavBar.css">      
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
        
       <div class="Work">
            <h1 style="color:#fa6a09; font-weight: bold;">Que es Nextel?</h1>
            
            <p>En Nextel, somos una compañía dedicada a transformar la manera en que los peruanos
                se conectan con el mundo. Nos enfocamos en brindar servicios de calidad que permitan
                a nuestros clientes disfrutar de la tecnología más avanzada a precios accesibles.</p>
            
            <p>Desde nuestros inicios, nos hemos comprometido a impulsar el desarrollo personal y
                profesional de miles de peruanos, ofreciéndoles soluciones tecnológicas innovadoras
                adaptadas a sus necesidades. Nos destacamos por nuestro esfuerzo constante en
                proporcionar una experiencia de compra única, con un catálogo variado de celulares
                de última generación, servicios de atención al cliente excepcionales y un enfoque 
                en el crecimiento de nuestra comunidad.</p>
            
            <p>Nuestra misión es clara: ser aliados confiables en el camino hacia un futuro
                conectado, asegurándonos de que cada cliente reciba productos y servicios que 
                mejoren su calidad de vida y les permitan estar siempre un paso adelante en un
                mundo cada vez más digital.</p>
            
            <p>En Nextel, trabajamos día a día para hacer realidad el sueño de miles de personas,
                apoyando su crecimiento y contribuyendo al progreso del Perú.</p>
            
            <iframe width="560" height="315" src="https://www.youtube.com/embed/5i4vkGAIjZA?si=NdFCqd46qildk1uR" 
                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write;
                    encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            
        <div class="section-container">
            
            <div class="postula" style="text-align: center;">
                <a href=""><img src="/Pr_Cel/Postula.png"></a>
            </div><br>            
            
            <div class="beneficios">
                <h2>Beneficios de Trabajar en Nextel</h2>
                <ul>
                    <li>
                        <i class="fas fa-chart-line"></i>
                        <p>Oportunidades de desarrollo profesional</p>
                    </li>
                    <li>
                        <i class="fas fa-book-open"></i>
                        <p>Capacitación constante</p>
                    </li>
                    <li>
                        <i class="fas fa-users"></i>
                        <p>Ambiente laboral dinámico e inclusivo</p>
                    </li>
                    <li>
                        <i class="fas fa-gift"></i>
                        <p>Programas de incentivos y reconocimientos</p>
                    </li>
                    <li>
                        <i class="fas fa-tags"></i>
                        <p>Descuentos en productos y servicios</p>
                    </li>
                </ul>
            </div>          
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        
        <script src="/js/LogReg.js"></script> 
    </body>
</html>

