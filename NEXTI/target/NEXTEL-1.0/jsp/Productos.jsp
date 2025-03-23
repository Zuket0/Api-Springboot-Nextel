<%@page import="java.util.*"%>
<%@page import="controller.NegocioProducto"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Productos | Nextel</title>
        <!-- Icon Nextel -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="icon" type="image/x-icon" href="/Pr_Cel/icon_Nexti.png">
        <link rel="stylesheet" href="/CSS/Styles.css">
        <link rel="stylesheet" href="/CSS/estilos.css">
        <link rel="stylesheet" href="/CSS/NavBar.css">
        <link rel="stylesheet" href="/CSS/Footer.css">
        <link rel="stylesheet" href="/CSS/TESTI.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
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
                    <a href="/jsp/login.jsp?redirect=<%= request.getRequestURI() + (request.getQueryString() != null ? "?" + 
                            request.getQueryString() : "") %>" class="login-button">Iniciar Sesión</a>

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
        <div class="Pagi">           
        
        <aside class="filters">
            <br><br>
            <h2>Filtros</h2><br>
            <div class="filters-category">
                <div class="filter-category">
                    <form method="get" action="Productos.jsp" id="filterForm">
                        <h3>Marca</h3>
                        <label>
                            <input type="checkbox" value="Apple" name="tipo" />
                            <span>Apple</span>
                        </label>
                        <label>
                            <input type="checkbox" value="Honor" name="tipo" />
                            <span>Honor</span>
                        </label>
                        <label>
                            <input type="checkbox" value="Motorola" name="tipo" />
                            <span>Motorola</span>
                        </label>
                        <label>
                            <input type="checkbox" value="Nokia" name="tipo" />
                            <span>Nokia</span>
                        </label>                           
                        <label>
                            <input type="checkbox" value="Oppo" name="tipo" />
                            <span>Oppo</span>
                        </label>
                        <label>
                            <input type="checkbox" value="Samsung" name="tipo" />
                            <span>Samsung</span>
                        </label>
                        <label>
                            <input type="checkbox" value="Xiaomi" name="tipo" />
                            <span>Xiaomi</span>
                        </label>
                        <label>
                            <input type="checkbox" value="Zte" name="tipo" />
                            <span>Zte</span>
                        </label>                    
                    </form>
                </div>
            </div>         
        </aside>
        
       <div class="Columna">
           
            <div class="container-search">
                <div class="search-input-box">
                    <input type="text" placeholder="¿Qué quieres buscar?" id="search-input" />
                                <button id="search-button">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" style="width: 20px; height: 20px;">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-4.35-4.35M10.5 18a7.5 7.5 0 100-15 7.5 7.5 0 000 15z" />
                                        </svg>
                                </button>

                    <ul class="container-suggestions" id="suggestions-list"></ul>
                </div>
            </div>

           
           <div class="collection">
                <div class="options">
                    <h2>Todas las colecciones</h2>
                    <div class="sort-options">
                        <label>
                            Ordenar por:
                            <select id="sort-select" class="sort-select">
                                <option value="relevante">Relevante</option>
                                <option value="asc">Precio: Menor a Mayor</option>
                                <option value="desc">Precio: Mayor a Menor</option>
                            </select>
                        </label>
                    </div>
                </div>
            </div>
 
            
           

            <%
                String tipoFiltro = request.getParameter("tipo");
                NegocioProducto negocio = new NegocioProducto();
                List<Producto> productos = negocio.listarProductos();

                if (tipoFiltro != null && !tipoFiltro.isEmpty()) {
                    productos = productos.stream()
                        .filter(p -> p.getTipoProducto().equalsIgnoreCase(tipoFiltro))
                        .toList();
                }
            %>


            <section class="container-items">
                <% for (Producto producto : productos) { %>
                    <div class="item">
                        <figure>
                            <img src="<%=producto.getUrl()%>" alt="<%=producto.getNombreProducto()%>">
                        </figure>
                        <div class="info-curso">
                            <h2><%=producto.getNombreProducto()%></h2>
                            <p><%=producto.getDescripcionProducto()%></p>
                            <p class="Price">$<%=producto.getPrecioProducto()%></p>
                            <button class="btn-add-cart">Añadir al carrito</button>
                        </div>
                    </div>
                <% } %>
            </section>
          </div>
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
        
        <script src="/js/Filters.js"></script>
        <script src="/js/Search.js"></script>
        <script src="/js/LogReg.js"></script>
        <script src="/js/Cart.js"></script>

    </body>
</html>
