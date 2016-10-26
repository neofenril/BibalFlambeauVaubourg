package Objets_Metiers;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Exemplaire {

	private int id;
	private String date_achat;
	private String etat;
	private String titreOeuvre;

        public Exemplaire(){}

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getDate_achat() {
            return date_achat;
        }

        public void setDate_achat(String date_achat) {
            this.date_achat = date_achat;
        }

        public String getEtat() {
            return etat;
        }

        public void setEtat(String etat) {
            this.etat = etat;
        }

        public String getTitreOeuvre() {
            return titreOeuvre;
        }

        public void setTitreOeuvre(String titreOeuvre) {
            this.titreOeuvre = titreOeuvre;
        }
        
        
	/**
	 * 
	 * @param o
	 */
	public static Exemplaire e_identification(int id) {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();

            String hql = "SELECT e FROM Exemplaire e WHERE e.id=:id";
            Query query = session.createQuery(hql);
            query.setParameter("id", id);
            List results = query.list();

            session.close();

            Exemplaire e = null;
            if(!results.isEmpty()){
                e = (Exemplaire)results.get(0);
            }

            return e;
	}

	/**
	 * 
	 * @param id
	 */
	public static void e_modifier(int id) {
		// TODO - implement Exemplaire.e_modifier
		throw new UnsupportedOperationException();
	}

	/**
	 * 
	 * @param id
	 */
	public static void e_supprimer(int id) {
		// TODO - implement Exemplaire.e_supprimer
		throw new UnsupportedOperationException();
	}
        
    public static Exemplaire e_ajouter(String date, String titreOeuvre) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Exemplaire nvExemp = new Exemplaire();
        nvExemp.setDate_achat(date);
        nvExemp.setEtat("neuf");
        nvExemp.setTitreOeuvre(titreOeuvre);
        session.save(nvExemp);
        
	session.getTransaction().commit();
        session.close();
        
        return nvExemp;
    }
}