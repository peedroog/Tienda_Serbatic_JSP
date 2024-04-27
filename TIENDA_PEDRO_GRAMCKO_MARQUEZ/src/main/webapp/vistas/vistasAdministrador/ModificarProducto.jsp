
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="model.VO.*, java.util.List, java.sql.Date" %> <!-- Importa la clase ProductoVO -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
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
    <h1 class="display-4">Lista de Productos</h1>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<ProductoVO> listaProductos = (List<ProductoVO>) request.getAttribute("listaProductos"); 
                for (ProductoVO producto : listaProductos) { 
                    int id = producto.getId();
                    int idCategoria = producto.getId_categoria();
                    String nombre = producto.getNombre(); 
                    String descripcion = producto.getDescripcion();
                    double precio = producto.getPrecio();                    
                    int stock = producto.getStock();
                    Date fecha_alta = producto.getFecha_alta();
                    Date fecha_baja = producto.getFecha_baja();
                    float impuesto = producto.getImpuesto();
                    String imagen = producto.getImagen();
                    boolean activo = producto.isActivo();
                    
                    
                    // Aquí se comprueba el rol del usuario
                    UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
                    int rolUsuario = usuario.getId_rol();
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= nombre %></td>
                    <td><%= precio %>€</td>
					<!-- Enlace Actualizar con ID del producto como parámetro -->
					<td>
					    <% if(rolUsuario == 2 || rolUsuario == 3) { %>
					        <a href="ModificarProducto?id=<%= id %>" class="actualizar-producto">Actualizar</a>
					    <% } %>
					    <% if(rolUsuario == 3) { %>
					        <a href="borrarProducto?id=<%= id %>" class="btn btn-danger">Borrar</a>
					    <% } %>
					</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
<!-- Formulario de Actualización (oculto por defecto) -->
<div id="formulario-actualizacion" style="display: none;">
    <h2>Actualizar Producto</h2>
    <form action="guardarProducto" method="post">
        <input type="hidden" id="idProducto" name="idProducto">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre">
        <label for="precio">Precio:</label>
        <input type="number" id="precio" name="precio">
        <label for="idCategoria">ID Categoría:</label>
        <input type="text" id="idCategoria" name="idCategoria">
        <label for="descripcion">Descripción:</label>
        <input type="text" id="descripcion" name="descripcion">
        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock">
        <label for="fechaAlta">Fecha de Alta:</label>
        <input type="text" id="fechaAlta" name="fechaAlta">
        <label for="fechaBaja">Fecha de Baja:</label>
        <input type="text" id="fechaBaja" name="fechaBaja">
        <label for="impuesto">Impuesto:</label>
        <input type="number" id="impuesto" name="impuesto">
        <label for="imagen">Imagen:</label>
        <input type="text" id="imagen" name="imagen">
        <label for="activo">Activo:</label>
        <input type="checkbox" id="activo" name="activo">
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
        // Función para mostrar el formulario de actualización al hacer clic en el enlace
        $('a.actualizar-producto').click(function(event) {
            // Evitar el comportamiento predeterminado de los enlaces
            event.preventDefault();

            // Obtener el ID del producto desde el atributo data
            var idProducto = $(this).data('producto-id');

            // Aquí puedes hacer una llamada AJAX para obtener los detalles del producto con el ID
            // y luego llenar el formulario de actualización con esos detalles
            // Por ahora, simplemente mostraremos el formulario de actualización vacío

            // Mostrar el formulario de actualización
            $('#formulario-actualizacion').show();
        });
    });
</script>



    </body>
</html>

