package control.pedido;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PedidoService;

/**
 * Servlet implementation class CancelarPedido
 */
@WebServlet("/CancelarPedido")
public class CancelarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelarPedido() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del pedido que se desea cancelar desde la solicitud
        int pedidoId = Integer.parseInt(request.getParameter("pedidoId"));

        // Llamar al servicio para cancelar el pedido
        boolean exito = PedidoService.cancelarPedido(pedidoId);

        if (exito) {
        	request.getSession().setAttribute("mensajeExito", "El pedido se canceló correctamente.");
        } else {
        	request.getSession().setAttribute("mensajeError", "Error al cancelar el pedido. Por favor, inténtelo de nuevo.");
        }
        
        response.sendRedirect("MisPedidos");
    }

}
