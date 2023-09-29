/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import metode.MestaCM;


/**
 *
 * @author Vukisha
 */
public class EditMestoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditMestoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditMestoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         int userId = Integer.parseInt(request.getParameter("id"));
        String novaAdresa = request.getParameter("adresa");
        String noviNaziv = request.getParameter("naziv");
        String datum = request.getParameter("datum");
        int cena = Integer.parseInt(request.getParameter("cena"));
        int novaDestinacija = Integer.parseInt(request.getParameter("destinacija"));
       

        MestaCM mestaCM = new MestaCM();
        boolean updated = mestaCM.updateUser(userId, novaAdresa, noviNaziv, novaDestinacija,cena,datum);

        if (updated) {
            // Uspješno ažuriranje, možete redirektirati na stranicu "Korisnici.jsp" ili gdje god želite
            response.sendRedirect("Mesto.jsp");
        } else {
            // Došlo je do greške pri ažuriranju, možete redirektirati na stranicu sa porukom o grešci
            response.sendRedirect("error.jsp");
        }
        
        
        processRequest(request, response);
    }

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
