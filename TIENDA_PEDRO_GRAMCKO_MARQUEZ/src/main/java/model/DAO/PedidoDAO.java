package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import conexion.Conexion;
import model.VO.PedidoVO;
import model.VO.ProductoMasVendidoDTO;
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
	
	public static List<PedidoVO> filtrarPedidoDesc(UsuarioVO usuario) {
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
	
	public static List<PedidoVO> filtrarPedidoAsc(UsuarioVO usuario) {
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
		    ResultSet rs = null;
		    boolean exito = false;
		    
		    try {
		        con = Conexion.getConexion();
		        
		        // Paso 1: Obtener el número de factura actual
		        ps = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'factura'");
		        rs = ps.executeQuery();
		        String numeroFactura = "";
		        if (rs.next()) {
		            numeroFactura = rs.getString("valor");
		        }
		        
		        // Paso 2: Incrementar el número de factura en 1
		        int numFacturaInt = Integer.parseInt(numeroFactura);
		        numFacturaInt++;
		        
		        // Paso 3: Actualizar el estado del pedido a "Enviado"
		        ps = con.prepareStatement("UPDATE pedidos SET estado = 'Enviado' WHERE id = ?");
		        ps.setInt(1, id);
		        int filasPedido = ps.executeUpdate();
		        
		        // Paso 4: Actualizar el número de factura en el pedido
		        ps = con.prepareStatement("UPDATE pedidos SET num_factura = ? WHERE id = ?");
		        ps.setString(1, String.format("%05d", numFacturaInt));
		        ps.setInt(2, id);
		        int filasFactura = ps.executeUpdate();

		        // Si ambas actualizaciones tienen éxito, se considera una operación exitosa
		        if (filasPedido > 0 && filasFactura > 0) {
		            exito = true;
		            
		            // Actualizar el número de factura en la tabla de configuración
		            ps = con.prepareStatement("UPDATE configuracion SET valor = ? WHERE clave = 'factura'");
		            ps.setString(1, String.valueOf(numFacturaInt));
		            ps.executeUpdate();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    return exito;
		}
	   
	   public static boolean enviarPedidoHilo(int id) {
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
	   
	   public static int obtenerPedidosEnviados() {
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int cantidad = 0;
	        
	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("SELECT COUNT(*) FROM pedidos WHERE estado = ?");
	            ps.setString(1, "Enviado");

	            rs = ps.executeQuery();

	            if (rs.next()) {
	            	cantidad = rs.getInt(1);
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return cantidad;
	   }
	   
	   public static int obtenerPromedioPedido() {
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int cantidad = 0;

	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("SELECT AVG(total) AS promedio_pedido FROM pedidos WHERE estado = ?");
	            ps.setString(1, "Enviado");

	            rs = ps.executeQuery();

	            if (rs.next()) {
	            	cantidad = rs.getInt(1);
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return cantidad;
	   }
	   
	   public static int obtenerPedidosCancelados() {
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int cantidad = 0;

	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("SELECT COUNT(*) FROM pedidos WHERE estado = ?");
	            ps.setString(1, "Cancelado");

	            rs = ps.executeQuery();

	            if (rs.next()) {
	            	cantidad = rs.getInt(1);
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return cantidad;
	   }
	   
		public static List<Integer> obtenerCantidadPedidosUltimosMeses(){
			
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			List<Integer> cantidadPedidos = new ArrayList<>();

			try {
			    con = Conexion.getConexion();
			    ps = con.prepareStatement("SELECT COUNT(*) as cantidad_pedidos " +
                        "FROM pedidos " +
                        "WHERE fecha BETWEEN ? AND ? " +
                        "GROUP BY YEAR(fecha), MONTH(fecha) " +
                        "ORDER BY YEAR(fecha) DESC, MONTH(fecha) DESC " +
                        "LIMIT 6");
		           // Obtener la fecha actual y retroceder 6 meses
	            Calendar cal = Calendar.getInstance();
	            cal.add(Calendar.MONTH, -6);
	            java.sql.Date fechaInicio = new java.sql.Date(cal.getTimeInMillis());
	            java.sql.Date fechaFin = new java.sql.Date(System.currentTimeMillis());
	            
	            ps.setDate(1, fechaInicio);
	            ps.setDate(2, fechaFin);
	            

			    rs = ps.executeQuery();
			    while (rs.next()) {
			        cantidadPedidos.add(rs.getInt("cantidad_pedidos"));			        
			    }
			} catch (SQLException e) {
			    e.printStackTrace();
			}

			return cantidadPedidos;
		}
		
		public static List<Integer> obtenerCantidadPedidosUltimosMesesPorEstado(String estado){
		    Connection con = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    List<Integer> cantidadPedidos = new ArrayList<>();

		    try {
		        con = Conexion.getConexion();
		        ps = con.prepareStatement("SELECT COUNT(*) as cantidad_pedidos " +
		                "FROM pedidos " +
		                "WHERE estado = ? AND fecha BETWEEN ? AND ? " +
		                "GROUP BY YEAR(fecha), MONTH(fecha) " +
		                "ORDER BY YEAR(fecha) DESC, MONTH(fecha) DESC " +
		                "LIMIT 6");
		        // Obtener la fecha actual y retroceder 6 meses
		        Calendar cal = Calendar.getInstance();
		        cal.add(Calendar.MONTH, -6);
		        java.sql.Date fechaInicio = new java.sql.Date(cal.getTimeInMillis());
		        java.sql.Date fechaFin = new java.sql.Date(System.currentTimeMillis());

		        ps.setString(1, estado);
		        ps.setDate(2, fechaInicio);
		        ps.setDate(3, fechaFin);

		        rs = ps.executeQuery();
		        while (rs.next()) {
		            cantidadPedidos.add(rs.getInt("cantidad_pedidos"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return cantidadPedidos;
		}

	   

}
