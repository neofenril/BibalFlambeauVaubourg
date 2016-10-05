package Objets_Metiers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yohann
 */
public class ConnectionBase {
    Connection connection;
    Statement statement;
    
    public ConnectionBase(){
        try {
            connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mysql?user=root&password=root");
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Statement getStatement(){
        statement = null;
        try {
            statement = connection.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(Usager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return statement;
    }
}