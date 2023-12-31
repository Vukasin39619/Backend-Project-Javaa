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
import metode.KorisnikCM;

/**
 *
 * @author Vukisha
 */
public class RegistracijaServlet extends HttpServlet {

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
            out.println("<title>Servlet RegistracijaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistracijaServlet at " + request.getContextPath() + "</h1>");
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
        
         
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String kontakt = request.getParameter("kontakt");
        String datumRodjenja = request.getParameter("datumRodjenja");
        String email = request.getParameter("email");
        String sifra = request.getParameter("sifra");
        String userName = request.getParameter("userName");
        String uloga = request.getParameter("uloga");

        // Provjeri ispravnost podataka (npr. validacija email adrese)

        // Izvrši unos u bazu podataka
        KorisnikCM korisnikCM = new KorisnikCM();
        boolean uspjesnoDodan = korisnikCM.dodajKorisnika(ime, prezime, kontakt, datumRodjenja, email, sifra, userName, uloga);

        if (uspjesnoDodan) {
            // Ako je korisnik uspješno dodan, preusmjeri na odgovarajuću stranicu
            response.sendRedirect("login.jsp");
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
