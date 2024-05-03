<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!doctype html>
<html lang="es" data-bs-theme="auto">
  <head>
  <link rel="icon" type="image/x-icon" href="ico/perro.png">
    <meta charset="utf-8">
    <title>Finalizar compra</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">
    <link href="vistas/header/bootstrap.min.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
    </style>

    <!-- Custom styles for this template -->
    <link href="vistas/checkout/checkout.css" rel="stylesheet">
  </head>
  <header>
  <jsp:include page="/vistas/header/header.jsp"></jsp:include>
  </header>
  
  
  
  <body class="bg-body-tertiary">


<%

// Inicialización de variables para los datos del usuario
String email = (String) request.getAttribute("email");
String nombre = (String) request.getAttribute("nombre");
String apellido1 = (String) request.getAttribute("apellido1");
String apellido2 = (String) request.getAttribute("apellido2");
String telefono = (String) request.getAttribute("telefono");
String dni = (String) request.getAttribute("dni");
String direccion = (String) request.getAttribute("direccion");
String provincia = (String) request.getAttribute("provincia");
String localidad = (String) request.getAttribute("localidad");
%>

			<% ResourceBundle rb = (ResourceBundle) request.getAttribute("idiomas");%>
<a class="hidden" href="<%=request.getContextPath() %>?lang=en"></a>
    <div align="center" class="container">

        <div class="py-5 text-center">

          <h2>Finaliza la compra</h2>
        </div>

        <div class="col-md-7 col-lg-8">
          <h4 class="mb-3">Datos del envío</h4>

            

              <div class="col-sm-12">
                <label for="telefono" class="form-label">Telefono</label>
                <input type="number" class="form-control" id="telefono"  value="<%=telefono %>" required disabled>
                <div class="invalid-feedback">
                  Please enter your phone number.
                </div>
              </div>
            

              <div class="col-12">
                <label for="direccion" class="form-label">Direccion</label>
                <input type="text" class="form-control" id="direccion" value="<%=direccion %>" required disabled>
                <div class="invalid-feedback">
                  Please enter your address.
                </div>
              </div>
            
              <div class="col-12">
                <label for="provincia" class="form-label">Provincia</label>
                <input type="text" class="form-control" id="provincia" value="<%=provincia %>" required disabled>
                <div class="invalid-feedback">
                  Please enter your province.
                </div>
              </div>
            
              <div class="col-12">
                <label for="localidad" class="form-label">Localidad</label>
                <input type="text" class="form-control" id="localidad" value="<%=localidad %>"  required disabled>
                <div class="invalid-feedback">
                  Please enter your locality.
                </div>
              </div>
              
			
				<form action="<%= request.getContextPath() %>/RellenarDatosUsuario" method="GET">
					<div class="col-12">
						<button type="submit" class="btn btn-primary" id="modificarDatos">Modificar Datos</button>
					</div>
				</form>
				
            
              
            </div>

            <hr class="my-4">

            
				<div class="contenedor-pagos">
				
				<img alt="" src="img/4C8QsKX.png" style="width: 40%" >
				<h4 class="mb-3">Métodos de pago</h4>
				<!-- Opciones de método de pago -->
                <div class="my-3">
                    <div class="form-check">
                        <input id="credit" name="paymentMethod" type="radio" class="form-check-input" value="tarjeta" checked required>
                        <label class="form-check-label" for="credit">Tarjeta de débito/crédito</label>
                    </div>
                    <div class="form-check">
                        <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" value="paypal" required>
                        <label class="form-check-label" for="paypal">Paypal</label>
                    </div>
                </div>

                <!-- Campos para los datos de la tarjeta -->
                <div id="datosTarjeta" style="display: none;">
                    <div class="row gy-3">
                        <div class="col-md-6">
                            <label for="cc-name" class="form-label">Nombre completo</label>
                            <input type="text" class="form-control" id="cc-name" placeholder="" required>
                            <small class="text-body-secondary">Nombre completo en la tarjeta</small>
                            <div class="invalid-feedback">
                                Name on card is required
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="cc-number" class="form-label">Número de tarjeta</label>
                            <input type="number" class="form-control" id="cc-number" placeholder="" required>
                            <div class="invalid-feedback">
                                Credit card number is required
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cc-expiration" class="form-label">Expiration</label>
                            <input type="number" class="form-control" id="cc-expiration" placeholder="" required>
                            <div class="invalid-feedback">
                                Expiration date required
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cc-cvv" class="form-label">CVV</label>
                            <input type="password" class="form-control" id="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Security code required
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Campos para los datos de Paypal -->
                <div id="datosPaypal" style="display: none;">
                    <div class="row gy-3">
                        <div class="col-md-6">
                            <label for="paypal-email" class="form-label">Correo electrónico</label>
                            <input type="email" class="form-control" id="paypal-email" placeholder="" required>
                            <div class="invalid-feedback">
                                Email is required
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="paypal-password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="paypal-password" placeholder="" required>
                            <div class="invalid-feedback">
                                Password is required
                            </div>
                        </div>
                    </div>
                </div>
				
				
				</div>
                

            <hr class="my-4">
            
			<form action="<%= request.getContextPath() %>/FinalizarCompra" method="POST">
				<input type="hidden" id="selectedPaymentMethod" name="selectedPaymentMethod">
				<button class="w-100 btn btn-primary btn-lg btn-finalizar" type="submit">Tramitar pedido</button>
			</form>
            

        </div>
      </div>
      


<script>
    // Función para mostrar u ocultar los campos relevantes según la opción seleccionada
function mostrarOcultarCampos() {
    var metodoPago = document.querySelector('input[name="paymentMethod"]:checked').value;

    // Ocultar todos los campos primero
    document.getElementById("datosTarjeta").style.display = "none";
    document.getElementById("datosPaypal").style.display = "none";

    // Mostrar los campos relevantes según la opción seleccionada
    if (metodoPago === "tarjeta") {
        document.getElementById("datosTarjeta").style.display = "block";
    } else if (metodoPago === "paypal") {
        document.getElementById("datosPaypal").style.display = "block";
    }
    
    document.getElementById("selectedPaymentMethod").value = metodoPago;
}

    // Agregar un event listener para el cambio en la selección de método de pago
    var radios = document.querySelectorAll('input[name="paymentMethod"]');
    radios.forEach(function(radio) {
        radio.addEventListener("change", mostrarOcultarCampos);
    });

    // Llamar a la función inicialmente para asegurar que los campos correctos estén mostrados u ocultos
    mostrarOcultarCampos();
</script>

<script src="checkout.js"></script>
</body>
<footer>
<jsp:include page="/vistas/footer/footer.jsp"/>
</footer>
</html>
