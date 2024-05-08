package hilos;

import java.util.List;

import javax.servlet.ServletContext;

import factura.CrearFactura;
import model.VO.PedidoVO;
import model.VO.UsuarioVO;
import service.PedidoService;
import service.UsuarioService;

public class EnviarPedidos implements Runnable {

    public static volatile boolean running = true;
    private ServletContext servletContext;

    public EnviarPedidos(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Override
    public void run() {
        while (running) {
            try {
                List<PedidoVO> pedidos = PedidoService.findAll();
                for (PedidoVO pedido : pedidos) {

                    if (pedido.getEstado().equals("Pendiente de envío")) {

                        UsuarioVO usuario = UsuarioService.findById(pedido.getId_usuario());
                        PedidoService.enviarPedidoAdmin(pedido, usuario);

                        PedidoVO prueba = PedidoService.devuelvePedido(pedido.getId());

                        String ruta = servletContext.getRealPath("");
                        CrearFactura.generarFactura(prueba, usuario, ruta);

                    }
                }
                System.out.println("Funciona");
                Thread.sleep(180000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
