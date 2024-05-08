<%@page import="model.DAO.UsuarioDAO"%>
<%@page import="model.DAO.PedidoDAO"%>
<%@page import="service.ProductoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.VO.*, java.util.Map, com.google.gson.Gson"%>
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
        <link href="vistas/vistasAdministrador/indexEmpleado/css/index.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
                <main >
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Estadísticas</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Estadísticas</li>
                        </ol>
	
					<div class="info-container">
											<div class="card text-white bg-dark mb-3">
						  <div class="card-header">Clientes registrados</div>
						  <div class="card-body">
						    <h4 class="card-title"><%= UsuarioDAO.obtenerCantidadUsuarios() %> clientes</h4>
						  </div>
						</div>
												<div class="card text-white bg-dark mb-3">
						  <div class="card-header">Pedidos enviados</div>
						  <div class="card-body">
						    <h4 class="card-title"><%= PedidoDAO.obtenerPedidosEnviados() %> pedidos</h4>
						  </div>
						</div>
												<div class="card text-white bg-dark mb-3">
						  <div class="card-header">Promedio de pedidos</div>
						  <div class="card-body">
						    <h4 class="card-title"><%= PedidoDAO.obtenerPromedioPedido() %>€</h4>
						  </div>
						</div>
												<div class="card text-white bg-dark mb-3">
						  <div class="card-header">Pedidos cancelados</div>
						  <div class="card-body">
						    <h4 class="card-title"><%= PedidoDAO.obtenerPedidosCancelados() %> pedidos</h4>
						  </div>
						</div>
					</div>

						
						
						<div class="contenedor-grafico">
						  <canvas class="canvas" id="myChart"></canvas>
						      <!-- Separador -->
    						<hr style="border: 1px solid gray;">
						  <canvas class="canvas2" id="myChart2"></canvas>
						</div>


                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; HappyPets 2024</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="vistas/vistasAdministrador/indexEmpleado/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="vistas/vistasAdministrador/indexEmpleado/js/datatables-simple-demo.js"></script>
        
        
    </body>
<style>
    .contenedor-grafico {
    	margin: 20px auto;
        margin-top: 40px;
        width: 80%;
        display: flex;
        flex-direction: column; /* Apilar los elementos verticalmente */
    }

    .canvas {

        height: 700px !important; /* Altura deseada para los canvas */
        margin-bottom: 40px !important;
        border: 1px solid lightgray;
        border-radius: 15px;
        padding: 15px;
    }

    .canvas2 {
	    height: 800px; /* Altura deseada para los canvas */
	    width: 800px;
	    margin-top: 40px;
        margin-bottom: 20px !important;
        border: 1px solid lightgray;
        border-radius: 15px;
        padding: 15px;
    }
</style>

<script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: <%= new Gson().toJson(request.getAttribute("etiquetas")) %>,
            datasets: [{
                label: 'Número de pedidos',
                data: <%= new Gson().toJson(request.getAttribute("datos")) %>,
                backgroundColor: [     
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'                
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(153, 102, 255)',
                    'rgb(255, 159, 64)',
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<script>
    // Obtener los datos de los pedidos de los últimos 6 meses desde un atributo en el servlet o componente
    const pedidosUltimos6Meses = <%= new Gson().toJson(request.getAttribute("productosUltimosMeses")) %>;
    const pedidosEnviados = <%= new Gson().toJson(request.getAttribute("pedidosEnviados")) %>;
    const pedidosCancelados = <%= new Gson().toJson(request.getAttribute("pedidosCancelados")) %>;

    // Etiquetas para los meses
    const labels = ['Mayo', 'Abril', 'Marzo', 'Febrero', 'Enero', 'Diciembre'];

    // Crear el dataset con los datos de los pedidos de los últimos 6 meses
    const datasetPedidos = {
        label: "Pedidos registrados",
        data: pedidosUltimos6Meses,
        borderColor: 'rgba(69, 177, 223, 0.8)',
        fill: false,
        tension: 0.1
    };
    
    const datasetPedidosEnviados = {
        label: "Pedidos enviados",
        data: pedidosEnviados,
        borderColor: 'rgba(255, 255, 0, 0.8)',
        fill: false,
        tension: 0.1
    };
    
    const datasetPedidosCancelados = {
        label: "Pedidos cancelados",
        data: pedidosCancelados,
        borderColor: 'rgba(245, 37, 37, 0.8)',
        fill: false,
        tension: 0.1
    };

    // Seleccionar el segundo canvas
    const graph2 = document.querySelector("#myChart2");

    // Configurar los datos y opciones del gráfico
    const data2 = {
        labels: labels,
        datasets: [datasetPedidos, datasetPedidosEnviados, datasetPedidosCancelados]
    };

    const config2 = {
        type: 'line',
        data: data2,
    };

    // Crear el gráfico en el segundo canvas
    new Chart(graph2, config2);
</script>


</html>
