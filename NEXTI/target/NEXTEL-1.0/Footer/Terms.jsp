
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Icon Nextel -->
      <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="stylesheet" href="/CSS/Footer.css">
      <link rel="stylesheet" href="/CSS/estilos.css">
      <link rel="stylesheet" href="/CSS/Styles.css">
      <link rel="stylesheet" href="/CSS/NavBar.css">
      
      <title>Términos y Condiciones | Nextel </title>
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
            
        <div class="Parrafos">
            <h1>AVISO LEGAL DEL USO DEL SITIO WEB</h1>
            <h2>1. Obligaciones del usuario</h2>
        
            <p>El Usuario se obliga a hacer uso de este Sitio únicamente para fines lícitos y/o en forma diligente
                 y correcta.En ese sentido, en forma enunciativa y no limitativa, el Usuario no deberá utilizar el
                  Sitio para la realización de actividades contrarias a la ley, a las presentes Condiciones, a la moral,
                   a las buenas costumbres o al orden público establecido y/o con fines o efectos ilícitos, prohibidos
                    o lesivos de derechos e intereses de terceros, ni para procesar, enviar o trasmitir a través del
                     Sitio material, información o contenidos que puedan ser considera- dos de algún modo ilegal,
                      amenazante, abusivo, invasivo, difamatorio, obsceno, sexualmente explícito, racista, vulgar,
                       profano o que resulte reprobable de alguna manera o afecte derechos civiles o alguna norma legal.
            </p>
        
            <p>El Usuario está prohibido de efectuar, realizar o transmitir cualquier comunicación o contenido que,
                 a sólo y mero arbitrio de Claro, sea dañino u objetable para cualquier otro usuario, tercero o para
                  Nextel, o violatorio de las prerrogativas o derechos de Nextel o de cualquier tercero, o violatorio
                   de cualquier norma legal aplicable.</p>
        
            <p>El Usuario está prohibido de: (a) anotar o reproducir cualquier información no pública o privada sobre 
                cualquier persona natural o jurídica sin la debida autorización previa para hacerlo, (b) proveer 
                información falsa cuando, de ser el caso, se registre o información o datos que interesen o conciernan 
                a otra persona, (c) transmitir en cualquier forma o distribuir cualquier material que contenga virus, 
                caballos de Troya, gusanos o cualquier otro elemento dañino o potencialmente dañino, (d) recoger o, de 
                cualquier forma, obtener indebidamente información sobre terceros, incluyendo direcciones de correo
                 electrónico, sin el previo consentimiento del interesado, (e) anotar, reproducir o transmitir cualquier
                  material que contenga publicidad o solicitudes con respecto a productos o servicios, sin la previa
                   autorización de Nextel.</p>

            <p>El Usuario declara y acepta que Nextel no será responsable en forma alguna por cualquier difamación,
                 conducta objetable, ofensiva o ilegal del o hacia el propio Usuario, de o hacia otros usuarios o de
                  o hacia tercera personas, que se produzca mediante el uso del Sitio y que el riesgo y responsabilidad
                   por los eventuales daños que se pueden causar es asumida íntegramente por el propio Usuario.</p>

            <p>Cada cliente se compromete y garantiza que los Datos Personales que suministre a NEXTEL son veraces
                 y actuales. En tal sentido, será el responsable de comunicar oportunamente a NEXTEL mediante las vías
                  establecidas por éste, sobre cualquier corrección o modificación que se produzca en ellos.</p>
            

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
                        <a href="https://www.facebook.com/juancarlos.1804v/" target="_blank"><i class="fab fa-facebook"></i></a>
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