package control.carrito;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.ProductoDAO;
import model.VO.ProductoVO;

/**
 * Servlet implementation class ActualizarCantidad
 */
@WebServlet("/ActualizarCantidad")
public class ActualizarCantidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarCantidad() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        int productId = Integer.parseInt(request.getParameter("productId"));
        int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));

        // Obtener el carrito de la sesión
        Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");

        // Buscar el producto por su ID en la base de datos
        ProductoVO producto = ProductoDAO.findById(productId);

        // Actualizar la cantidad del producto en el carrito
        if (producto != null) {
            carrito.put(producto, nuevaCantidad);
            System.out.println("Cantidad del producto actualizada en el carrito: " + producto.getId() + ", nueva cantidad: " + nuevaCantidad);
        } else {
            // Manejar error si no se encuentra el producto en la base de datos
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "El producto no está en la base de datos");
            return;
        }

        // Redireccionar de vuelta a la página del carrito
        response.sendRedirect(request.getContextPath() + "/Carrito");
    }

}
