package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SendMail", urlPatterns = {"/SendMail"})
public class SendMail extends HttpServlet {
    private static final String EMAIL_FROM = "projecmailzk18@gmail.com";
    private static final String PASSWORD_FROM = "ycox evwy hwug vuyl";
    private static int ticketCounter = 1; // Contador para los tickets

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos del formulario
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String userMessage = request.getParameter("message");

        // Crear el asunto dinámico
        String subject = "Solicitud recibida Nro. #" + ticketCounter++;
        
        // Crear el contenido del correo
        StringBuilder content = new StringBuilder();
        content.append("<h2>Registro de solicitud exitosa</h2>")
               .append("<p>Estimado cliente,</p>")
               .append("<p>Su solicitud ha sido registrada, nuestro personal de soporte la estará revisando a la brevedad.</p>")
               .append("<h3>Informacion del Cliente:</h3>")
               .append("<p><strong>Nombre:</strong> ").append(name).append("</p>")
               .append("<p><strong>Correo Electrónico:</strong> ").append(email).append("</p>")
               .append("<p><strong>Teléfono:</strong> ").append(phone).append("</p>")
               .append("<h3>Descripción del caso:</h3>")
               .append("<p><strong>Mensaje:</strong><br>").append(userMessage).append("</p>");

        // Configurar propiedades de JavaMail
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.user", EMAIL_FROM);
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties);

        try {
            // Crear el correo
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_FROM, "Nextel Soporte")); // Remitente personalizado
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // Destinatario
            message.setSubject(subject);
            message.setContent(content.toString(), "text/html; charset=UTF-8");

            // Enviar el correo
            Transport transport = session.getTransport("smtp");
            transport.connect(EMAIL_FROM, PASSWORD_FROM);
            transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
            transport.close();

            // Guardar los datos en atributos del request
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("message", userMessage);
            
            
            // Enviar al JSP
            request.getRequestDispatcher("/load/contacto.jsp").forward(request, response);
            
        } catch (MessagingException e) {
            response.getWriter().println("Error al enviar el correo: " + e.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("GET request not supported for this Servlet.");
    }


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
