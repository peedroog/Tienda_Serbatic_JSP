package model.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class UsuarioVO {

	Integer id;
	Integer id_rol = 1;
	String email;
	String clave;
	String nombre;
	String apellido1;
	String apellido2;
	String direccion;
	String provincia;
	String localidad;
	String telefono;
	String dni;
	boolean activo;
	boolean passCambiada;
}
