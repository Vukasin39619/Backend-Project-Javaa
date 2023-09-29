/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

/**
 *
 * @author Vukisha
 */
public class Destinacija {

    public Destinacija(int id_destinacije, String nazivDestinacije, int id_drzave) {
        this.id_destinacije = id_destinacije;
        this.nazivDestinacije = nazivDestinacije;
        this.id_drzave = id_drzave;
    }

    public int getId_destinacije() {
        return id_destinacije;
    }

    public void setId_destinacije(int id_destinacije) {
        this.id_destinacije = id_destinacije;
    }

    public String getNazivDestinacije() {
        return nazivDestinacije;
    }

    public void setNazivDestinacije(String nazivDestinacije) {
        this.nazivDestinacije = nazivDestinacije;
    }

    public int getId_drzave() {
        return id_drzave;
    }

    public void setId_drzave(int id_drzave) {
        this.id_drzave = id_drzave;
    }

    @Override
    public String toString() {
        return "Destinacija{" + "id_destinacije=" + id_destinacije + ", nazivDestinacije=" + nazivDestinacije + ", id_drzave=" + id_drzave + '}';
    }
    int id_destinacije;
    String nazivDestinacije;
    int id_drzave;
}
