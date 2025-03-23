<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String usuarioSesion = (String) session.getAttribute("usuario"); // Verifica si hay usuario logueado
%>
<!DOCTYPE html>
<html lang="es">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Icon Nextel -->
      <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <link rel="stylesheet" href="/CSS/Footer.css">
      <link rel="stylesheet" href="/CSS/estilos.css">
      <link rel="stylesheet" href="/CSS/Styles.css">
      <link rel="stylesheet" href="/CSS/NavBar.css">
      
      <title>Inicio | Nextel </title>
</head>
<body>
    
    <header>
        <div class="HeaderNav">
            <div class="logo_container">
                <a href="./index.jsp"><img src="/Pr_Cel/Nextel_Logo.png" alt="logo"></a>
            </div>

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

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100" src="/Pr_Cel/carrusel1.png" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="/Pr_Cel/carrusel2.png" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="/Pr_Cel/carrusel3.png" alt="Third slide">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
      
      <br>
      
      
      <div>
      <h1 style="text-align: center; font-weight: bold;">PLANES</h1>
      </div>
      
    <div class="contenedor">

        <div class="tabla">
            <h2>Básico</h2>
            <img src="/Pr_Cel/1.png" alt="">
            <h3><sup>S/</sup>59.90 </h3>
            <h4>75 Gb</h4>
            <p>400 minutos a países internacionales con Cobertura a 8 países</p>
            <a href="" class="boton" style="text-decoration: none;">¡Me interesa!</a>
        </div>
        <div class="tabla hover">
            <h2>Estandar</h2>
            <img src="/Pr_Cel/2.png" alt="">
            <h3><sup>S/</sup>69.90 </h3>
            <h4>95 Gb</h4>
            <p>600 minutos a países internacionales con Cobertura a 16 países</p>
            <a href="" class="boton" style="text-decoration: none;">¡Me interesa!</a>
        </div>
        <div class="tabla">
            <h2>Premium</h2>
            <img src="/Pr_Cel/3.png" alt="">
            <h3><sup>S/</sup>79.90 </h3>
            <h4>105 Gb</h4>
            <p>Minutos ilimitados a países internacionales con Cobertura a 32 países</p>
            <a href="" class="boton" style="text-decoration: none;">¡Me interesa!</a>
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
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>