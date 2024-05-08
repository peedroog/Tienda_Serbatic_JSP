<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.VO.*, java.util.List, java.sql.Date" %> <!-- Importa la clase ProductoVO -->
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
<main style="margin: 50px;">
    <h1 class="display-4">Lista de proveedores</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Localidad</th>
                    <th>Email</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
            	UsuarioVO user = (UsuarioVO) request.getSession().getAttribute("usuario");
                List<ProveedorVO> listaProveedores = (List<ProveedorVO>) request.getAttribute("listaProveedores"); 
                for (ProveedorVO proveedor: listaProveedores) {      
                	
                    
                	user = (UsuarioVO) request.getSession().getAttribute("usuario");
                    int rolUsuario = user.getId_rol();
                    
                %>
				<tr>
				    <td><%= proveedor.getId() %></td>
				    <td><%= proveedor.getNombre() %></td>
				    <td><%= proveedor.getLocalidad() %></td>
				    <td><%= proveedor.getEmail() %></td>
				    <td>
				        <% if(rolUsuario == 2 || rolUsuario == 3) { %>
				            <a href="#" class="actualizar-proveedor"
				               data-id="<%= proveedor.getId() %>"
				               data-nombre="<%= proveedor.getNombre() %>"
				               data-direccion="<%= proveedor.getDireccion() %>"
				               data-provincia="<%= proveedor.getProvincia()%>"
				               data-localidad="<%= proveedor.getLocalidad() %>"
				               data-telefono="<%= proveedor.getTelefono()%>"
				               data-cif="<%= proveedor.getCif() %>"
				               data-email="<%= proveedor.getEmail() %>"
				               data-activo="<%= proveedor.isActivo() %>">Actualizar</a>
				               			               
				        <% } %>
				    </td>
				</tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
        <div id="mensaje">
        <% 
        String mensaje = (String) request.getAttribute("mensaje");
        if (mensaje != null && !mensaje.isEmpty()) { 
        %>
        <div class="alert alert-success" role="alert">
            <%= mensaje %>
        </div>
        <% } %>
    </div>
    
<hr style="width: 100%; margin-top: 30px; margin-bottom: 30px;">    
    
<!-- Formulario de Actualización (oculto por defecto) -->
<div id="formulario-actualizacion" style="display: none; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;">

    <h2 style="margin-bottom: 20px;">Actualizar proveedor</h2>
    <form action="ModificarProveedor" method="post">
    <input  type="hidden" id="id" name="id">

        <div style="margin-bottom: 10px;">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="provincia">Provincia:</label>
            <input type="text" id="provincia" name="provincia" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="localidad">Localidad:</label>
            <input type="text" id="localidad" name="localidad" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="telefono">Telefono:</label>
            <input type="number" id="telefono" name="telefono" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="cif">CIF:</label>
            <input type="text" id="cif" name="cif" class="form-control">
        </div>
		<div style="margin-bottom: 10px;">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" class="form-control">
        </div>
        
        <%
        // Aquí se comprueba el rol del usuario
        int rolUsuario = user.getId_rol();
        if(rolUsuario == 3){ %>
            <div style="margin-bottom: 10px;">
            <label for="activo">Activo:</label>
            <input type="checkbox" id="activo" name="activo" class="form-check-input">
        </div>
        <% } %>
				            	   

        <button type="submit" class="btn btn-primary" style="width: 100%; margin: auto;">Guardar</button>
    </form>
</div>




</main>



            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="vistas/vistasAdministrador/indexEmpleado/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        
<script>
$(document).ready(function() {
    $('.actualizar-proveedor').on('click', function(e) {
        e.preventDefault();
        var id = $(this).data('id');
        
        // Obtener los datos del producto del atributo de datos personalizados

        
        var nombre = $(this).data('nombre');
        var direccion = $(this).data('direccion');
        var provincia = $(this).data('provincia');
        var localidad = $(this).data('localidad');
        var telefono = $(this).data('telefono');
        var cif = $(this).data('cif');
        var email = $(this).data('email');
        var activo = $(this).data('activo');
        
        // Rellenar el formulario con los datos del producto

        $('#id').val(id);
        $('#nombre').val(nombre);
        $('#direccion').val(direccion);
        $('#provincia').val(provincia);
        $('#localidad').val(localidad);
        $('#telefono').val(telefono);
        $('#cif').val(cif);
        $('#email').val(email);
        $('#activo').prop('checked', activo);
        

        
        // Mostrar el formulario
        $('#formulario-actualizacion').show();
    });
});
</script>



    </body>
</html>

