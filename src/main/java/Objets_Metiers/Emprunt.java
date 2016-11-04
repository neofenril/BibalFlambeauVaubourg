package Objets_Metiers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.TemporalType;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Emprunt {
    private int id;
    private Exemplaire exemplaire;
    private Usager usager;
    private Date date_debut;
    private Date date_fin_prevue;
    private Date date_fin_effective;

    public Emprunt() {
    }

    public Exemplaire getExemplaire() {
        return exemplaire;
    }

    public void setExemplaire(Exemplaire exemplaire) {
        this.exemplaire = exemplaire;
    }

    public Usager getUsager() {
        return usager;
    }

    public void setUsager(Usager usager) {
        this.usager = usager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin_prevue() {
        return date_fin_prevue;
    }

    public void setDate_fin_prevue(Date date_fin_prevue) {
        this.date_fin_prevue = date_fin_prevue;
    }

    public Date getDate_fin_effective() {
        return date_fin_effective;
    }

    public void setDate_fin_effective(Date date_fin_effective) {
        this.date_fin_effective = date_fin_effective;
    }

    public static Emprunt e_ajouter(Exemplaire e, Usager u) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Emprunt nvEmprunt = new Emprunt();
        
        try {
            Calendar dateEmprunt = Calendar.getInstance();
            nvEmprunt.setDate_debut(dateEmprunt.getTime());
            dateEmprunt.add(Calendar.DATE, 14);
            nvEmprunt.setDate_fin_prevue(dateEmprunt.getTime());

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        nvEmprunt.setExemplaire(e);
        nvEmprunt.setUsager(u);
        
        session.save(nvEmprunt);
        
	session.getTransaction().commit();
        session.close();

        return nvEmprunt;
    }

    
    public static Emprunt e_identification(Exemplaire e) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql = "SELECT e FROM Emprunt e WHERE e.exemplaire=:exemplaire AND e.date_fin_effective is null";
        Query query = session.createQuery(hql);
        query.setParameter("exemplaire", e);
        List results = query.list();

        session.close();

        Emprunt res = null;
        if (!results.isEmpty()) {
            res = (Emprunt)results.get(0);
        }

        return res;
    }
    
    public void rendreEmprunt(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        try {
            Calendar dateRetour = Calendar.getInstance();
            this.setDate_fin_effective(dateRetour.getTime());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        session.update(this);

        session.getTransaction().commit();
        session.close();
    }
    
    public static List<Emprunt> e_empruntDateDepassee(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql = "SELECT e FROM Emprunt e WHERE e.date_fin_prevue<=NOW() AND e.date_fin_effective is null";
        Query query = session.createQuery(hql);
        List results = query.list();
        
        return results;
    }
}
