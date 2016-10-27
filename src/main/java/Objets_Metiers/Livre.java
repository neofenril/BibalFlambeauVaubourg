package Objets_Metiers;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Livre extends Oeuvre {
	private String date_edition;
	private String resume;
        
        public Livre(){}

        public String getDate_edition() {
            return date_edition;
        }

        public void setDate_edition(String date_edition) {
            this.date_edition = date_edition;
        }

        public String getResume() {
            return resume;
        }

        public void setResume(String resume) {
            this.resume = resume;
        }

    public static Livre e_identification(String titre) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        String hql = "SELECT l FROM Livre l WHERE l.titre=:titre";
        Query query = session.createQuery(hql);
        query.setParameter("titre", titre);
        List results = query.list();
        
        session.close();
        
        Livre l = null;
        if(!results.isEmpty()){
            l = (Livre)results.get(0);
        }
        
        return l;
    }

    public static void e_supprimer(String titre) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static Livre e_ajouter(String titre, String auteur, String date, String resume) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Livre nvLivre = new Livre();
        nvLivre.setTitre(titre);
        nvLivre.setAuteur(auteur);
        nvLivre.setDate_edition(date);
        nvLivre.setResume(resume);
        session.save(nvLivre);
        
	session.getTransaction().commit();
        session.close();
        
        return nvLivre;
    }
}