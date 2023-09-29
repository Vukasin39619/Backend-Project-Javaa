/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import metode.KorisnikCM;
import modeli.Korisnik;

/**
 *
 * @author Vukisha
 */
public class Logovanje extends HttpServlet {

    KorisnikCM KorCM;

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

        String UserName = request.getParameter("username");
        String Password = request.getParameter("password");

        HttpSession sesija = request.getSession();
        KorCM = new KorisnikCM();
        
        boolean auth = false;

       if (UserName.equals(KorCM.getAdmin().getUserName()) && Password.equals(KorCM.getAdmin().getSifra())) {
    auth = true;
    sesija.setAttribute("Admin", KorCM.getAdmin().getIme());
    sesija.setAttribute("auth", auth);
    
    response.sendRedirect("AdminPanel.jsp");
} else {
    for (Korisnik element : KorCM.GetAll()) {
        if (UserName.equals(element.getUserName()) && Password.equals(element.getSifra())) {
            auth = true;
            String ime = element.getIme();
            sesija.setAttribute("auth", auth);
            Korisnik k = new Korisnik(element.getId_Klijenta(), element.getIme(), 
                    element.getPrezime(), element.getKontakt(),
                    element.getDatumRodjenja(), element.getEmail(), 
                    element.getSifra(), element.getUserName(), element.getUloga());
            sesija.setAttribute("Korisnik", k);
            sesija.setAttribute("Korisnik2", k);
            
            response.sendRedirect("index.jsp");
            return; // Ovdje koristite return kako biste prekinuli izvršavanje ostatka metode
        }
    }

    // Ako nijedan uvjet nije ispunjen, izvršite preusmjeravanje na login.jsp
    String poruka = "Niste dobro uneli podatke (registruj se?)";
    sesija.setAttribute("Poruka", poruka);
    response.sendRedirect("login.jsp");
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
