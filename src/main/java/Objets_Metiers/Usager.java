package Objets_Metiers;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Usager {
        
	private String nom;
	private String prenom;
	private String mail;

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
        ConnectionBase connBase = new ConnectionBase();
        Statement stm = connBase.getStatement();
        
        Usager u = null;
        if(stm != null){
            try {
                ResultSet resultat = stm.executeQuery( "SELECT id_usager, nom, prenom, mail FROM Usager WHERE nom=\""+nom+"\" AND prenom=\""+prenom+"\"" );
                resultat.next();
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
        
        public String toString(){
        return "nom: "+nom+" |prenom: "+prenom+" |mail: "+mail;
    }

}
