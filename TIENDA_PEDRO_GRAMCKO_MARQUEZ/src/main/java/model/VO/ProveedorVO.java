package model.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class ProveedorVO {

	private int id;
	private String nombre;
	private String direccion;
	private String localidad;
	private String provincia;
	private String telefono;
	private String cif;
	private String email;
	private boolean activo;
}
