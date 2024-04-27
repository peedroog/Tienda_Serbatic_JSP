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
import model.VO.DetallePedidoVO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class DetallePedidoDAO {

	public static int registrarDetallePedido(PedidoVO pedido, UsuarioVO usuario, Map<ProductoVO, Integer> carrito, DetallePedidoVO detalle) {
		
	    Connection connection = null;
	    PreparedStatement statement = null;


        
        try {
        	
        	String sql = "INSERT INTO detalles_pedido (id_pedido, id_producto, precio_unidad, unidades,"
        			+ "impuesto, total) VALUES (?, ?, ?, ?, ?, ?)";
        	connection = Conexion.getConexion();
            // Preparar la sentencia SQL
            PreparedStatement pstmt = connection.prepareStatement(sql);
            
            // Establecer los valores de los parámetros
            pstmt.setInt(1, detalle.getId_pedido());
            pstmt.setInt(2, detalle.getId_producto());
            pstmt.setFloat(3, (float) detalle.getPrecio_unidad());
            pstmt.setInt(4, detalle.getUnidades());
            pstmt.setFloat(5, detalle.getImpuesto());
            pstmt.setDouble(6, detalle.getTotal());
            
            pstmt.executeUpdate();            

        } catch (SQLException e) {
            // Manejar cualquier excepción de SQL
            e.printStackTrace();
        }
		return 0;
		
	}
	
	public static List<DetallePedidoVO> obtenerLineasPorPedido(PedidoVO pedido) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		List<DetallePedidoVO> listaLineasPedido = new ArrayList<>();

		try {
			connection = Conexion.getConexion();
			String sql = "SELECT * FROM detalles_pedido WHERE id_pedido = ?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, pedido.getId());
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				DetallePedidoVO detalle = new DetallePedidoVO();
				detalle.setId_pedido(resultSet.getInt("id_pedido"));
				detalle.setId_producto(resultSet.getInt("id_producto"));
                detalle.setPrecio_unidad(resultSet.getFloat("precio_unidad"));
                detalle.setUnidades(resultSet.getInt("unidades"));
                detalle.setImpuesto(resultSet.getFloat("impuesto"));
				detalle.setTotal(resultSet.getDouble("total"));
				listaLineasPedido.add(detalle);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaLineasPedido;
	}
	
	
}
