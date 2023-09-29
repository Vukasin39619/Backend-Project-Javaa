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
import modeli.Korisnik;

/**
 *
 * @author Vukisha
 */
public class KorisnikCM {

    public KorisnikCM() {

    }

    public KorisnikCM(Connection con) {
        this.con = con;
    }
    Connection con;

    public ArrayList<Korisnik> GetAll() {

        ArrayList<Korisnik> korisnici = new ArrayList<Korisnik>();
        Korisnik korisnik = null;
        try {
            con = Konekcija.createConnection();
            PreparedStatement stmt = con.prepareCall("SELECT * FROM klijent");
            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                int id = rez.getInt("ID_Klijenta");
                String ime = rez.getString("Ime");
                String prezime = rez.getString("Prezime");
                String kontakt = rez.getString("Kontakt");
                String datumrodjenja = rez.getString("DatumRodjenja");
                String email = rez.getString("Email");
                String sifra = rez.getString("Sifra");
                String username = rez.getString("UserName");
                String uloga = rez.getString("Uloga");

                korisnik = new Korisnik(id, ime, prezime, kontakt, datumrodjenja, email, sifra, username, uloga);
                korisnici.add(korisnik);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return korisnici;
    }

    public Korisnik getAdmin() {
        Korisnik admin = null;
        try {
            con = Konekcija.createConnection();

            PreparedStatement stmt = con.prepareCall("SELECT * FROM klijent WHERE UserName = \"admin\"");

            ResultSet rez = stmt.executeQuery();

            while (rez.next()) {
                int id = rez.getInt("ID_Klijenta");
                String ime = rez.getString("Ime");
                String prezime = rez.getString("Prezime");
                String kontakt = rez.getString("Kontakt");
                String datumrodjenja = rez.getString("DatumRodjenja");
                String email = rez.getString("Email");
                String sifra = rez.getString("Sifra");
                String username = rez.getString("UserName");
                String uloga = rez.getString("Uloga");

                admin = new Korisnik(id, ime, prezime, kontakt, datumrodjenja, email, sifra, username, uloga);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public boolean deleteUserById(int userId) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String deleteQuery = "DELETE FROM klijent WHERE ID_Klijenta = ?";
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

    public boolean updateUser(int userId, String novoIme, String novoPrezime, String noviKontakt,
            String noviDatumRodjenja, String noviEmail, String novaSifra, String noviUserName, String novaUloga) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String updateQuery = "UPDATE klijent SET Ime = ?, Prezime = ?, Kontakt = ?, DatumRodjenja = ?, Email = ?, Sifra = ?, UserName = ?, Uloga = ? WHERE ID_Klijenta = ?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, novoIme);
            stmt.setString(2, novoPrezime);
            stmt.setString(3, noviKontakt);
            stmt.setString(4, noviDatumRodjenja);
            stmt.setString(5, noviEmail);
            stmt.setString(6, novaSifra);
            stmt.setString(7, noviUserName);
            stmt.setString(8, novaUloga);
            stmt.setInt(9, userId);

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

    public boolean dodajKorisnika(String ime, String prezime, String kontakt, String datumRodjenja, String email, String sifra, String userName, String uloga) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String insertQuery = "INSERT INTO klijent (Ime, Prezime, Kontakt, DatumRodjenja, Email, Sifra, UserName, Uloga) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, ime);
            stmt.setString(2, prezime);
            stmt.setString(3, kontakt);
            stmt.setString(4, datumRodjenja);
            stmt.setString(5, email);
            stmt.setString(6, sifra);
            stmt.setString(7, userName);
            stmt.setString(8, uloga);

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

    public boolean updateUser(String novaSifra, int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Konekcija.createConnection(); // Pravite vezu s bazom podataka
            String updateQuery = "UPDATE klijent SET Sifra = ? WHERE ID_Klijenta = ?";
            stmt = conn.prepareStatement(updateQuery);

            stmt.setString(1, novaSifra);

            stmt.setInt(2, id);

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

}
