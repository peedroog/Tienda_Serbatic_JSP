package service;

import java.util.List;
import java.util.Map;

import model.DAO.DetallePedidoDAO;
import model.VO.DetallePedidoVO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class DetallePedidoService {

	public static void registrarLineaPedido(PedidoVO pedido, UsuarioVO usuario, Map<ProductoVO, Integer> carrito, DetallePedidoVO detalle) {
		
		DetallePedidoDAO.registrarDetallePedido(pedido, usuario, carrito, detalle);
		
	}
	
	public static List<DetallePedidoVO> obtenerLineasPorPedido(PedidoVO pedido){
		
		return DetallePedidoDAO.obtenerLineasPorPedido(pedido);
	}
	
}
