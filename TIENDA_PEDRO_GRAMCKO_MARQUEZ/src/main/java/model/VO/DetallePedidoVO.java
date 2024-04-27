package model.VO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class DetallePedidoVO {

	private int id;
	private int id_pedido;
	private int id_producto;
	private double precio_unidad;
	private int unidades;
	private float impuesto;
	private double total;
	
}
