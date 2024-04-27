<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="ico/perro.png">
    <meta charset="UTF-8">
    <title>HappyPets</title>
    <!-- Enlace a Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<header>
<jsp:include page="/vistas/header/header.jsp"></jsp:include>
</header>
<body>
    <div class="container" style="margin-top: 50px; margin-bottom: 50px">
        <h1 class="mt-5">Formulario de Contacto</h1>
        <form action="procesar_consulta.jsp" method="post">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" class="form-control">
            </div>
            <div class="form-group">
                <label for="mensaje">Mensaje:</label>
                <textarea id="mensaje" name="mensaje" class="form-control" rows="5" required></textarea>
            </div>
            <div class="form-group">
                <label for="categoria">Categoría de Consulta:</label>
                <select id="categoria" name="categoria" class="form-control">
                    <option value="productos">Consultas sobre Productos</option>
                    <option value="servicios">Consultas sobre Servicios</option>
                    <option value="politicas">Consultas sobre Políticas</option>
                    <option value="generales">Consultas Generales</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Enviar Consulta</button>
        </form>
    </div>
</body>
<footer>
	<jsp:include page="/vistas/footer/footer.jsp"></jsp:include>
</footer>

</html>
