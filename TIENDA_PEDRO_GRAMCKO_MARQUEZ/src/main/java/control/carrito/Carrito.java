package control.carrito;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CarritoDAO;
import model.VO.ProductoVO;
import service.ProductoService;

/**
 * Servlet implementation class Carrito
 */
@WebServlet("/Carrito")
public class Carrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Carrito() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Recuperar el carrito de la sesión
		@SuppressWarnings("unchecked")
		Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");
		DecimalFormat decimalFormat = new DecimalFormat("#.##");

		// Calcular el total del carrito
		double precio = CarritoDAO.devuelvePrecioCarrito(carrito);
		request.setAttribute("precioTotal", decimalFormat.format(precio));

	    if (!"/RellenarDatosUsuario".equals(request.getServletPath())) {
	        request.getSession().setAttribute("ultimaRuta", request.getRequestURI() + "?" + request.getQueryString());
	    }

		// Declaración del array para los mensajes de error
		ArrayList<String> erroresStock = new ArrayList<>();

		// Verificar el stock de cada producto en el carrito
		for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
			ProductoVO producto = entry.getKey();
			int cantidadEnCarrito = entry.getValue();

			// Obtener el stock actual del producto desde la base de datos
			Integer stockDisponible = ProductoService.devuelveStockDeProducto(producto.getId());

			// Verificar si hay suficiente stock para el producto
			if (stockDisponible < cantidadEnCarrito) {

				cantidadEnCarrito = stockDisponible;
				if (cantidadEnCarrito == 0) {
					carrito.remove(producto);

				} else {
					carrito.put(producto, cantidadEnCarrito);
				}

				
				double nuevoPrecio = CarritoDAO.devuelvePrecioCarrito(carrito);

				// Actualizar los atributos "precioTotal" y "precioTotalConIVA" en el request
				request.setAttribute("precioTotal", decimalFormat.format(nuevoPrecio));
				erroresStock.add("No hay suficiente stock para el producto '" + producto.getNombre());
			}
		}

		// Guardar el array de errores en el request
		request.setAttribute("erroresStock", erroresStock);

		// Redireccionar a la página de carrito
		request.getRequestDispatcher("/vistas/carrito.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
