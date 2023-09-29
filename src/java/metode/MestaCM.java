/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package metode;

import baza.Konekcija;
import java.sql.Connection;
import java.util.ArrayList;
import modeli.Mesto;

import baza.Konekcija;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vukisha
 */
public class MestaCM {

    public MestaCM() {

    }

    public MestaCM(Connection con) {
        this.con = con;
    }
    Connection con;

    public ArrayList<Mesto> GetAll() {

        ArrayList<Mesto> mesta = new ArrayList<Mesto>();
        Mesto mesto = null;
        try {
            con = Konekcija.createConnection();
            PreparedStatement stmt = con.prepareCall("SELECT * FROM mesto");
            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                int id = rez.getInt("id_mesta");
                String Adresa = rez.getString("Adresa");
                String NazivMesta = rez.getString("NazivMesta");
                String Datum = rez.getString("Datum");
                int Cena = rez.getInt("Cena");
                int iddest = rez.getInt("id_destinacije");
                
                mesto = new Mesto(id,Adresa,NazivMesta,Cena,Datum,iddest);
                mesta.add(mesto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mesta;
    }

    public boolean dodajmesto(String adresa, String nazivmesta, int id_destinacije, int cena, String datum) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String insertQuery = "INSERT INTO mesto(Adresa,NazivMesta, Cena,Datum,id_destinacije) VALUES (?,?,?,?,?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, adresa);
            stmt.setString(2, nazivmesta);
            stmt.setInt(3, cena);
            stmt.setString(4, datum);
            stmt.setInt(5, id_destinacije);

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

    public boolean deleteUserById(int userId) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String deleteQuery = "DELETE FROM mesto WHERE `mesto`.`id_mesta` = ?";
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

    public boolean updateUser(int userId, String novaAdresa, String noviNaziv, int novaDestinacija, int novacena, String novidatum) {
        Connection conn = null;
    PreparedStatement stmt = null;

    try {
        conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
        String updateQuery = "UPDATE mesto SET Adresa = ?, NazivMesta = ?, id_destinacije = ?,Cena=?,Datum=? WHERE id_mesta = ?";
        stmt = conn.prepareStatement(updateQuery);
        stmt.setString(1, novaAdresa);
        stmt.setString(2, noviNaziv);
        stmt.setInt(3, novaDestinacija);
        stmt.setInt(4, novacena);
        stmt.setString(5, novidatum);
        stmt.setInt(6, userId);
        

        int rowsAffected = stmt.executeUpdate();

        // Ako je uspješno ažuriran barem jedan redak, vraćamo true
        return rowsAffected > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        // Pogreška pri ažuriranju
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
    public ArrayList<Mesto> GetAllBut(int id_destinacije) {
        
        int iddes = id_destinacije;
        ArrayList<Mesto> mesta = new ArrayList<Mesto>();
        Mesto mesto = null;
        try {
            con = Konekcija.createConnection();
            PreparedStatement stmt = con.prepareCall("SELECT id_mesta,Adresa,NazivMesta,id_destinacije,Cena,Datum FROM mesto "
                    + "where id_destinacije="+String.valueOf(iddes));
            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                int id = rez.getInt("id_mesta");
                String Adresa = rez.getString("Adresa");
                String NazivMesta = rez.getString("NazivMesta");
                int iddest = rez.getInt("id_destinacije");
                String Datum = rez.getString("Datum");
                int cena = rez.getInt("Cena");
                mesto = new Mesto(id, Adresa, NazivMesta,cena,Datum, iddest);
                mesta.add(mesto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mesta;
    }
}
