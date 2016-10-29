package Objets_Metiers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import util.HibernateUtil;

public class Reservation {

    private int id;
    private Date date_demande;
    private Usager usager;
    private Livre livre;
    private Magazine magazine;

    public Reservation() {
    }

    public static Reservation e_ajouter(Usager u, String typeOeuvre, Oeuvre oeuvre, Date date) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        Reservation nvResa = new Reservation();

        // Creation de la date de réservation
        try {

            nvResa.setDate_demande(date);

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (typeOeuvre.equals("livre")) {
            nvResa.setLivre((Livre) oeuvre);
        } else {
            nvResa.setMagazine((Magazine) oeuvre);
        }
        nvResa.setUsager(u);

        session.save(nvResa);

        session.getTransaction().commit();
        session.close();

        return nvResa;
    }

    public static Reservation e_identification(Usager usager, Oeuvre oeuvre, String typeOeuvre) {

        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql;

        List results;
        if (typeOeuvre.equals("livre")) {
            hql = "SELECT r FROM Reservation r WHERE r.usager=:usager AND r.livre=:oeuvre";
            Query query = session.createQuery(hql);
            query.setParameter("oeuvre", (Livre) oeuvre);
            query.setParameter("usager", usager);
            results = query.list();
        } else {
            hql = "SELECT r FROM Reservation r WHERE r.usager=:usager AND r.magazine=:oeuvre";
            Query query = session.createQuery(hql);
            query.setParameter("oeuvre", (Magazine) oeuvre);
            query.setParameter("usager", usager);
            results = query.list();
        }

        session.close();

        Reservation r = null;
        if (!results.isEmpty()) {
            r = (Reservation) results.get(0);
        }

        return r;
    }

    public static List<Reservation> e_getReservations(Oeuvre oeuvre, String typeOeuvre){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql;

        List results;
        if (typeOeuvre.equals("livre")) {
            hql = "SELECT r FROM Reservation r WHERE r.livre=:oeuvre ORDER BY r.date_demande";
            Query query = session.createQuery(hql);
            query.setParameter("oeuvre", (Livre) oeuvre);
            results = query.list();
        } else {
            hql = "SELECT r FROM Reservation r WHERE r.magazine=:oeuvre ORDER BY r.date_demande";
            Query query = session.createQuery(hql);
            query.setParameter("oeuvre", (Magazine) oeuvre);
            results = query.list();
        }

        session.close();
        
        return results;
    }
    
    /**
     *
     * @param u
     * @param o
     * @param date
     */
    public static void e_supprimer(Reservation resa) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.delete(resa);
        session.getTransaction().commit();
        session.close();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate_demande() {
        return date_demande;
    }

    public void setDate_demande(Date date_demande) {
        this.date_demande = date_demande;
    }

    public Usager getUsager() {
        return usager;
    }

    public void setUsager(Usager usager) {
        this.usager = usager;
    }

    public Livre getLivre() {
        return livre;
    }

    public void setLivre(Livre livre) {
        this.livre = livre;
    }

    public Magazine getMagazine() {
        return magazine;
    }

    public void setMagazine(Magazine magazine) {
        this.magazine = magazine;
    }

}
