/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

/**
 *
 * @author Vukisha
 */
public class Mesto {

    public Mesto(int id_mesta, String adresa, String nazivMesta, int cena, String datum, int id_destinacije) {
        this.id_mesta = id_mesta;
        this.adresa = adresa;
        this.nazivMesta = nazivMesta;
        this.id_destinacije = id_destinacije;
    }

    public int getId_mesta() {
        return id_mesta;
    }

    public void setId_mesta(int id_mesta) {
        this.id_mesta = id_mesta;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getNazivMesta() {
        return nazivMesta;
    }

    public void setNazivMesta(String nazivMesta) {
        this.nazivMesta = nazivMesta;
    }

    public int getId_destinacije() {
        return id_destinacije;
    }

    public void setId_destinacije(int id_destinacije) {
        this.id_destinacije = id_destinacije;
    }
    

    public int getCena() {
        return cena;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public String getDatum() {
        return datum;
    }

    public void setDatum(String datum) {
        this.datum = datum;
    }
    int id_mesta;
    String adresa;
    String nazivMesta;
    int id_destinacije;
    int cena;
    String datum;
    
}
