/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package metode;

import baza.Konekcija;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modeli.rezervacija;

/**
 *
 * @author Vukisha
 */
public class RezervacijaCM {
    
    public RezervacijaCM() {

    }

    public RezervacijaCM(Connection con) {
        this.con = con;
    }
    Connection con;
    
    public ArrayList<rezervacija> GetAll(int idkllijenta) {

        ArrayList<rezervacija> sverez = new ArrayList<rezervacija>();
        rezervacija rezerv = null;
        try {
            con = Konekcija.createConnection();
            PreparedStatement stmt = con.prepareCall("SELECT * FROM rezervacija where id_klijenta="+String.valueOf(idkllijenta));
            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                
                int idrezer = rez.getInt("id_rezervacije");
                int id_klijenta = rez.getInt("id_klijenta");
                int idmes = rez.getInt("id_mesta");
                int id = rez.getInt("id_destinacije");
                
                rezerv = new rezervacija(idrezer,id, idmes, id);
                sverez.add(rezerv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sverez;
    }
    
    
     public boolean dodajrezervaciju( int idklij,int idmest, int id_destinacije) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String insertQuery = "INSERT INTO rezervacija(id_klijenta,id_mesta, id_destinacije) VALUES (?,?,?)";
            stmt = conn.prepareStatement(insertQuery);
            ;
            stmt.setInt(1, idklij);
            stmt.setInt(2, idmest);
            stmt.setInt(3, id_destinacije);
            

            int rowsAffected = stmt.executeUpdate();

            // Ako je uspješno dodan barem jedan redak, vraćamo true
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Pogreška pri unosu
            return false;
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
}
