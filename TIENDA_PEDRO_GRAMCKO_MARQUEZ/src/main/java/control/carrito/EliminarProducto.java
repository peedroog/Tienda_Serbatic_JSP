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
 * Servlet implementation class EliminarProductoServlet
 */
@WebServlet("/EliminarProducto")
public class EliminarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarProducto() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el parámetro del formulario
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Obtener el carrito de la sesión
        Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");

        ProductoVO producto = ProductoDAO.findById(productId);
        
        // Eliminar el producto del carrito
        if (producto != null) {
            carrito.remove(producto);
            System.out.println("Producto eliminado del carrito: " + producto.getId());
        } else {
            // Manejar error si no se encuentra el producto en la base de datos
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "El producto no está en la base de datos");
            return;
        }

        // Redireccionar de vuelta a la página del carrito
        response.sendRedirect(request.getContextPath()+ "/Carrito");
	}

}
