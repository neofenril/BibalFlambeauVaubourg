package Objets_Metiers;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
    
    public void modifEtat(String etat){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        this.setEtat(etat); 

        session.update(this);

        session.getTransaction().commit();
        session.close();
    }
        
    public static ArrayList<Exemplaire> e_listeMauvaisEtat (){
        
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql = "SELECT e FROM Exemplaire e WHERE e.etat LIKE LOWER('abime')";
        Query query = session.createQuery(hql);
        ArrayList results = new ArrayList(query.list());

        session.close();
        
        

        return results;
    }
}
