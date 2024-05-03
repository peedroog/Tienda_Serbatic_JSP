//package hilos;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionEvent;
//
//import java.util.concurrent.ConcurrentHashMap;
//import java.util.Map;
//
//@WebListener
//public class ManagerSesiones implements ServletContextListener {
//
//    static final Map<String, HttpSession> activeSessions = new ConcurrentHashMap<>();
//
//    @Override
//    public void contextInitialized(ServletContextEvent sce) {
//        // No es necesario iniciar el hilo MonitorStock aquí
//    }
//
//    @Override
//    public void contextDestroyed(ServletContextEvent sce) {
//        // Lógica para limpiar recursos, si es necesario
//    }
//
//    public static void sessionCreated(HttpSession session) {
//        activeSessions.put(session.getId(), session);
//    }
//
//    public static void sessionDestroyed(HttpSession session) {
//        activeSessions.remove(session.getId());
//    }
//
//    public static HttpSession getSession(String sessionId) {
//        return activeSessions.get(sessionId);
//    }
//}
