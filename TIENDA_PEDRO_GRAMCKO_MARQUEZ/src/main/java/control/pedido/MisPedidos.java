package control.pedido;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.PedidoDAO;
import model.VO.DetallePedidoVO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.DetallePedidoService;
import service.PedidoService;
import service.ProductoService;

/**
 * Servlet implementation class MisPedidos
 */
@WebServlet("/MisPedidos")
public class MisPedidos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MisPedidos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID de usuario del objeto de sesión
        UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");

        // Obtener la lista de pedidos del usuario desde la base de datos
        List<PedidoVO> listaPedidos = (List<PedidoVO>) PedidoService.devuelveListaPedidos(usuario);

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
        
        // Obtener y establecer las líneas de detalle para cada pedido
        for (PedidoVO pedido : listaPedidos) {
            List<DetallePedidoVO> lineasPedido = DetallePedidoService.obtenerLineasPorPedido(pedido);
            // Crear una lista para almacenar los nombres de los productos
            List<String> nombresProductos = new ArrayList<>();
            // Obtener el nombre de cada producto y agregarlo a la lista
            for (DetallePedidoVO linea : lineasPedido) {
                ProductoVO producto = ProductoService.findById(linea.getId_producto());
                nombresProductos.add(producto.getNombre());
            }
            // Establecer la lista de nombres de productos como atributo de la solicitud
            request.setAttribute("nombresProductos_" + pedido.getId(), nombresProductos);
            // Establecer las líneas de detalle como atributo de la solicitud
            request.setAttribute("lineasPedido_" + pedido.getId(), lineasPedido);
        }

        // Establecer la lista de pedidos como atributo en el request
        request.setAttribute("listaPedidos", listaPedidos);
        
		if(request.getAttribute("pedidosFiltro") != null) {
			request.setAttribute("listaPedidos", request.getAttribute("pedidosFiltro"));
		}
        // Redirigir a la página JSP para mostrar los pedidos
        request.getRequestDispatcher("/vistas/misPedidos.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
