package control.cuenta;

import java.io.IOException;
import java.util.Locale;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.logging.Level;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class Contacto
 */
@WebServlet("/Contacto")
public class Contacto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contacto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String lang = request.getParameter("lang");
	    

	    Locale locale;
	    ResourceBundle idiomas;
	    if (lang != null && !lang.isEmpty()) {
	        locale = new Locale(lang);
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    } else {
	        // Establecer un idioma predeterminado si no se ha seleccionado ninguno
	        locale = new Locale("es"); // Español como idioma predeterminado
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    }

	    request.setAttribute("languaje", lang);
	    request.setAttribute("idiomas", idiomas);
		
		request.getRequestDispatcher("/vistas/contacto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String destinatario = "pedrodavid0601@gmail.com";
		
		try {
			// Propiedades de la conexion
			Properties prop = new Properties();
			// Nombre del servidor de salida
			prop.setProperty("mail.smtp.host", "smtp.office365.com");
			// Habilitamos TLS
			prop.setProperty("mail.smtp.starttls.enable", "true");
			// Indicamos el puerto
			prop.setProperty("mail.smtp.port", "587");
			// Indicamos el usuario
			prop.setProperty("mail.smtp.user", "pedrod.gramar@educa.jcyl.es");
			// Indicamos que requiere autenticación
//			prop.setProperty("mail.smtp.auth", "true");
			prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

			// Creamos un objeto sesion
			Session sesion = Session.getDefaultInstance(prop);
			
			//TODO
			sesion.setDebug(true);
			
			// Creamos un objeto mensaje a traves de la sesion
			MimeMessage mensaje = new MimeMessage(sesion);
			
			// Indicamos la cuenta desde la que se va a enviar
			mensaje.setFrom(new InternetAddress("pedrod.gramar@educa.jcyl.es"));

			// Añadimos el recipiente al mensaje al que va a ir dirigido el mensaje
			mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));

			//TODO
			// Creamos el asunto del mensaje
			mensaje.setSubject("Ejemplo con JavaMail");

			//TODO
			// Creamos el cuerpo del mensaje
			mensaje.setText("Esto es una prueba con JavaMail");

//			mensaje.setText(
//					"Esto es una prueba <br> con <b>JavaMail</b>",
//					"ISO-8859-1",
//					"html");
			
			// Utilizamos un objeto transport para hacer el envio indicando el protocolo
			Transport t = sesion.getTransport("smtp");
			// Hacemos la conexion
			t.connect("pedrod.gramar@educa.jcyl.es", "123456789Pe");
			// Enviamos el mensaje
			t.sendMessage(mensaje, mensaje.getAllRecipients());

			// Cerramos la conexion
			t.close();

		}catch (Exception e) {
			System.out.println("ERROR");
		}
		
	}

}
