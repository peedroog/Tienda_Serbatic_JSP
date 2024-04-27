package service;

import java.util.List;
import java.util.Map;

import model.DAO.PedidoDAO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class PedidoService {

	public static int devolverIdPedido(PedidoVO pedido, UsuarioVO usuario, Map<ProductoVO, Integer> carrito) {
		
		return PedidoDAO.registrarPedido(pedido, usuario, carrito);
	}
	
	public static PedidoVO devuelvePedido(int idPedido) {
		
		return PedidoDAO.findById(idPedido);
	}
	
	public static List<PedidoVO> devuelveListaPedidos(UsuarioVO usuario){
		return PedidoDAO.obtenerPedidosPorUsuario(usuario);
	}
	
	public static List<PedidoVO> filtrarFechaAsc(UsuarioVO usuario){
		return PedidoDAO.filtrarPedidoAsc(usuario);
	}
	
	public static List<PedidoVO> filtrarFechaDesc(UsuarioVO usuario){
		return PedidoDAO.filtrarPedidoDesc(usuario);
	}

	public static boolean cancelarPedido(int pedidoId) {
		return PedidoDAO.cancelarPedido(pedidoId);
	}
	
}
