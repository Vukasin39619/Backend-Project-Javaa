package metode;

import baza.Konekcija;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modeli.Drzava;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Vukisha
 */
public class DrzavaCM {

    public DrzavaCM() {

    }

    public DrzavaCM(Connection con) {
        this.con = con;
    }
    Connection con;

    public ArrayList<Drzava> GetAll() {

        ArrayList<Drzava> drzave = new ArrayList<Drzava>();
        Drzava drzava = null;
        try {
            con = Konekcija.createConnection();
            PreparedStatement stmt = con.prepareCall("SELECT * FROM drzava");
            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                int id = rez.getInt("id_drzave");
                String NazivDrzave = rez.getString("NazivDrzave");

                drzava = new Drzava(id, NazivDrzave);
                drzave.add(drzava);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drzave;
    }

    public boolean dodajdrzavu(String ime) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String insertQuery = "INSERT INTO drzava (NazivDrzave) VALUES (?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, ime);

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
        String deleteQuery = "DELETE FROM drzava WHERE id_drzave = ?";
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

}}
