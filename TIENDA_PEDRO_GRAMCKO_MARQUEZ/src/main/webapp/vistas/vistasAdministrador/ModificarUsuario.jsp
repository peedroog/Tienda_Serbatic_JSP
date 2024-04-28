<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.VO.*, java.util.List, java.sql.Date" %> <!-- Importa la clase ProductoVO -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Charts - SB Admin</title>
        <link href="vistas/vistasAdministrador/indexEmpleado/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            
            
<main style="margin: 50px;">
    <h1 class="display-4">Lista de Usuarios</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>ID Rol</th>
                    <th>Email</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
            	UsuarioVO user = (UsuarioVO) request.getSession().getAttribute("usuario");
                List<UsuarioVO> listaUsuarios = (List<UsuarioVO>) request.getAttribute("listaUsuarios"); 
                for (UsuarioVO usuario: listaUsuarios) {      
                	
                    
                	user = (UsuarioVO) request.getSession().getAttribute("usuario");
                    int rolUsuario = user.getId_rol();
                %>
				<tr>
				    <td><%= usuario.getId() %></td>
				    <td><%= usuario.getId_rol() %></td>
				    <td><%= usuario.getEmail() %></td>
				    <td>
				        <% if(rolUsuario == 2 || rolUsuario == 3) { %>
				            <a href="#" class="actualizar-usuario"
				               data-id="<%= usuario.getId() %>"
				               data-id_rol="<%= usuario.getId_rol() %>"
				               data-email="<%= usuario.getEmail() %>"
				               data-nombre="<%= usuario.getNombre() %>"
				               data-apellido1="<%= usuario.getApellido1() %>"
				               data-apellido2="<%= usuario.getApellido2() %>"
				               data-direccion="<%= usuario.getDireccion() %>"
				               data-provincia="<%= usuario.getProvincia()%>"
				               data-localidad="<%= usuario.getLocalidad() %>"
				               data-telefono="<%= usuario.getTelefono()%>"
				               data-dni="<%= usuario.getDni() %>"
				               data-activo="<%= usuario.isActivo() %>">Actualizar</a>
				               			               
				        <% } %>
				    </td>
				</tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
<!-- Formulario de Actualización (oculto por defecto) -->
<div id="formulario-actualizacion" style="display: none; padding: 20px; border: 1px solid #ccc; background-color: #f9f9f9;">
    <div id="mensaje">
        <% 
        String mensaje = request.getParameter("mensaje");
        if (mensaje != null && !mensaje.isEmpty()) { 
        %>
        <div class="alert alert-success" role="alert">
            <%= mensaje %>
        </div>
        <% } %>
    </div>
    <h2 style="margin-bottom: 20px;">Actualizar Producto</h2>
    <form action="ModificarUsuario" method="post">
        <div style="margin-bottom: 10px;">
        <input  type="hidden" id="idUsuario" name="idUsuario">
            <label for="id_rol">ID Rol:</label>
            <input type="text" id="id_rol" name="id_rol" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="apellido1">Primer apellido:</label>
            <input type="text" id="apellido1" name="apellido1" class="form-control">
        </div>
        <div style="margin-bottom: 10px;">
            <label for="apellido2">Segundo apellido:</label>
            <input type="text" id="apellido2" name="apellido2" class="form-control">
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
            <label for="dni">DNI:</label>
            <input type="text" id="dni" name="dni" class="form-control">
        </div>
        
        <%
        // Aquí se comprueba el rol del usuario
        UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
        int rolUsuario = usuario.getId_rol();
        if(rolUsuario == 3){ %>
            <div style="margin-bottom: 10px;">
            <label for="activo">Activo:</label>
            <input type="checkbox" id="activo" name="activo" class="form-check-input">
        </div>
        <% } %>
				            	   

        <button type="submit" class="btn btn-primary">Guardar</button>
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
    $('.actualizar-usuario').on('click', function(e) {
        e.preventDefault();
        var idUsuario = $(this).data('id');
        
        // Obtener los datos del producto del atributo de datos personalizados
        var id_rol = $(this).data('id_rol');
        var email = $(this).data('email');
        var nombre = $(this).data('nombre');
        var apellido1 = $(this).data('apellido1');
        var apellido2 = $(this).data('apellido2');
        var direccion = $(this).data('direccion');
        var provincia = $(this).data('provincia');
        var localidad = $(this).data('localidad');
        var telefono = $(this).data('telefono');
        var dni = $(this).data('dni');
        var activo = $(this).data('activo');
        
        // Rellenar el formulario con los datos del producto
        $('#idUsuario').val(idUsuario);
        $('#id_rol').val(id_rol);
        $('#email').val(email);
        $('#nombre').val(nombre);
        $('#apellido1').val(apellido1);
        $('#apellido2').val(apellido2);
        $('#direccion').val(direccion);
        $('#provincia').val(provincia);
        $('#localidad').val(localidad);
        $('#telefono').val(telefono);
        $('#dni').val(dni);
        $('#activo').prop('checked', activo);
        

        
        // Mostrar el formulario
        $('#formulario-actualizacion').show();
    });
});
</script>



    </body>
</html>

