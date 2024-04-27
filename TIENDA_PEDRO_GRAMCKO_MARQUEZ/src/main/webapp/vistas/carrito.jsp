<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Map,
 model.VO.ProductoVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
    <meta charset="UTF-8">
    <title>HappyPets</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<header>
<jsp:include page="/vistas/header/header.jsp"/>
</header>
<body>

<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <h1 class="mt-4">CARRITO</h1>

<!-- Mostrar todos los mensajes de error -->
<% 
ArrayList<String> erroresStock = (ArrayList<String>) request.getAttribute("erroresStock");
if (erroresStock != null && !erroresStock.isEmpty()) { 
    for (String error : erroresStock) {
%>
<div class="alert alert-danger" role="alert">
    <p><%= error %></p>
</div>
<% 
    } 
}

//Agregar este bloque para mostrar el mensaje de error del carrito vacío
String errorCarritoVacio = (String) request.getAttribute("errorCarritoVacio");
if (errorCarritoVacio != null && !errorCarritoVacio.isEmpty()) { 
%>
<div class="alert alert-danger" role="alert">
 <p><%= errorCarritoVacio %></p>
</div>
<% 
} 

%>


    <% 
    Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");

    if (carrito != null && !carrito.isEmpty()) {
        for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
            ProductoVO producto = entry.getKey();
            Integer cantidad = entry.getValue();
    %>
    <div class="card my-3">
        <div class="card-body">
            <h5 class="card-title">Producto: <%= producto.getNombre() %></h5>
            <h6 class="card-subtitle mb-2 text-muted">Cantidad: <%= cantidad %></h6>
    
            <!-- Formulario para actualizar la cantidad -->
            <form action="<%= request.getContextPath() %>/ActualizarCantidad" method="post">
                <input type="hidden" name="productId" value="<%= producto.getId() %>">
                <input type="number" name="cantidad" value="<%= cantidad %>" min="1" max="99">
                <button type="submit" class="btn btn-primary">Actualizar cantidad</button>
            </form>
    
            <!-- Formulario para eliminar el producto -->
            <form action="<%= request.getContextPath() %>/EliminarProducto" method="post">
                <input type="hidden" name="productId" value="<%= producto.getId() %>">
                <button type="submit" class="btn btn-danger">Eliminar producto</button>
            </form>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <p>No hay productos en el carrito.</p>
    <%
    }
    %>
	<h1>Precio sin IVA: 
	    <% 
	        Object precioTotal = request.getAttribute("precioTotal");
	        if (precioTotal != null) {
	            out.print(precioTotal);
	        } else {
	            out.print("0");
	        }
	    %><b>€</b>
	</h1>
	<h1>Precio con IVA: 
	    <% 
	        Object precioTotalConIVA = request.getAttribute("precioTotalConIVA");
	        if (precioTotalConIVA != null) {
	            out.print(precioTotalConIVA);
	        } else {
	            out.print("0");
	        }
	    %><b>€</b>
	</h1>
    <a href="<%=request.getContextPath() %>" class="btn btn-primary my-3">Seguir comprando</a>
    <a id="finalizarCompraBtn" href="<%= request.getContextPath() %>/ComprobarDatosEnvio" class="btn btn-success my-3">Finalizar compra</a>



</div>

<!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<footer>
<jsp:include page="/vistas/footer/footer.jsp"/>
</footer>
</html>
