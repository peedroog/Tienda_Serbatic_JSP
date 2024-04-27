package control.pedido;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PedidoService;
import service.ProductoService;
import model.DAO.ProductoDAO;
import model.VO.*;

/**
 * Servlet implementation class FiltrarPedido
 */
@WebServlet("/FiltrarPedido")
public class FiltrarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltrarPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el parámetro de filtro enviado desde el cliente
    	String orderBy = request.getParameter("orderBy");
        UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");


        if (orderBy != null) {

            switch (orderBy) {
                case "fechaAsc":
                    request.setAttribute("pedidosFiltro", PedidoService.filtrarFechaAsc(usuario));
                    break;
                case "fechaDesc":
                	request.setAttribute("pedidosFiltro", PedidoService.filtrarFechaDesc(usuario));
                    break;
                default:
                    break;
            }

            request.getRequestDispatcher("MisPedidos").forward(request, response);
        }
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
