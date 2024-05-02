package control.carrito;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CarritoDAO;
import model.VO.DetallePedidoVO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.DetallePedidoService;
import service.PedidoService;
import service.ProductoService;
import service.UsuarioService;

/**
 * Servlet implementation class FinalizarCompra
 */
@WebServlet("/FinalizarCompra")
public class FinalizarCompra extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FinalizarCompra() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
		Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");

	    String lang = request.getParameter("lang");
	    

	    Locale locale;
	    ResourceBundle idiomas;
	    if (lang != null && !lang.isEmpty()) {
	        locale = new Locale(lang);
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    } else {
	        // Establecer un idioma predeterminado si no se ha seleccionado ninguno
	        locale = new Locale("es"); // Español como idioma predeterminado
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    }

	    request.setAttribute("languaje", lang);
	    request.setAttribute("idiomas", idiomas);
		
		// Verificar el stock de cada producto en el carrito
		for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
			ProductoVO producto = entry.getKey();
			int cantidadEnCarrito = entry.getValue();

			// Obtener el stock actual del producto desde la base de datos
			Integer stockDisponible = ProductoService.devuelveStockDeProducto(producto.getId());

			// Verificar si hay suficiente stock para el producto
			if (stockDisponible < cantidadEnCarrito) {
				// Si no hay suficiente stock, configurar el mensaje de error
				String errorStock = "No hay suficiente stock para el producto '" + producto.getNombre() + "'.";
				request.setAttribute("erroresStock", errorStock);
				carrito.remove(producto);

				// Redireccionar al carrito con el mensaje de error
				response.sendRedirect(request.getContextPath()+"/Carrito");
				return;
			}
		}

		// Si hay suficiente stock para todos los productos en el carrito, redirigir a
		// checkout
		request.setAttribute("email", usuario.getEmail());
		request.setAttribute("nombre", usuario.getNombre());
		request.setAttribute("apellido1", usuario.getApellido1());
		request.setAttribute("apellido2", usuario.getApellido2());
		request.setAttribute("direccion", usuario.getDireccion());
		request.setAttribute("provincia", usuario.getProvincia());
		request.setAttribute("localidad", usuario.getLocalidad());
		request.setAttribute("telefono", usuario.getTelefono());
		request.setAttribute("dni", usuario.getDni());

		request.getSession().setAttribute("ultimaRuta", request.getRequestURI() + "?" + request.getQueryString());
		request.getRequestDispatcher("/vistas/checkout/checkout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
		@SuppressWarnings("unchecked")
		Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");
		double precio = CarritoDAO.devuelvePrecioCarrito(carrito);
		String metodoPago = request.getParameter("selectedPaymentMethod");

		PedidoVO pedido = null;
		DetallePedidoVO detalle = null;

		pedido = new PedidoVO();
		pedido.setId_usuario(usuario.getId());
		pedido.setMetodo_pago(metodoPago);
		pedido.setEstado("Pendiente de envío");
		pedido.setTotal((precio));

		int idPedido = PedidoService.devolverIdPedido(pedido, usuario, carrito);

	    String lang = request.getParameter("lang");
	    

	    Locale locale;
	    ResourceBundle idiomas;
	    if (lang != null && !lang.isEmpty()) {
	        locale = new Locale(lang);
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    } else {
	        // Establecer un idioma predeterminado si no se ha seleccionado ninguno
	        locale = new Locale("es"); // Español como idioma predeterminado
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    }

	    request.setAttribute("languaje", lang);
	    request.setAttribute("idiomas", idiomas);
		
		for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
			ProductoVO producto = entry.getKey();
			Integer cantidad = entry.getValue();

			// Crear un detalle de pedido para este producto
			detalle = new DetallePedidoVO();
			detalle.setId_pedido(idPedido);
			detalle.setId_producto(producto.getId());
			detalle.setPrecio_unidad(producto.getPrecio());
			detalle.setUnidades(cantidad);
			detalle.setImpuesto((float) 21.00);
			detalle.setTotal((detalle.getPrecio_unidad() * (detalle.getUnidades())));

			DetallePedidoService.registrarLineaPedido(pedido, usuario, carrito, detalle);
			
			int nuevoStock = producto.getStock() - cantidad;
			producto.setStock(nuevoStock);
			ProductoService.actualizaStock(producto);

		}

		PedidoVO datosPedido = PedidoService.devuelvePedido(idPedido);

		request.setAttribute("idPedido", datosPedido.getId());
		request.setAttribute("fechaPedido", datosPedido.getFecha());
		request.setAttribute("total", datosPedido.getTotal());

		carrito.clear();
		request.getSession().setAttribute("carrito", carrito);
		request.getRequestDispatcher("/vistas/pedidoCompletado.jsp").forward(request, response);

	}

}
