package Objets_Metiers;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Magazine extends Oeuvre {

	private int numero;
	private String date_parution;
	private int periodicite;

    public Magazine(){}

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getDate_parution() {
        return date_parution;
    }

    public void setDate_parution(String date_parution) {
        this.date_parution = date_parution;
    }

    public int getPeriodicite() {
        return periodicite;
    }

    public void setPeriodicite(int periodicite) {
        this.periodicite = periodicite;
    }
    
    
    public static Magazine e_identification(String titre) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        String hql = "SELECT m FROM Magazine m WHERE m.titre=:titre";
        Query query = session.createQuery(hql);
        query.setParameter("titre", titre);
        List results = query.list();
        
        session.close();
        
        Magazine m = null;
        if(!results.isEmpty()){
            m = (Magazine)results.get(0);
        }
        
        return m;
    }

    public void e_supprimer(String titre) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static Magazine e_ajouter(String titre, String auteur, String date, int numero, int periodicite) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Magazine nvMagazine = new Magazine();
        nvMagazine.setTitre(titre);
        nvMagazine.setAuteur(auteur);
        nvMagazine.setDate_parution(date);
        nvMagazine.setNumero(numero);
        nvMagazine.setPeriodicite(periodicite);
        session.save(nvMagazine);
        
	session.getTransaction().commit();
        session.close();
        
        return nvMagazine;
    }
}