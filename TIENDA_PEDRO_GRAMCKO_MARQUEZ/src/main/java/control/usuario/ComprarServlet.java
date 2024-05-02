package control.usuario;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.ProductoDAO;
import model.VO.ProductoVO;

@WebServlet("/ComprarServlet")
public class ComprarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ComprarServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if (request.getParameter("id") != null) {
				String id = request.getParameter("id");

				// Lógica de negocio para agregar producto al carrito
				HttpSession session = request.getSession();
				@SuppressWarnings("unchecked")
				Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) session.getAttribute("carrito");

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
				
				if (carrito == null) {
					carrito = new HashMap<>();
					session.setAttribute("carrito", carrito);
				}

				ProductoVO producto = ProductoDAO.findById(Integer.parseInt(id));
				
				 // Verificar si el producto ya está en el carrito
                if (carrito.containsKey(producto)) {
                    carrito.put(producto, carrito.get(producto) + 1); // Incrementar la cantidad
                    System.out.println("Cantidad del producto actualizada en el carrito: " + id);
                } else {
                    carrito.put(producto, 1); // Añadir el producto al carrito con cantidad 1
                    System.out.println("Producto añadido al carrito: " + id + " cantidad: 1");
                }

                // Imprimir el contenido del carrito (solo para propósitos de prueba)
                for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
                    System.out.println("ID del producto: " + entry.getKey().getId() + ", Cantidad: " + entry.getValue());
                }
            } else {
                // Manejar error si no se proporciona ID
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del producto no proporcionado");
                return;
            }

			// Redireccionar a la página de carrito después de la compra
			response.sendRedirect(request.getContextPath());
		} catch (NumberFormatException e) {
			// Manejar error al convertir ID a entero
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID del producto inválido");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
