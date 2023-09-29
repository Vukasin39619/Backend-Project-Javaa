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
import modeli.Destinacija;

/**
 *
 * @author Vukisha
 */
public class DestinacijaCM {

    public DestinacijaCM() {

    }

    public DestinacijaCM(Connection con) {
        this.con = con;
    }
    Connection con;

    public ArrayList<Destinacija> GetAll() {

        ArrayList<Destinacija> destinacije = new ArrayList<Destinacija>();
        Destinacija destinacija = null;
        try {
            con = Konekcija.createConnection();
            PreparedStatement stmt = con.prepareCall("SELECT * FROM destinacija");
            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                int id = rez.getInt("id_destinacije");
                String NazivDrzave = rez.getString("NazivDestinacije");
                int iddrzave = rez.getInt("id_drzave");
                destinacija = new Destinacija(id, NazivDrzave, iddrzave);
                destinacije.add(destinacija);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return destinacije;
    }

    public String NazivDestinacijeByID(int id)
    {
          Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String selectQuery = "SELECT NazivDestinacije FROM destinacija WHERE id_destinacije = ?";
            stmt = conn.prepareStatement(selectQuery);
            stmt.setInt(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                
                String x = rs.getString("NazivDestinacije");
                

                // Stvaranje i vraćanje objekta Korisnik
                return x;
            }

            // Ako korisnik s traženim ID-om ne postoji, vraćamo null
            return "Nema Mesta";
        } catch (SQLException e) {
            e.printStackTrace();
            // Pogreška pri dohvaćanju korisnika
            return null;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
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
    
   public boolean deleteUserById(int userId) {
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
        String deleteQuery = "DELETE FROM destinacija WHERE `destinacija`.`id_destinacije` = ?";
        stmt = conn.prepareStatement(deleteQuery);
        stmt.setInt(1, userId);

        int rowsAffected = stmt.executeUpdate();

        // Ako je uspješno izbrisan barem jedan redak, vraćamo true
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        // Pogreška pri brisanju
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

    public boolean dodajdestinaciju(String ime, int id_drzave) {
Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String insertQuery = "INSERT INTO destinacija (NazivDestinacije,id_drzave) VALUES (?,?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, ime);
            stmt.setInt(2, id_drzave);

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
        }    }
}
