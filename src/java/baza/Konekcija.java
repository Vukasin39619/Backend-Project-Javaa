/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package baza;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Vukisha
 */
public class Konekcija {
     public static Connection createConnection()
    {
        Connection cnn = null;

        String baza = "jdbc:mysql://localhost:3306/agencija";
        String user = "root";
        String pass = "";

        try
        {
            try
            {
                Class.forName ("com.mysql.cj.jdbc.Driver");
            }
            catch (ClassNotFoundException ex)
            {
                ex.printStackTrace ();
            }

            cnn = DriverManager.getConnection (baza, user, pass);
        }
        catch (Exception e)
        {
            e.printStackTrace ();
        }

        return cnn;
    }
}
