package Objets_Metiers;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public abstract class Oeuvre {
        private int id;
	private String titre;
	private String auteur;
	private int type;
	private int nbResa;

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

        public int getType() {
            return type;
        }

        public void setType(int type) {
            this.type = type;
        }

        public int getNbResa() {
            return nbResa;
        }

        public void setNbResa(int nbResa) {
            this.nbResa = nbResa;
        }
        
    public static Oeuvre e_identification(String titre) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        String hqlM = "SELECT m FROM Magazine m WHERE m.titre=:titre";
        Query queryM = session.createQuery(hqlM);
        queryM.setParameter("titre", titre);
        List results = queryM.list();
        
        String hqlL = "SELECT l FROM Livre l WHERE l.titre=:titre";
        Query queryL = session.createQuery(hqlL);
        queryL.setParameter("titre", titre);
        results.addAll(queryL.list());
        
        session.close();
        
        Oeuvre o = null;
        if(!results.isEmpty()){
            o = (Oeuvre)results.get(0);
        }
        
        return o;
    }
}