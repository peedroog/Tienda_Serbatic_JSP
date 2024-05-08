<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
<meta charset="ISO-8859-1">
<title>HappyPets</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="vistas/login/login.css" rel="stylesheet">
</head>
<header>
<jsp:include page="/vistas/header/header.jsp"/>
</header>
<body>
			<% ResourceBundle rb = (ResourceBundle) request.getAttribute("idiomas");%>
<a class="hidden" href="<%=request.getContextPath() %>?lang=en"></a>
<div class="container login-container d-flex justify-content-center align-items-center">
    <div class="text-center">
        <h1 class="mt-4">Iniciar sesión</h1>
        
        <!-- Div para mostrar el mensaje de error -->
        <div id="errorInicioSesion" class="alert alert-danger d-none" role="alert">
            <!-- Aquí se mostrará el mensaje de error -->
        </div>
        

        <form method="post" action="Login" class="mt-4">
            <div class="form-group row">
                <div class="col">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Correo electrónico" required>
                </div>
            </div>
            <div class="form-group row">
                <div class="col">
                    <input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" name="login">Iniciar sesión</button>
        </form>
        <form action="RegistrarUsuario" method="get">
            <button type="submit" class="btn btn-success my-3" name="login">Registrarme</button>
        </form>
    </div>
</div>


<!-- Bootstrap JS (opcional, si necesitas funcionalidad JS de Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<% 
    String errorInicioSesion = (String) request.getAttribute("errorInicioSesion");
    if (errorInicioSesion != null && !errorInicioSesion.isEmpty()) { 
%>
    <script>
        $(document).ready(function() {
            // Muestra el mensaje de error
            $('#errorInicioSesion').text('<%= errorInicioSesion %>').removeClass('d-none');
        });
    </script>
<% } %>
<script>
    document.getElementById('email').addEventListener('input', function() {
        var emailInput = document.getElementById('email');
        if (emailInput.value.toLowerCase() === 'admin') {
            emailInput.type = 'text'; // Cambiar el tipo de entrada a texto
        } else {
            emailInput.type = 'email'; // Mantener el tipo de entrada como correo electrónico
        }
    });
</script>
</body>
<footer>
<jsp:include page="/vistas/footer/footer.jsp"/>
</footer>
</html>
