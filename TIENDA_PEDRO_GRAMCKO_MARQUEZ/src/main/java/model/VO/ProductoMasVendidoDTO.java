package model.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class ProductoMasVendidoDTO {

	private int id;
	private String nombre;
	private int cantidadVendida;
}
