package Objets_Metiers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Livre extends Oeuvre {

    
	private Date date_edition;
	private String resume;
        
        public Livre(){}

        public Date getDate_edition() {
            return date_edition;
        }

        public void setDate_edition(Date date_edition) {
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



    public static Livre e_ajouter(String titre, String auteur, String date, String resume) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Livre nvLivre = new Livre();
        nvLivre.setTitre(titre);
        nvLivre.setAuteur(auteur);
        
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date d = formatter.parse(date);
            nvLivre.setDate_edition(d);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        nvLivre.setResume(resume);
        session.save(nvLivre);
        
	session.getTransaction().commit();
        session.close();
        
        return nvLivre;
    }
    public static void e_supprimer(Oeuvre o) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
        session.close();
    }
}