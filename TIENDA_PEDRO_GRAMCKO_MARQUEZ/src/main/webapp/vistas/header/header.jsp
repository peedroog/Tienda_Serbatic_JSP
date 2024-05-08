<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.VO.UsuarioVO"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
<link href="vistas/header/bootstrap.min.css" rel="stylesheet">
<link href="css/global.css" rel="stylesheet">
<link href="vistas/header/headers.css" rel="stylesheet">


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">

        <form action="<%=request.getContextPath()%>" method="get">
            <button type="submit" style="background-color: #012d25; border: none;">
                <jsp:include page="/svg/svgLogo.jsp"></jsp:include>
            </button>
        </form>
                    	<form action="<%=request.getContextPath()%>" method="get">
            		<button type="submit" style="background-color: #012d25; border: none;">
            			<img src="img/HappyPets.png" style="width: 160px; margin-left: 5px;">
            		</button>			
				</form>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">

			<div class="opciones-menu">
		<li class="nav-item">
			<% 
			ResourceBundle rb = (ResourceBundle) request.getAttribute("idiomas");
			if(rb == null){
				Locale locale = new Locale("es");
				rb = ResourceBundle.getBundle("idioma", locale);
			}
			%>
            <a class="nav-link" href="<%= request.getContextPath()%>"><%=rb.getString("Inicio") %></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath()%>/Contacto"><%=rb.getString("Contacto") %></a>
        </li>
			</div>
			
			

            </ul>
		

            <div class="login-cart">
				            
				<div class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						    <% if ("en".equals((String)request.getAttribute("languaje"))) { %>
						    <jsp:include page="/svg/svgIngles.jsp"></jsp:include>						        
						    <% } else { %>
						        <jsp:include page="/svg/svgEspaña.jsp"></jsp:include>
						    <% } %>
				    </a>
				    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				        <!-- Formulario para cambiar a Español -->
				        <li><a class="dropdown-item" style="color: black !important;" href="<%=request.getContextPath() %>?lang=es"><%=rb.getString("Español") %></a></li>
				
				        <!-- Formulario para cambiar a Inglés -->
				        <li><a class="dropdown-item" style="color: black !important;" href="<%=request.getContextPath() %>?lang=en"><%=rb.getString("Ingles") %></a></li>
				    </ul>
				</div>

                <form action="<%=request.getContextPath()%>/Carrito" method="GET">

                    <button type="submit" class="nav-link text-white shop-cart">
                        <jsp:include page="/svg/svgCarrito.jsp"></jsp:include>
                        <div class="shop-cart-count">
                            <%
                            // Obtener el número de productos en el carrito
                            @SuppressWarnings("unchecked")
                            Map<Integer, Integer> carrito = (Map<Integer, Integer>) request.getSession().getAttribute("carrito");
                            int numProductos = 0;
                            if (carrito != null) {
                                for (Integer cantidad : carrito.values()) {
                                    numProductos += cantidad;
                                }
                            }
                            // Mostrar el número de productos en el carrito con un límite de 99
                            out.print("" + (numProductos > 99 ? "99+" : numProductos) + "");
                            %>
                        </div>
                    </button>

                </form>

                <%
                // Verificar si hay un usuario en sesión
                UsuarioVO usuario = (UsuarioVO) session.getAttribute("usuario");
                if (usuario != null) {
                %>
                <!-- Si hay un usuario en sesión, mostrar el menú de cuenta con opciones -->
                <div class="nav-item dropdown"><a class="nav-link dropdown-toggle"
                        href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false"> <jsp:include page="/svg/svgCuenta.jsp"></jsp:include>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <form action="MisDatos" method="GET">
                            <li><button type="submit" class="dropdown-item"><%=rb.getString("Mis.datos") %></button></li>
                        </form>
                        <form action="MisPedidos" method="GET">
                            <li><button type="submit" class="dropdown-item"><%=rb.getString("Mis.pedidos") %></button></li>
                        </form>
                        <form action="<%=request.getContextPath()%>/CerrarSesion" method="POST">
                            <li><button type="submit" class="dropdown-item"><%=rb.getString("Cerrar.sesion") %></button></li>
                        </form>
                    </ul></div>
                <%
                } else {
                %>
                <!-- Si no hay un usuario en sesión, mostrar el botón de inicio de sesión -->
                <div class="nav-item dropdown"><a class="nav-link dropdown-toggle"
                        href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                    <jsp:include page="/svg/svgCuenta.jsp"></jsp:include>
                </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <form action="<%=request.getContextPath()%>/Login" method="GET">
                            <li><button type="submit" class="dropdown-item"><%=rb.getString("Iniciar.sesion") %></button></li>
                        </form>
                    </ul></div>
                <%
                }
                %>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
    <script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</nav>
