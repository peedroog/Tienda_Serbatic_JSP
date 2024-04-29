package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import conexion.Conexion;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class PedidoDAO {

	public static int registrarPedido(PedidoVO pedido, UsuarioVO usuario, Map<ProductoVO, Integer> carrito) {

		Connection connection = null;
		PreparedStatement statement = null;

		try {

			String sql = "INSERT INTO pedidos (id_usuario, metodo_pago, estado, num_factura, total) VALUES (?, ?, ?, ?, ?)";
			connection = Conexion.getConexion();
			// Preparar la sentencia SQL
			PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			// Establecer los valores de los parámetros
			pstmt.setInt(1, usuario.getId());
			pstmt.setString(2, pedido.getMetodo_pago());
			pstmt.setString(3, pedido.getEstado());
			pstmt.setString(4, pedido.getNum_factura());
			pstmt.setDouble(5, pedido.getTotal());

			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
				int idPedido = rs.getInt(1);
				return idPedido;
			}

		} catch (SQLException e) {
			// Manejar cualquier excepción de SQL
			e.printStackTrace();
		}
		return 0;

	}
	
	public static List<PedidoVO> findAll() {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		List<PedidoVO> listaPedidos = new ArrayList<>();

		try {
			connection = Conexion.getConexion();
			String sql = "SELECT * FROM pedidos";
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				PedidoVO pedido = new PedidoVO();
				pedido.setId(resultSet.getInt("id"));
				pedido.setId_usuario(resultSet.getInt("id_usuario"));
				pedido.setFecha(resultSet.getDate("fecha"));
				pedido.setMetodo_pago(resultSet.getString("metodo_pago"));
				pedido.setEstado(resultSet.getString("estado"));
				pedido.setNum_factura(resultSet.getString("num_factura"));
				pedido.setTotal(resultSet.getDouble("total"));
				listaPedidos.add(pedido);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaPedidos;
	}

	public static PedidoVO findById(int idPedido) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		PedidoVO pedido = null;

		try {
			// Establecer la conexión a la base de datos
			connection = Conexion.getConexion();

			// Definir la consulta SQL
			String sql = "SELECT * FROM pedidos WHERE id = ?";

			// Preparar la sentencia SQL
			statement = connection.prepareStatement(sql);

			// Establecer el parámetro para el ID del pedido
			statement.setInt(1, idPedido);

			// Ejecutar la consulta
			resultSet = statement.executeQuery();

			// Verificar si se encontró un resultado
			while (resultSet.next()) {
				// Crear un objeto PedidoVO con los datos del resultado
				pedido = new PedidoVO();
				pedido.setId(resultSet.getInt("id"));
				pedido.setId_usuario(resultSet.getInt("id_usuario"));
				pedido.setFecha(resultSet.getDate("fecha"));
				pedido.setMetodo_pago(resultSet.getString("metodo_pago"));
				pedido.setEstado(resultSet.getString("estado"));
				pedido.setNum_factura(resultSet.getString("num_factura"));
				;
				pedido.setTotal(resultSet.getDouble("total"));
				// Puedes continuar llenando el objeto PedidoVO con otros datos si es necesario
			}
		} catch (SQLException e) {
			// Manejar cualquier excepción de SQL
			e.printStackTrace();
		}

		// Devolver el objeto PedidoVO encontrado o null si no se encontró ningún
		// resultado
		return pedido;
	}

	public static List<PedidoVO> obtenerPedidosPorUsuario(UsuarioVO usuario) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		List<PedidoVO> listaPedidos = new ArrayList<>();

		try {
			connection = Conexion.getConexion();
			String sql = "SELECT * FROM pedidos WHERE id_usuario = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, usuario.getId());
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				PedidoVO pedido = new PedidoVO();
				pedido.setId(resultSet.getInt("id"));
				pedido.setId_usuario(resultSet.getInt("id_usuario"));
				pedido.setFecha(resultSet.getDate("fecha"));
				pedido.setMetodo_pago(resultSet.getString("metodo_pago"));
				pedido.setEstado(resultSet.getString("estado"));
				pedido.setNum_factura(resultSet.getString("num_factura"));
				pedido.setTotal(resultSet.getDouble("total"));
				listaPedidos.add(pedido);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaPedidos;
	}
	
	public static List<PedidoVO> filtrarPedidoAsc(UsuarioVO usuario) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    List<PedidoVO> pedidos = new ArrayList<>();
	    
	    try {
	        con = Conexion.getConexion();
	        ps = con.prepareStatement("SELECT * FROM pedidos WHERE id_usuario = ? ORDER BY fecha ASC");
	        ps.setInt(1, usuario.getId());

	        rs = ps.executeQuery();
	        while(rs.next()) {
	            PedidoVO pedido = new PedidoVO();
	            pedido.setId(rs.getInt("id"));
	            pedido.setId_usuario(rs.getInt("id_usuario"));
	            pedido.setFecha(rs.getDate("fecha"));
	            pedido.setMetodo_pago(rs.getString("metodo_pago"));
	            pedido.setEstado(rs.getString("estado"));
	            pedido.setNum_factura(rs.getString("num_factura"));
	            pedido.setTotal(rs.getDouble("total"));
	            pedidos.add(pedido);
	            
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return pedidos;
	}
	
	public static List<PedidoVO> filtrarPedidoDesc(UsuarioVO usuario) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    List<PedidoVO> pedidos = new ArrayList<>();
	    
	    try {
	        con = Conexion.getConexion();
	        ps = con.prepareStatement("SELECT * FROM pedidos WHERE id_usuario = ? ORDER BY fecha DESC");
	        ps.setInt(1, usuario.getId());

	        rs = ps.executeQuery();
	        while(rs.next()) {
	            PedidoVO pedido = new PedidoVO();
	            pedido.setId(rs.getInt("id"));
	            pedido.setId_usuario(rs.getInt("id_usuario"));
	            pedido.setFecha(rs.getDate("fecha"));
	            pedido.setMetodo_pago(rs.getString("metodo_pago"));
	            pedido.setEstado(rs.getString("estado"));
	            pedido.setNum_factura(rs.getString("num_factura"));
	            pedido.setTotal(rs.getDouble("total"));
	            pedidos.add(pedido);
	            
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return pedidos;
	}
	
	   public static boolean cancelarPedido(int id) {
	        Connection con = null;
	        PreparedStatement ps = null;

	        boolean exito = false;
	        
	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("UPDATE pedidos SET estado = 'Pendiente cancelación' WHERE id = ?");
	            ps.setInt(1, id);

	            int filas = ps.executeUpdate();

	            if (filas > 0) {
	            	exito = true;
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return exito;
	   }
	   
	   public static boolean cancelarPedidoAdmin(int id) {
	        Connection con = null;
	        PreparedStatement ps = null;

	        boolean exito = false;
	        
	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("UPDATE pedidos SET estado = 'Cancelado' WHERE id = ?");
	            ps.setInt(1, id);

	            int filas = ps.executeUpdate();

	            if (filas > 0) {
	            	exito = true;
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return exito;
	   }
	   
	   public static boolean enviarPedidoAdmin(int id) {
	        Connection con = null;
	        PreparedStatement ps = null;

	        boolean exito = false;
	        
	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("UPDATE pedidos SET estado = 'Enviado' WHERE id = ?");
	            ps.setInt(1, id);

	            int filas = ps.executeUpdate();

	            if (filas > 0) {
	            	exito = true;
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return exito;
	   }

}
