package model.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class PedidoVO {

	private Integer id;
	private Integer id_usuario;
	private Date fecha;
	private String metodo_pago;
	private String estado;
	private String num_factura;
	private double total;
	
	
}
