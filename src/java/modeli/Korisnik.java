/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

/**
 *
 * @author Vukisha
 */
public class Korisnik {

    public Korisnik(int id_Klijenta, String ime, String prezime, String kontakt, String DatumRodjenja, String email, String sifra, String UserName, String uloga) {
        this.id_Klijenta = id_Klijenta;
        this.ime = ime;
        this.prezime = prezime;
        this.kontakt = kontakt;
        this.DatumRodjenja = DatumRodjenja;
        this.email = email;
        this.sifra = sifra;
        this.UserName = UserName;
        this.uloga = uloga;
    }

    public int getId_Klijenta() {
        return id_Klijenta;
    }

    public void setId_Klijenta(int id_Klijenta) {
        this.id_Klijenta = id_Klijenta;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getKontakt() {
        return kontakt;
    }

    public void setKontakt(String kontakt) {
        this.kontakt = kontakt;
    }

    public String getDatumRodjenja() {
        return DatumRodjenja;
    }

    public void setDatumRodjenja(String DatumRodjenja) {
        this.DatumRodjenja = DatumRodjenja;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSifra() {
        return sifra;
    }

    public void setSifra(String sifra) {
        this.sifra = sifra;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getUloga() {
        return uloga;
    }

    public void setUloga(String uloga) {
        this.uloga = uloga;
    }

    @Override
    public String toString() {
        return "Korisnik{" + "id_Klijenta=" + id_Klijenta + ", ime=" + ime + ", prezime=" + prezime + ", kontakt=" + kontakt + ", DatumRodjenja=" + DatumRodjenja + ", email=" + email + ", sifra=" + sifra + ", UserName=" + UserName + ", uloga=" + uloga + '}';
    }

    
   int id_Klijenta ;
    String ime;
    String prezime;
    String kontakt;
    String DatumRodjenja;
    String email;
    String sifra;
    String UserName;
    String uloga;
}
