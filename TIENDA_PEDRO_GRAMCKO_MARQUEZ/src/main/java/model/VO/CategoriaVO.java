package model.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class CategoriaVO {

	private int id;
	private String nombre;
	private String descripcion;
	private boolean activo;
	
}
