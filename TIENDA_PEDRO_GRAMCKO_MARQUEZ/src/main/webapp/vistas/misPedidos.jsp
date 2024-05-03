<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.VO.*, service.*, java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
<meta charset="UTF-8">
<title>HappyPets</title>

<!-- Bootstrap CSS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- CSS personalizado -->
<link href="css/global.css" rel="stylesheet">
<link href="vistas/index/index.css" rel="stylesheet">

</head>
<header>
    <%@ include file="/vistas/header/header.jsp" %>
</header>
<body>
    <div class="container" style="margin-top: 50px; margin-bottom: 50px; min-height: 55vh;">
        <h1 class="mt-4 text-center">Lista de Pedidos</h1>
        
         <!-- Separador -->
	    <hr class="mx-2" style="border-color: #ccc; border: 2px solid;">

	 <div class="text-center mt-4">
	    <!-- Botón para ordenar por Precio más bajo -->
	    <form action="FiltrarPedido" method="GET" class="d-inline-block mx-2">
	        <input type="hidden" name="orderBy" value="fechaAsc">
	        <button type="submit" class="btn-filtro">Más recientes</button>
	    </form>
	
	    <!-- Botón para ordenar por Precio más alto -->
	    <form action="FiltrarPedido" method="GET" class="d-inline-block mx-2">
	        <input type="hidden" name="orderBy" value="fechaDesc">
	        <button type="submit" class="btn-filtro">Más antiguos</button>
	    </form>
	  </div>
	  
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
                    <th>Número de fáctura</th>
                    <th>Acciones</th>
                    <th></th>
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
		                    <form action="CancelarPedido" method="POST">
		                        <input type="hidden" name="pedidoId" value="<%= pedido.getId() %>">
		                        <button type="submit" class="btn-primary">Cancelar pedido</button>
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
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID Producto</th>
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
        <nav aria-label="Page navigation example">
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
    

    

</body>
<footer>
    <%@ include file="/vistas/footer/footer.jsp" %>
</footer>
</html>
