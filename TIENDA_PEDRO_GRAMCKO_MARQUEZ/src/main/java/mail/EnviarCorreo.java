package mail;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.VO.PedidoVO;
import model.VO.UsuarioVO;

public class EnviarCorreo {

	public static void enviarCorreoContacto() {
        String destinatario = "pedrodavid0601@gmail.com";

        try {
            // Propiedades de la conexión
            Properties prop = new Properties();
            // Nombre del servidor de salida
            prop.setProperty("mail.smtp.host", "smtp.office365.com");
            // Habilitamos TLS
            prop.setProperty("mail.smtp.starttls.enable", "true");
            // Indicamos el puerto
            prop.setProperty("mail.smtp.port", "587");
            // Indicamos el usuario
            prop.setProperty("mail.smtp.user", "happypets_tienda@outlook.com");
            // Indicamos que requiere autenticación
            // prop.setProperty("mail.smtp.auth", "true");
            prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

            // Creamos un objeto sesion
            Session sesion = Session.getDefaultInstance(prop);

            // TODO
            sesion.setDebug(true);

            // Creamos un objeto mensaje a través de la sesión
            MimeMessage mensaje = new MimeMessage(sesion);

            // Indicamos la cuenta desde la que se va a enviar
            mensaje.setFrom(new InternetAddress("happypets_tienda@outlook.com"));

            // Añadimos el recipiente al mensaje al que va a ir dirigido el mensaje
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));

            // TODO
            // Creamos el asunto del mensaje
            mensaje.setSubject("Nueva solicitud de contacto");

            // TODO
            // Creamos el cuerpo del mensaje
            mensaje.setText("Solicitud de contacto recibida. Datos del cliente:\n\n\n");

            // Utilizamos un objeto transport para hacer el envío indicando el protocolo
            Transport t = sesion.getTransport("smtp");
            // Hacemos la conexión
            t.connect("happypets_tienda@outlook.com", "27307537p");
            // Enviamos el mensaje
            t.sendMessage(mensaje, mensaje.getAllRecipients());

            // Cerramos la conexión
            t.close();

        } catch (MessagingException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
	}
	
	public static void enviarPedidoConfirmado(PedidoVO pedido, UsuarioVO usuario) {
//        String destinatario = usuario.getEmail();
		String destinatario = "pedrodavid0601@gmail.com";

        try {
            // Propiedades de la conexión
            Properties prop = new Properties();
            // Nombre del servidor de salida
            prop.setProperty("mail.smtp.host", "smtp.office365.com");
            // Habilitamos TLS
            prop.setProperty("mail.smtp.starttls.enable", "true");
            // Indicamos el puerto
            prop.setProperty("mail.smtp.port", "587");
            // Indicamos el usuario
            prop.setProperty("mail.smtp.user", "happypets_tienda@outlook.com");
            // Indicamos que requiere autenticación
            // prop.setProperty("mail.smtp.auth", "true");
            prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

            // Creamos un objeto sesion
            Session sesion = Session.getDefaultInstance(prop);

            // TODO
            sesion.setDebug(true);

            // Creamos un objeto mensaje a través de la sesión
            MimeMessage mensaje = new MimeMessage(sesion);

            // Indicamos la cuenta desde la que se va a enviar
            mensaje.setFrom(new InternetAddress("happypets_tienda@outlook.com"));

            // Añadimos el recipiente al mensaje al que va a ir dirigido el mensaje
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));

            // TODO
            // Creamos el asunto del mensaje
            mensaje.setSubject("Pedido " +pedido.getId()+" enviado");

            // TODO
            // Creamos el cuerpo del mensaje
            mensaje.setText("¡Hola " + usuario.getNombre() + "!\n\nTu pedido "+pedido.getId()+" ha sido enviado.\n\nHappyPets,\nTu tienda para mascotas");

            // Utilizamos un objeto transport para hacer el envío indicando el protocolo
            Transport t = sesion.getTransport("smtp");
            // Hacemos la conexión
            t.connect("happypets_tienda@outlook.com", "27307537p");
            // Enviamos el mensaje
            t.sendMessage(mensaje, mensaje.getAllRecipients());

            // Cerramos la conexión
            t.close();

        } catch (MessagingException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
	}

    
}
