<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.VO.*, java.util.List, java.sql.Date, java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="en">
    <head>
            <link rel="icon" type="image/x-icon" href="ico/perro.png">
        <title>HappyPets | Administración</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="vistas/vistasAdministrador/indexEmpleado/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
     <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand">
            <!-- Navbar Brand-->
         <form action ="<%=request.getContextPath() %>/Admin" method="get">
            <button type="submit" style="background-color: #012d25; border: none;">
                <jsp:include page="/svg/svgLogo.jsp"></jsp:include>
            </button>
        </form>
        
        
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <strong style="font-size: 30px; color: white; margin-left: 25px;">Panel de administración</strong>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Buscar" aria-label="Buscar" aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search" style="color: white;"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    	<li>
						    <form id="cambiarDatos" action="<%= request.getContextPath()%>/RellenarDatosUsuario" method="get">
						        <input type="hidden" name="logout" value="true">
						        <a class="dropdown-item" href="#" onclick="document.getElementById('cambiarDatos').submit();">Mis datos</a>
						    </form>
						</li>
                        <li>
						    <form id="logoutForm" action="<%= request.getContextPath()%>/CerrarSesion" method="post">
						        <input type="hidden" name="logout" value="true">
						        <a class="dropdown-item" href="#" onclick="document.getElementById('logoutForm').submit();">Cerrar sesión</a>
						    </form>
						</li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Inicio</div>
                            <a class="nav-link" href="<%=request.getContextPath()%>/Admin">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Estadísticas
                            </a>
                            <div class="sb-sidenav-menu-heading">Gestión</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsProductos" aria-expanded="false" aria-controls="collapseLayoutsProductos">
							    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
							    Gestionar productos
							    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseLayoutsProductos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							    <nav class="sb-sidenav-menu-nested nav">
							        <a class="nav-link" href="<%= request.getContextPath()%>/AltaProducto">Dar de alta</a>
							        <a class="nav-link" href="<%= request.getContextPath()%>/ModificarProducto">Actualizar</a>
							    </nav>
							</div>
							
							
							
							
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsClientes" aria-expanded="false" aria-controls="collapseLayoutsClientes">
							    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
							    Gestionar clientes
							    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseLayoutsClientes" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							    <nav class="sb-sidenav-menu-nested nav">
							        <a class="nav-link" href="<%= request.getContextPath()%>/AltaUsuario">Dar de alta</a>
							        <a class="nav-link" href="<%= request.getContextPath()%>/ModificarUsuario">Actualizar</a>
							    </nav>
							</div>
							
														<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsCategorias" aria-expanded="false" aria-controls="collapseLayoutsCategorias">
							    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
							    Gestionar categorías
							    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseLayoutsCategorias" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							    <nav class="sb-sidenav-menu-nested nav">
							        <a class="nav-link" href="<%= request.getContextPath()%>/AltaCategoria">Dar de alta</a>
							        <a class="nav-link" href="<%= request.getContextPath()%>/ModificarCategoria">Actualizar</a>
							    </nav>
							</div>
							
														<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsProveedores" aria-expanded="false" aria-controls="collapseLayoutsProveedores">
							    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
							    Gestionar proveedores
							    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseLayoutsProveedores" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							    <nav class="sb-sidenav-menu-nested nav">
							        <a class="nav-link" href="<%= request.getContextPath()%>/AltaProveedor">Dar de alta</a>
							        <a class="nav-link" href="<%= request.getContextPath()%>/ModificarProveedor">Actualizar</a>
							    </nav>
							</div>



                            
                            
                            <div class="sb-sidenav-menu-heading">Envíos y cancelaciones</div>
                            <a class="nav-link" href="<%= request.getContextPath()%>/AdminEnviarPedido">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Procesar pedidos
                            </a>
                            
                            
                            
                            <% UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
                    		if(usuario.getId_rol() == 3){%>
                    			       
                    		<div class="sb-sidenav-menu-heading">Administrador</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsEmpleados" aria-expanded="false" aria-controls="collapseLayoutsEmpleados">
							    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
							    Gestionar empleados
							    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseLayoutsEmpleados" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							    <nav class="sb-sidenav-menu-nested nav">
							        <a class="nav-link" href="<%= request.getContextPath()%>/AltaEmpleado">Dar de alta</a>
							        <a class="nav-link" href="<%= request.getContextPath()%>/ModificarEmpleado">Actualizar</a>
							    </nav>
							</div>
                            
                            <% } %>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Permisos de:</div>
						  <p align="center" style="font-size: 20px; color: RED; font-weight: bold;">
						    <% if(usuario.getId_rol() == 2) { %>
						        Empleado
						    <% } else if (usuario.getId_rol() == 3) { %>
						        Administrador
						    <% } %>
						</p>

                       
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            
            
<main>
    <div class="container" style="margin-top: 50px; margin-bottom: 50px">
        <h1 class="mt-4 text-center">Lista de Pedidos</h1>
	  
	           <!-- Separador -->
	    <hr class="mx-2" style="border-color: #ccc; border: 2px solid; margin-top: 20px; margin-bottom: 55px;">


<!-- En lista-pedidos.jsp o cualquier otra página donde desees mostrar los mensajes -->
<%
    String mensajeExito = (String) request.getSession().getAttribute("mensajeExito");
    String mensajeError = (String) request.getSession().getAttribute("mensajeError");
    request.getSession().removeAttribute("mensajeExito"); // Limpiar mensaje de éxito después de mostrarlo
    request.getSession().removeAttribute("mensajeError"); // Limpiar mensaje de error después de mostrarlo
%>

<%-- Mostrar mensaje de éxito si está presente --%>
<% if (mensajeExito != null && !mensajeExito.isEmpty()) { %>
    <div class="alert alert-success" role="alert">
        <%= mensajeExito %>
    </div>
<% } %>

<%-- Mostrar mensaje de error si está presente --%>
<% if (mensajeError != null && !mensajeError.isEmpty()) { %>
    <div class="alert alert-danger" role="alert">
        <%= mensajeError %>
    </div>
<% } %>
        <table class="table">
            <thead>
                <tr>
                    <th>Estado del pedido</th>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th>Detalles</th>
                    <th>Número de factura</th>
                    <th>Envíar pedido</th>
                    <th>Cancelar pedido</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                DecimalFormat decimalFormat = new DecimalFormat("#.##");
                List<PedidoVO> listaPedidos = (List<PedidoVO>) request.getAttribute("listaPedidos");
                int pageSize = 20;
                int totalPedidos = listaPedidos.size();
                int totalPages = (int) Math.ceil((double) totalPedidos / pageSize);
                String pageParam = request.getParameter("page");
                int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1;
                int startIndex = (currentPage - 1) * pageSize;
                int endIndex = Math.min(startIndex + pageSize, totalPedidos);
                List<PedidoVO> pedidosPaginados = listaPedidos.subList(startIndex, endIndex);
                for (PedidoVO pedido : pedidosPaginados) {
                %>
                <tr>
                    <td><%= pedido.getEstado() %></td>
                    <td><%= pedido.getFecha() %></td>
                    <td><%= decimalFormat.format(pedido.getTotal()) %>€</td>
                    <td><a href="#" class="detalle-pedido" data-pedido-id="<%= pedido.getId() %>">Detalles</a></td>
                    <td>
					    <% if (pedido.getNum_factura() == null || pedido.getNum_factura().isEmpty()) { %>
					        No disponible
					    <% } else { %>
					        <%= pedido.getNum_factura() %>
					    <% } %>
					</td>
                    <td>
		                <% if (pedido.getEstado().equals("Pendiente de envío")) { %>
		                    <form action="AdminEnviarPedido" method="POST">
		                        <input type="hidden" name="pedidoId" value="<%= pedido.getId() %>">
		                        <button type="submit" class="btn btn-success" style="border-radius: 5px; color: white;">Envíar pedido</button>
		                    </form>
		                <% } %>
           			 </td>
           			 <td>
		                <%
		                if (pedido.getEstado().equals("Pendiente cancelación") && usuario.getId_rol() == 3) { %>
		                    <form action="AdminCancelarPedido" method="POST">
		                        <input type="hidden" name="pedidoId" value="<%= pedido.getId() %>">
		                        <button type="submit" class="btn btn-danger" style="border-radius: 5px; color: white;">Cancelar pedido</button>
		                    </form>
		                <% } %>
           			 </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <!-- Modales de detalles del pedido -->
        <%
        for (PedidoVO pedido : pedidosPaginados) {
        %>
        <div id="modalDetalles_<%= pedido.getId() %>" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalDetallesLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalDetallesLabel">Detalles del pedido</h5>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nombre de producto</th>
                                    <th>Precio Unidad</th>
                                    <th>Unidades</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
							<tbody>
							    <!-- Iterar sobre las líneas de pedido y mostrar los detalles -->
							    <%
							    List<DetallePedidoVO> lineasPedido = (List<DetallePedidoVO>) request.getAttribute("lineasPedido_" + pedido.getId());
							    List<String> nombresProductos = (List<String>) request.getAttribute("nombresProductos_" + pedido.getId());
							    for (int i = 0; i < lineasPedido.size(); i++) {
							        String nombreProducto = nombresProductos.get(i);
							        DetallePedidoVO linea = lineasPedido.get(i);
							    %>
							    <tr>
							        <td><%= nombreProducto %></td>
							        <td><%= decimalFormat.format(linea.getPrecio_unidad() * (1 + (linea.getImpuesto() / 100.0))) %>€</td>
							        <td><%= linea.getUnidades() %></td>
							        <td><%= decimalFormat.format(linea.getTotal() * (1 + (linea.getImpuesto() / 100.0))) %>€</td>
							    </tr>
							    <% } %>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%
        }
        %>

        <!-- Paginación -->
        <nav aria-label="Page navigation example" style="margin-top:40px;">
            <ul class="pagination justify-content-center">
                <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                    <a class="page-link" href="?page=<%= currentPage - 1 %>" tabindex="-1">Anterior</a>
                </li>
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= i == currentPage ? "active" : "" %>">
                        <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                    </li>
                <% } %>
                <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                    <a class="page-link" href="?page=<%= currentPage + 1 %>">Siguiente</a>
                </li>
            </ul>
        </nav>

    </div>


</main>




            </div>
        </div>


        


</body>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="vistas/vistasAdministrador/indexEmpleado/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript personalizado para abrir el modal al hacer clic en Detalles -->
    <script>
    $(document).ready(function() {
        // Función para mostrar los detalles del pedido al hacer clic en el enlace
        $('a.detalle-pedido').click(function(event) {
            // Evitar el comportamiento predeterminado de los enlaces
            event.preventDefault();

            // Obtener el ID del pedido desde el atributo data
            var idPedido = $(this).data('pedido-id');
            
            // Construir el selector del modal usando el ID del pedido
            var modalSelector = '#modalDetalles_' + idPedido;
            
            // Mostrar el modal de detalles del pedido correspondiente
            $(modalSelector).modal('show');
        });
    });
    </script>
    
<style>
    /* Establecer un alto fijo para las filas */
    .table tbody tr {
        height: 50px; /* Ajusta este valor según tus necesidades */
        align-items: center;
    }
</style>

</html>

