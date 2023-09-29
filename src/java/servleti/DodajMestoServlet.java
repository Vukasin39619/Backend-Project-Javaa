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
public class DodajMestoServlet extends HttpServlet {

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
            out.println("<title>Servlet DodajMestoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DodajMestoServlet at " + request.getContextPath() + "</h1>");
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
        
           
        String adresa = request.getParameter("Adresa");
        int id_destinacije = Integer.parseInt(request.getParameter("destinacija"));
        String nazivmesta = request.getParameter("NazivMesta");
        int Cena = Integer.parseInt(request.getParameter("Cena"));
        String Datum = request.getParameter("Datum");

        // Provjeri ispravnost podataka (npr. validacija email adrese)

        // Izvrši unos u bazu podataka
        MestaCM mestacm = new MestaCM();
        boolean uspjesnoDodan = mestacm.dodajmesto(adresa, nazivmesta, id_destinacije,Cena,Datum);

        if (uspjesnoDodan) {
            // Ako je korisnik uspješno dodan, preusmjeri na odgovarajuću stranicu
            response.sendRedirect("Mesto.jsp");
        } else {
            // Ako nije uspješno dodan, prikaži poruku o grešci ili preusmjeri na stranicu za grešku
            response.sendRedirect("greska.jsp");
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
