package service;

import java.util.List;
import java.util.Map;

import factura.CrearFactura;
import mail.EnviarCorreo;
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
	
	public static List<PedidoVO> findAll(){
		return PedidoDAO.findAll();
	}
	
	public static List<PedidoVO> devuelveListaPedidos(UsuarioVO usuario){
		return PedidoDAO.obtenerPedidosPorUsuario(usuario);
	}
	
	public static List<PedidoVO> filtrarFechaDesc(UsuarioVO usuario){
		return PedidoDAO.filtrarPedidoDesc(usuario);
	}
	
	public static List<PedidoVO> filtrarFechaAsc(UsuarioVO usuario){
		return PedidoDAO.filtrarPedidoAsc(usuario);
	}

	public static boolean cancelarPedido(int pedidoId) {
		return PedidoDAO.cancelarPedido(pedidoId);
	}
	
	public static boolean enviarPedidoAdmin(PedidoVO pedido, UsuarioVO usuario) {
		EnviarCorreo.enviarPedidoConfirmado(pedido, usuario);
		return PedidoDAO.enviarPedidoAdmin(pedido.getId());		
	}
	
	public static boolean cancelarPedidoAdmin(int id) {
		return PedidoDAO.cancelarPedidoAdmin(id);
	}
	
	public static boolean enviarPedidoHilo(PedidoVO pedido, UsuarioVO usuario) {
		EnviarCorreo.enviarPedidoConfirmado(pedido, usuario);		
		return PedidoDAO.enviarPedidoHilo(pedido.getId());
	}
	
	public static List<Integer> obtenerCantidadPedidosUltimosMeses(){
		return PedidoDAO.obtenerCantidadPedidosUltimosMeses();
	}
	
	public static List<Integer> obtenerCantidadPedidosEnviadosUltimosMeses(){
	    return PedidoDAO.obtenerCantidadPedidosUltimosMesesPorEstado("Enviado");
	}

	public static List<Integer> obtenerCantidadPedidosCanceladosUltimosMeses(){
	    return PedidoDAO.obtenerCantidadPedidosUltimosMesesPorEstado("Cancelado");
	}
}
