//package hilos;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import model.DAO.ProductoDAO;
//import model.VO.ProductoVO;
//import model.VO.UsuarioVO;
//
//public class MonitorStock implements Runnable {
//
//    private static final long INTERVALO_VERIFICACION = 10000; // 1 minuto
//    private boolean running = true;
//
//    @Override
//    public void run() {
//        while (running) {
//        	System.out.println("MonitorStock");
//
//
//            // Obtener lista de sesiones activas
//            Map<String, HttpSession> activeSessions = ManagerSesiones.activeSessions;
//
//            // Verificar los carritos de los clientes
//            for (HttpSession session : activeSessions.values()) {
//                UsuarioVO cliente = (UsuarioVO) session.getAttribute("usuario");
//                if (cliente != null) {
//                    Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) session.getAttribute("carrito");;
//                    for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
//                        ProductoVO producto = entry.getKey();
//                        int cantidadEnCarrito = entry.getValue();
//                        int stockDisponible = producto.getStock();
//
//                        // Si la cantidad en el carrito supera el stock disponible, enviar mensaje al cliente
//                        if (cantidadEnCarrito > stockDisponible) {
//                            System.out.println("SE VA A ACABAR");
//                        }
//                    }
//                }
//            }
//
//            // Esperar un tiempo antes de la próxima verificación
//            try {
//                Thread.sleep(INTERVALO_VERIFICACION);
//            } catch (InterruptedException e) {
//                running = false;
//            }
//        }
//    }
//}
