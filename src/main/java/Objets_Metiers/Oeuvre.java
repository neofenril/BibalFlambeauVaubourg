package Objets_Metiers;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public abstract class Oeuvre {

    
        private int id;
	private String titre;
	private String auteur;

        public Oeuvre(){}

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getTitre() {
            return titre;
        }

        public void setTitre(String titre) {
            this.titre = titre;
        }

        public String getAuteur() {
            return auteur;
        }

        public void setAuteur(String auteur) {
            this.auteur = auteur;
        }
        
    public static Oeuvre e_identification(String titre, String type) {
        Oeuvre o = null;
        if(type.equals("magazine")){
            o = Magazine.e_identification(titre);
        }else{
            o = Livre.e_identification(titre);
        }
        return o;
    }
    
    public static void e_supprimer(Oeuvre o, String typeOeuvre) {

        if(typeOeuvre.equals("magazine")){
            Magazine.e_supprimer(o);
        }else{
            Livre.e_supprimer(o);
        }

    }
}