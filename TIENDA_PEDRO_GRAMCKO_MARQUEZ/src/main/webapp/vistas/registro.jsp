<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
    <meta charset="UTF-8">
    <title>HappyPets</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<header>
<jsp:include page="/vistas/header/header.jsp"/>
</header>
<body>
<div class="container" style="margin-top: 50px; margin-bottom: 50px; min-height: 55vh;">
    <h1 class="mt-4">Registro</h1>

    <!-- Div para mostrar el mensaje de error -->
    <div id="errorRegistro" class="alert alert-danger d-none" role="alert">
        <!-- Aquí se mostrará el mensaje de error -->
    </div>

    <form method="post" action="RegistrarUsuario" class="mt-4" id="registroForm">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
        </div>
        <div class="form-group">
            <label for="clave">Contraseña:</label>
            <input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" required>
        </div>
        <div class="form-group">
            <label for="confirmarClave">Confirmar Contraseña:</label>
            <input type="password" class="form-control" id="confirmarClave" name="confirmarClave" placeholder="Confirmar Contraseña" required>
        </div>
        <!-- Otros campos del formulario -->
        <button type="submit" class="btn btn-primary">Registrarme</button>
    </form>
</div>


<!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<% 
    String errorRegistro = (String) request.getAttribute("errorRegistro");
    if (errorRegistro != null && !errorRegistro.isEmpty()) { 
%>
    <script>
        $(document).ready(function() {
            // Muestra el mensaje de error
            $('#errorRegistro').text('<%= errorRegistro %>').removeClass('d-none');
        });
    </script>
<% } %>

<script>
    document.getElementById("registroForm").addEventListener("submit", function(event) {
        var clave = document.getElementById("clave").value;
        var confirmarClave = document.getElementById("confirmarClave").value;

        if (clave !== confirmarClave) {
            alert("Las contraseñas no coinciden");
            event.preventDefault(); // Evita que el formulario se envíe si las contraseñas no coinciden
        }
    });
</script>
</body>
<footer>
<jsp:include page="/vistas/footer/footer.jsp"/>
</footer>
</html>
