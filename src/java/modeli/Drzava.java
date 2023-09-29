/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

/**
 *
 * @author Vukisha
 */
public class Drzava {

    public Drzava(int id_drzave, String nazivDrzave) {
        this.id_drzave = id_drzave;
        this.nazivDrzave = nazivDrzave;
    }

    public int getId_drzave() {
        return id_drzave;
    }

    public void setId_drzave(int id_drzave) {
        this.id_drzave = id_drzave;
    }

    public String getNazivDrzave() {
        return nazivDrzave;
    }

    public void setNazivDrzave(String nazivDrzave) {
        this.nazivDrzave = nazivDrzave;
    }

    @Override
    public String toString() {
        return "Drzava{" + "id_drzave=" + id_drzave + ", nazivDrzave=" + nazivDrzave + '}';
    }
    int id_drzave;
    String nazivDrzave;
}
