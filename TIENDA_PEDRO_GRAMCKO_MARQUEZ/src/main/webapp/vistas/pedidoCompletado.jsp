<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.DecimalFormat, java.util.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HappyPets</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<header>
<jsp:include page="/vistas/header/header.jsp"/>
</header>
<body>
			<% ResourceBundle rb = (ResourceBundle) request.getAttribute("idiomas");%>
<a class="hidden" href="<%=request.getContextPath() %>?lang=en"></a>
<div class="container" style="margin-top: 50px; margin-bottom: 50px; min-height: 55vh">
    <div class="row mt-5">
        <div class="col-md-12 text-center">
            <h1 class="display-4">Pedido realizado con éxito</h1>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-6 offset-md-3">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">Fecha:</th>
                        <td>${fechaPedido}</td>
                    </tr>
                    <tr>
                        <th scope="row">Total:</th>
                       <% DecimalFormat decimalFormat = new DecimalFormat("#.##");
                       double total = (Double) request.getAttribute("total");
                       String totalCompra = decimalFormat.format(total);
                       %> 
                        <td><%=totalCompra %>€</td>
                    </tr>
                    <!-- Puedes agregar más detalles del pedido aquí -->
                </tbody>
            </table>
			    <div class="text-center">
			        <form action="<%= request.getContextPath() %>" method="GET" class="d-inline">
			            <button type="submit" class="btn btn-primary">Volver al menú principal</button>
			        </form>
			        <form action="<%= request.getContextPath() %>/MisPedidos" method="GET" class="d-inline">
			            <button type="submit" class="btn btn-primary">Mis pedidos</button>
			        </form>
			    </div>
        </div>
    </div>
</div>
</body>
<footer>
<jsp:include page="/vistas/footer/footer.jsp"/>
</footer>
</html>
