package model.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class ProductoVO {

	private Integer id;
	private Integer id_categoria;
	private String nombre;
	private String descripcion;
	private Double precio;
	private Integer stock;
	private Date fecha_alta;
	private Date fecha_baja;
	private Float impuesto;
	private String imagen;
	private boolean activo;
	
	
}
