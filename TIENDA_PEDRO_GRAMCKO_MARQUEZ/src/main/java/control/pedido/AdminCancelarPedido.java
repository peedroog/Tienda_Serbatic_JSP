package control.pedido;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PedidoService;

/**
 * Servlet implementation class AdminCancelarPedido
 */
@WebServlet("/AdminCancelarPedido")
public class AdminCancelarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCancelarPedido() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pedidoId = Integer.parseInt(request.getParameter("pedidoId"));
		
        boolean exito = PedidoService.cancelarPedidoAdmin(pedidoId);
        
        if (exito) {
        	request.getSession().setAttribute("mensajeExito", "El pedido se canceló correctamente.");
        } else {
        	request.getSession().setAttribute("mensajeError", "Error al cancelar el pedido. Por favor, inténtelo de nuevo.");
        }
        
        response.sendRedirect(request.getContextPath()+"/AdminEnviarPedido");
		
		
	}

}
