<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, model.VO.*, service.*, java.text.DecimalFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HappyPets</title>
<link rel="icon" type="image/x-icon" href="ico/perro.png">


<!-- Bootstrap CSS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- CSS personalizado -->
<link href="css/global.css" rel="stylesheet">
<link href="vistas/index/index.css" rel="stylesheet">

</head>
<header>
	<jsp:include page="/vistas/header/header.jsp" />
</header>





<body>
<% ResourceBundle rb = (ResourceBundle) request.getAttribute("idiomas");%>
<div class="toggle-btn" id="toggleBtn">
  <button class="btn btn-primary btn-block" style="font-size: 20px;"><%=rb.getString("Categorias") %></button>
</div>

<div id="myModal" class="contenedor-modal">
    <div class="contenido-modal">
        <!-- Contenido del modal -->
        <span class="close">&times;</span>
        <p><%=rb.getString("Categoria") %></p>
        <!-- Separador -->
        <hr style="border-color: #ccc; border: 1px solid;">
        <ul class="lista-categorias">
			<li>
			    <a href="CategoriasProducto?categoria=Perros"><b><%=rb.getString("Perros") %></b></a>
			</li>
			<li>
			    <a href="CategoriasProducto?categoria=Gatos"><b><%=rb.getString("Gatos") %></b></a>
			</li>
			<li>
			    <a href="CategoriasProducto?categoria=Otros%20animales"><b><%=rb.getString("Otros") %></b></a>
			</li>
        </ul>
    </div>
</div>  


<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <h1 class="mt-4 text-center" style="margin-bottom: 25px;"><%=rb.getString("Catalogo") %></h1>
    
    <form class="col-12 col-lg-auto me-lg-auto search-form" role="search" action="BuscarProducto" method="GET">
        <input type="search" class="form-control" placeholder="<%=rb.getString("Buscar1") %>" aria-label="Buscar" name="searchText">
        <!-- Aquí puedes agregar más campos de búsqueda como precio, categoría, etc. -->
        <button type="submit" class="btn btn-primary"><%=rb.getString("Buscar2") %></button>
    </form>
    
    <!-- Separador -->
    <hr style="border: 1px solid gray;">
    
    <div class="text-center mt-4">
        <!-- Botón para ordenar por Precio más bajo -->
        <form action="OrdenarProducto" method="GET" class="d-inline-block mx-2">
            <input type="hidden" name="orderBy" value="precioAsc">
            <button type="submit" class="btn-filtro"><%=rb.getString("Precio.bajo") %></button>
        </form>
    
        <!-- Botón para ordenar por Precio más alto -->
        <form action="OrdenarProducto" method="GET" class="d-inline-block mx-2">
            <input type="hidden" name="orderBy" value="precioDesc">
            <button type="submit" class="btn-filtro"><%=rb.getString("Precio.alto") %></button>
        </form>
    
        <!-- Botón para ordenar por Más comprados -->
        <form action="OrdenarProducto" method="GET" class="d-inline-block mx-2">
            <input type="hidden" name="orderBy" value="masComprados">
            <button type="submit" class="btn-filtro"><%=rb.getString("Mas.comprados") %></button>
        </form>

        <!-- Botón para ordenar por Mejor valorados -->
        <form action="OrdenarProducto" method="GET" class="d-inline-block mx-2">
            <input type="hidden" name="orderBy" value="mejorValorados">
            <button type="submit" class="btn-filtro"><%=rb.getString("Mejor.valorados") %></button>
        </form>
    </div>
    
    <!-- Separador -->
    <hr style="border: 1px solid gray; margin-bottom: 50px">
    
    <div class="row">
        <% 
        List<ProductoVO> catalogo = (List<ProductoVO>) request.getAttribute("catalogo"); 
        // Parámetros de paginación
        int pageSize = 9; // Número máximo de productos por página
        int totalProducts = catalogo.size(); // Total de productos
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize); // Calcular el número total de páginas
        String pageParam = request.getParameter("page"); // Obtener el número de página actual
        int currentPage = (pageParam != null && !pageParam.isEmpty()) ? Integer.parseInt(pageParam) : 1; // Página actual (por defecto es 1)
        int startIndex = (currentPage - 1) * pageSize; // Índice inicial del producto en la página actual
        int endIndex = Math.min(startIndex + pageSize, totalProducts); // Índice final del producto en la página actual
        
        // Obtener los productos de la página actual
        List<ProductoVO> productosPagina = catalogo.subList(startIndex, endIndex);
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        
        for (ProductoVO producto : productosPagina) {
            if (producto.isActivo()) {
                CategoriaVO categoria = CategoriaService.findById(producto.getId_categoria());
        %>
        <div class="col-12 col-md-4">
            <div class="product-card" style="background: url(<%=producto.getImagen()%>)">
                <div class="overlay">
                    <h5 class="card-title product-name"><%=producto.getNombre()%>
						<svg data-toggle="modal" data-target="#detalleProductoModal<%=producto.getId()%>" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0,0,256,256" width="50px" height="50px"> <g fill="#ffffff" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"> <g transform="scale(5.12,5.12)"> <path d="M25,2c-12.6907,0 -23,10.3093 -23,23c0,12.69071 10.3093,23 23,23c12.69071,0 23,-10.30929 23,-23c0,-12.6907 -10.30929,-23 -23,-23zM25,4c11.60982,0 21,9.39018 21,21c0,11.60982 -9.39018,21 -21,21c-11.60982,0 -21,-9.39018 -21,-21c0,-11.60982 9.39018,-21 21,-21zM25,11c-1.65685,0 -3,1.34315 -3,3c0,1.65685 1.34315,3 3,3c1.65685,0 3,-1.34315 3,-3c0,-1.65685 -1.34315,-3 -3,-3zM21,21v2h1h1v13h-1h-1v2h1h1h4h1h1v-2h-1h-1v-15h-1h-4z"></path></g></g></svg>
                    </h5>
                    <p class="card-text text-white">
                        Precio: <%= decimalFormat.format(producto.getPrecio()) %><b>€</b>
                    </p>
                    <form action="ComprarServlet" method="GET">
                        <input type="hidden" name="id" value="<%=producto.getId()%>">
                        <button type="submit" class="btn btn-primary btn-block"><%=rb.getString("Añadir.carrito") %></button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal para mostrar detalles del producto -->
        <div class="modal fade" id="detalleProductoModal<%=producto.getId()%>" tabindex="-1" role="dialog" aria-labelledby="detalleProductoModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" id="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detalleProductoModalLabel"><%=producto.getNombre()%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-8">
                                <p>
                                    <strong>Nombre de categoría:</strong>
                                    <%=categoria.getNombre()%></p>
                                <p>
                                    <strong>Descripción: </strong>
                                    <%=producto.getDescripcion()%></p>
                                <p>
                                    <strong>Precio:</strong>
                                    <%= decimalFormat.format(producto.getPrecio()) %>€</p>

                            </div>
                            <div class="col-md-4">
                                <img src="<%=producto.getImagen()%>" class="img-fluid" alt="<%=producto.getNombre()%>">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <form action="ComprarServlet" method="GET">
                            <input type="hidden" name="id" value="<%=producto.getId()%>">
                            <button type="submit" class="btn btn-primary btn-block btn-añadir"><b><%=rb.getString("Añadir.carrito") %></b></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% 
            } // Cierre del if
        } // Cierre del for
        %>
    </div>

    <!-- Paginación -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <% for (int i = 1; i <= totalPages; i++) { %>
                <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                    <a class="page-link" href="?page=<%=i%>"><%=i%></a>
                </li>
            <% } %>
        </ul>
    </nav>
</div>






	<!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- JavaScript personalizado para abrir el modal al hacer clic en la imagen o el nombre del producto -->
	<script>
		$(document).ready(function() {
			$('.product-image, .product-name').click(function() {
				$($(this).data('target')).modal('show');
			});
		});
	</script>

<script>
//Obtener el modal
var modal = document.getElementById("myModal");

// Obtener el botón que abre el modal
var btn = document.getElementById("toggleBtn");

// Obtener el elemento <span> que cierra el modal
var span = document.getElementsByClassName("close")[0];

// Cuando se hace clic en el botón, mostrar el modal
btn.onclick = function() {
  	modal.style.display = "block";

}

// Cuando se hace clic en <span> (x), ocultar el modal
span.onclick = function() {
  modal.style.display = "none";

}

// Cuando el usuario hace clic en cualquier parte fuera del modal, ocultarlo
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>



</body>
<footer>
	<jsp:include page="/vistas/footer/footer.jsp" />
</footer>
</html>