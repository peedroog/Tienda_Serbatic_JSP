<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.VO.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HappyPets</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<header>
    <jsp:include page="/vistas/header/header.jsp"/>
</header>
<body>

<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <h1 class="mt-4" style="font-size: 50px; font-family: robotoBlack;"><b>Tus datos</b></h1>
            <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null) { %>
            <div class="alert alert-info" role="alert">
                <%= mensaje %>
            </div>
        <% } %>
    
    <!-- Botones para mostrar formularios -->
    <div class="mt-3" style="display: flex; justify-content: center;">
        <button type="button" class="btn btn-primary btn-lg" onclick="showPersonalDataForm()" style="margin-right: 30px">Mis datos</button>
        <button type="button" class="btn btn-primary btn-lg" onclick="showChangePasswordForm()" style="margin-left: 30px">Cambiar contraseña</button>
    </div>
    <!-- Formulario de datos personales -->
    <form id="personalDataForm" method="post" action="RellenarDatosUsuario" class="mt-4" style="display: none;">
        <% UsuarioVO usuario = (UsuarioVO) request.getAttribute("usuario"); %>
        <% if (usuario != null) { %>

            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="${usuario.nombre}" required>
            </div>

            <div class="form-group">
                <label for="apellido1">Primer apellido:</label>
                <input type="text" class="form-control" id="apellido1" name="apellido1" placeholder="Primer apellido" value="${usuario.apellido1}" required>
            </div>

            <div class="form-group">
                <label for="apellido2">Segundo apellido:</label>
                <input type="text" class="form-control" id="apellido2" name="apellido2" placeholder="Segundo apellido" value="${usuario.apellido2}" required>
            </div>

            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="${usuario.direccion}" required>
            </div>

            <div class="form-group">
                <label for="provincia">Provincia:</label>
                <input type="text" class="form-control" id="provincia" name="provincia" placeholder="Provincia" value="${usuario.provincia}" required>
            </div>

            <div class="form-group">
                <label for="localidad">Localidad:</label>
                <input type="text" class="form-control" id="localidad" name="localidad" placeholder="Localidad" value="${usuario.localidad}" required>
            </div>

            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" value="${usuario.telefono}" required>
            </div>

            <div class="form-group">
                <label for="dni">DNI:</label>
                <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI" value="${usuario.dni}" required>
            </div>

        <% } %>
        <button type="submit" class="btn btn-primary">Guardar Datos</button>
    </form>

<!-- Formulario de cambio de contraseña -->
<form id="changePasswordForm" method="get" action="CambiarContraseña" class="mt-4" style="display: none;">
    <!-- Campo para la contraseña actual -->
    <div class="form-group">
        <label for="currentPassword">Contraseña actual:</label>
        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
    </div>
    
    <!-- Campo para la nueva contraseña -->
    <div class="form-group">
        <label for="password">Nueva contraseña:</label>
        <input type="password" class="form-control" id="password" name="password" required>
    </div>
    
    <!-- Campo para confirmar la nueva contraseña -->
    <div class="form-group">
        <label for="confirmPassword">Confirmar contraseña:</label>
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
    </div>
    
    <button type="submit" class="btn btn-primary">Cambiar Contraseña</button>
</form>
</div>


<!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function showPersonalDataForm() {
        document.getElementById("personalDataForm").style.display = "block";
        document.getElementById("changePasswordForm").style.display = "none";
    }

    function showChangePasswordForm() {
        document.getElementById("personalDataForm").style.display = "none";
        document.getElementById("changePasswordForm").style.display = "block";
    }
</script>

</body>
<footer>
    <jsp:include page="/vistas/footer/footer.jsp"/>
</footer>
</html>
