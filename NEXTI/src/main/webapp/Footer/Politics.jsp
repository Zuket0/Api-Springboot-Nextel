
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
      
      <title>Politicas de privacidad | Nextel </title>
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
            <h1>POLÍTICAS DE PRIVACIDAD</h1>
            <h2>DECLARACIÓN FORMAL DE COMPROMISO AL CUMPLIMIENTO DE LA LEY DE PROTECCIÓN DE DATOS PERSONALES – LEY 29733 Y SU REGLAMENTO – D.S. 003-2013-JUS</h2>
        
            <p>América Móvil Perú S.A.C. (NEXTEL) reconoce que la seguridad de la información privada
                 proporcionada por sus clientes y terceros merece el mayor interés y cuidado. Asimismo,
                  que aquellos tienen el derecho a conocer la forma en cómo se utilizará y será tratada
                   la información suministrada u obtenida a través de los acuerdos suscritos, de otros
                medios de recopilación legalmente autorizados o, del empleo de cualquiera de nuestros
                 servicios de telecomunicaciones; así como por intermedio de este sitio web accesible
                  a través de la dirección: 
                <a href="https://github.com/Zuket0" target="_blank">www.github.com/Zuket0</a>.
            </p>
        
            <p>En consideración a lo anterior, deseamos que nuestros clientes y terceros sepan cuáles son las
                 condiciones y medidas de seguridad - técnicas y legales - que NEXTEL ha adoptado, con el propósito
                  de salvaguardar el derecho a la privacidad y a la confidencialidad de sus datos personales y,
               asimismo, dar cumplimiento a lo establecido en la Ley No. 29733 y su Reglamento aprobado mediante
                Decreto Supremo No. 003-2013-JUS.</p>
        
            <h3>En consecuencia</h3>

            <p>NEXTEL se compromete a tratar los datos personales proporcionados por sus clientes y terceros en su
                 “Base de Datos Clientes (BI MDM)” que ha sido declarado a la Autoridad Nacional de Protección de Datos
                  Personales con Código RNPDP No. 127. El titular de dicho banco de datos es NEXTEL con domicilio en
                   Av. Nicolás Arriola No. 480, La Victoria, Lima, Perú, con la finalidad y en la modalidad detallada
                en el presente documento. Para tal efecto, se obliga a cumplir los principios de legalidad,
                 consentimiento, proporcionalidad, calidad, seguridad, finalidad, y los demás establecidos en
                  la normatividad de protección de datos personales vigente.</p>

            <p>Sin perjuicio de ello, en observancia al principio de mejora continua propio de la organización,
                 NEXTEL se reserva el derecho de modificar la presente política, ya sea para adaptarla a los cambios
                  normativos que se implementen, para brindar una mejor calidad en el servicio ofrecido o comunicar
                   nuevas alternativas de a sus clientes relacionadas al servicio ya contratado.</p>

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