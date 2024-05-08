package control.entrada;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.PedidoDAO;
import model.VO.ProductoMasVendidoDTO;
import model.VO.UsuarioVO;
import service.ProductoService;



/**
 * Servlet implementation class EntradaAdministrador
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
		
		List<ProductoMasVendidoDTO> productosMasVendidos = ProductoService.obtener6ProductosMasVendidos();
		
		List<String> etiquetas = new ArrayList<>();
		List<Integer> datos = new ArrayList<>();
		
	    for (ProductoMasVendidoDTO producto : productosMasVendidos) {
	        etiquetas.add(producto.getNombre());
	        datos.add(producto.getCantidadVendida());
	    }
	    
	    List<Integer> productosUltimosMeses = PedidoDAO.obtenerCantidadPedidosUltimosMeses();
	    List<Integer> pedidosCancelados = PedidoDAO.obtenerCantidadPedidosUltimosMesesPorEstado("Cancelado");
	    List<Integer> pedidosEnviados = PedidoDAO.obtenerCantidadPedidosUltimosMesesPorEstado("Enviado");
	    
	    request.setAttribute("pedidosEnviados", pedidosEnviados);
	    request.setAttribute("pedidosCancelados", pedidosCancelados);
	    request.setAttribute("productosUltimosMeses", productosUltimosMeses);
	    request.setAttribute("etiquetas", etiquetas);
	    request.setAttribute("datos", datos);
		
		if (usuario == null) {
		    response.sendRedirect(request.getContextPath());
		} else {
		    if (usuario.getId_rol() == 1) {
		        response.sendRedirect(request.getContextPath());
		    } else {
		        request.getRequestDispatcher("/vistas/vistasAdministrador/indexEmpleado/index.jsp").forward(request, response);
		    }
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
