package control.pedido;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.VO.DetallePedidoVO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.DetallePedidoService;
import service.PedidoService;
import service.ProductoService;

/**
 * Servlet implementation class AdminEnviarPedido
 */
@WebServlet("/AdminEnviarPedido")
public class AdminEnviarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEnviarPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Obtener el ID de usuario del objeto de sesión
        UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");

        // Obtener la lista de pedidos del usuario desde la base de datos
        List<PedidoVO> listaPedidos = (List<PedidoVO>) PedidoService.findAll();

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

		request.getRequestDispatcher("vistas/vistasAdministrador/ProcesarEnvio.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pedidoId = Integer.parseInt(request.getParameter("pedidoId"));
		
        boolean exito = PedidoService.enviarPedidoAdmin(pedidoId);
        
        if (exito) {
        	request.getSession().setAttribute("mensajeExito", "El pedido se envío correctamente.");
        } else {
        	request.getSession().setAttribute("mensajeError", "Error al envíar el pedido. Por favor, inténtelo de nuevo.");
        }
        
        response.sendRedirect(request.getContextPath()+"/AdminEnviarPedido");
	}

}