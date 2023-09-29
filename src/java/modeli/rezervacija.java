/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeli;

/**
 *
 * @author Vukisha
 */
public class rezervacija {

    public int getId_rezervacije() {
        return id_rezervacije;
    }

    public void setId_rezervacije(int id_rezervacije) {
        this.id_rezervacije = id_rezervacije;
    }

    public int getId_klijenta() {
        return id_klijenta;
    }

    public void setId_klijenta(int id_klijenta) {
        this.id_klijenta = id_klijenta;
    }

    public int getId_mesta() {
        return id_mesta;
    }

    public void setId_mesta(int id_mesta) {
        this.id_mesta = id_mesta;
    }

    public int getId_destinacije() {
        return id_destinacije;
    }

    public void setId_destinacije(int id_destinacije) {
        this.id_destinacije = id_destinacije;
    }

    public rezervacija(int id_rezervacije, int id_klijenta, int id_mesta, int id_destinacije) {
        this.id_rezervacije = id_rezervacije;
        this.id_klijenta = id_klijenta;
        this.id_mesta = id_mesta;
        this.id_destinacije = id_destinacije;
    }
    int id_rezervacije;
    int id_klijenta;
    int id_mesta;
    int id_destinacije;
}
