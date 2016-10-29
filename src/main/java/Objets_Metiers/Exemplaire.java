package Objets_Metiers;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.persistence.TemporalType;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Exemplaire {

    private int id;
    private Date date_achat;
    private String etat;
    private Livre livre;
    private Magazine magazine;

    public Exemplaire() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate_achat() {
        return date_achat;
    }

    public void setDate_achat(Date date_achat) {
        this.date_achat = date_achat;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Livre getLivre() {
        return livre;
    }

    public void setLivre(Livre idLivre) {
        this.livre = idLivre;
    }

    public Magazine getMagazine() {
        return magazine;
    }

    public void setMagazine(Magazine magazine) {
        this.magazine = magazine;
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
        if (!results.isEmpty()) {
            e = (Exemplaire) results.get(0);
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

    public static Exemplaire e_ajouter(String date, String typeOeuvre, Oeuvre oeuvre) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Exemplaire nvExemp = new Exemplaire();

        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date d = formatter.parse(date);
            nvExemp.setDate_achat(d);

        } catch (Exception e) {
            e.printStackTrace();
        }

        nvExemp.setEtat("neuf");

        if (typeOeuvre.equals("livre")) {
            nvExemp.setLivre((Livre) oeuvre);
        } else {
            nvExemp.setMagazine((Magazine) oeuvre);
        }

        session.save(nvExemp);

        session.getTransaction().commit();
        session.close();

        return nvExemp;
    }

    public boolean estEmprunte() {
        
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql = "SELECT e FROM Emprunt e WHERE e.exemplaire=:exemplaire AND e.date_debut <= :today AND e.date_fin >= :today2 ";
        Query query = session.createQuery(hql);
        query.setParameter("exemplaire", this);
        query.setParameter("today", new Date(), TemporalType.DATE);
        query.setParameter("today2", new Date(), TemporalType.DATE);
        List results = query.list();

        session.close();

        boolean res = false;
        if (!results.isEmpty()) {
            res = true;
        }

        return res;
    }
}
