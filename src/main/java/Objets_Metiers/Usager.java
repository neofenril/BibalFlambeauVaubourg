package Objets_Metiers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Usager {
    private String nom;
    private String prenom;
    private String mail;

    
    public Usager(){}
    
    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getMail() {
        return mail;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    public Usager(String n, String p, String m){
        nom = n;
        prenom = p;
        mail = m;
    }
        
         
    /**
     * 
     * @param nom
     */
    public static Usager e_identification(String nom, String prenom){
        Statement stm = ConnectionBase.establishStatement();

        Usager u = null;
        if(stm != null){
            try {
                ResultSet resultat = stm.executeQuery( "SELECT id, nom, prenom, mail FROM Usager WHERE nom=\""+nom+"\" AND prenom=\""+prenom+"\"" );
                resultat.first();
                u = new Usager(resultat.getString( "nom" ), resultat.getString( "prenom" ), resultat.getString( "mail" ));
            } catch (SQLException ex) {
                Logger.getLogger(Usager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return u;
    }

    /**
     * 
     * @param name
     */
    public static Usager e_ajouter(String nom, String prenom, String mail) {
    	Connection conn = ConnectionBase.establishConnection();
        
        if(conn != null){
            try {
                PreparedStatement preparedStmt = conn.prepareStatement("INSERT INTO Usager(nom, prenom, mail) VALUES (?,?,?)");
                preparedStmt.setString (1, nom);
                preparedStmt.setString (2, prenom);
                preparedStmt.setString (3, mail);
                preparedStmt.execute();
            } catch (SQLException ex) {
                Logger.getLogger(Usager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return new Usager(nom, prenom, mail);
    }
    
    /**
     * 
     * @param name
     */
    public void e_modifier(String name) {
    	// TODO - implement Usager.e_modifier
        throw new UnsupportedOperationException();
    }

    /**
     * 
     * @param name
    */
    public void e_supprimer(String name) {
	// TODO - implement Usager.e_supprimer
        throw new UnsupportedOperationException();
    }
        
    @Override
    public String toString(){
        return "nom: "+nom+" |prenom: "+prenom+" |mail: "+mail;
    }
}
