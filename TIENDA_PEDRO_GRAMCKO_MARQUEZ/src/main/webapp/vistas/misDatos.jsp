<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.VO.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <h1 class="mt-4">Tus datos</h1>
    <form method="post" action="RellenarDatosUsuario" class="mt-4">
    <% UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario"); %>
        <% if (usuario != null) { %>
            <% if (usuario.getDireccion() != null) { %>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="${usuario.direccion}" required>
                </div>
            <% } %>
            <% if (usuario.getProvincia() != null) { %>
                <div class="form-group">
                    <label for="provincia">Provincia:</label>
                    <input type="text" class="form-control" id="provincia" name="provincia" placeholder="Provincia" value="${usuario.provincia}" required>
                </div>
            <% } %>
            <% if (usuario.getLocalidad() != null) { %>
                <div class="form-group">
                    <label for="localidad">Localidad:</label>
                    <input type="text" class="form-control" id="localidad" name="localidad" placeholder="Localidad" value="${usuario.localidad}" required>
                </div>
            <% } %>
            <% if (usuario.getTelefono() != null) { %>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" value="${usuario.telefono}" required>
                </div>
            <% } %>
            <% if (usuario.getDni() != null) { %>
                <div class="form-group">
                    <label for="dni">DNI:</label>
                    <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI" value="${usuario.dni}" required>
                </div>
            <% } %>
        <% } %>
        <button type="submit" class="btn btn-primary">Guardar Datos</button>
    </form>
</div>

</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>