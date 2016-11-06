package Objets_Metiers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
            hql = "SELECT r FROM Reservation r, Usager u WHERE r.usager=u.id AND u.actif=1 AND r.livre=:oeuvre ORDER BY r.date_demande";
            Query query = session.createQuery(hql);
            query.setParameter("oeuvre", (Livre) oeuvre);
            results = query.list();
        } else {
            hql = "SELECT r FROM Reservation r, Usager u WHERE r.usager=u.id AND u.actif=1 AND r.magazine=:oeuvre ORDER BY r.date_demande";
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

    public static List<List> e_reservationDispo(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql = "SELECT ex FROM Exemplaire ex WHERE ex NOT IN (SELECT em.exemplaire FROM Emprunt em WHERE date_fin_effective is null) AND ex.magazine is null GROUP BY ex.livre";
        Query query = session.createQuery(hql);
        List results = query.list();
        
        hql = "SELECT ex FROM Exemplaire ex WHERE ex NOT IN (SELECT em.exemplaire FROM Emprunt em WHERE date_fin_effective is null) AND ex.livre is null GROUP BY ex.magazine";
        query = session.createQuery(hql);
        results.addAll(query.list());
        
        List results2 = new ArrayList();
        for(Object o: results){
            Exemplaire ex = (Exemplaire)o;
            
            if(ex.getLivre() == null){
                Magazine m = ex.getMagazine();
                hql = "SELECT r FROM Reservation r, Usager u WHERE r.usager=u.id AND u.actif=1 AND r.magazine=:magazine ORDER BY r.date_demande";
                Query query2 = session.createQuery(hql);
                query2.setParameter("magazine", m);
                
                if(!query2.list().isEmpty()){
                    results2.add(query2.list().get(0));
                }
            }else{
                Livre l = ex.getLivre();
                hql = "SELECT r FROM Reservation r, Usager u WHERE r.usager=u.id AND u.actif=1 AND r.livre=:livre ORDER BY r.date_demande";
                Query query2 = session.createQuery(hql);
                query2.setParameter("livre", l);
                
                if(!query2.list().isEmpty()){
                    results2.add(query2.list().get(0));
                }
            }
        }
        
        List res = new ArrayList();
        for(Object o: results2){
            Reservation r = (Reservation)o;
            String titre = "";
            String type = "";
            if(r.getLivre() == null){
                type = "Magazine";
                titre = r.getMagazine().getTitre();
            }else{
                type = "Livre";
                titre = r.getLivre().getTitre();
            }
            String mail = r.getUsager().getMail();
            
            ArrayList data = new ArrayList();
            data.add(type);
            data.add(titre);
            data.add(mail);
            res.add(data);
        }
        
        session.close();
        return res;
    }
    
    public static void e_deleteAllResaUser(Usager u)
    {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        
        String hql;
        hql = "DELETE  FROM Reservation r WHERE r.usager=:usager";
        Query query = session.createQuery(hql);
        query.setParameter("usager", u);
        query.executeUpdate();
        
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
