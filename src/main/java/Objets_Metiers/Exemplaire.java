package Objets_Metiers;

import static Application.Gestion_oeuvre_et_exemplaire.e_supprimerExemplaire;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.persistence.TemporalType;
import org.hibernate.Session;
import org.hibernate.Transaction;
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

    public String getTitre(){
        String s;
        s = this.magazine.getTitre();
        return s;
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
        
        Calendar dateAchat = Calendar.getInstance();
        dateAchat.add(Calendar.YEAR, -2);
        Date dateAchatLimite = dateAchat.getTime();
        String hql = "SELECT e FROM Exemplaire e WHERE e.etat LIKE LOWER('abime') OR e.date_achat < :dateAchatLimite ";
        Query query = session.createQuery(hql);
        query.setParameter("dateAchatLimite", dateAchatLimite);
        ArrayList results = new ArrayList(query.list());
        return results;
    }
    
    public static void e_supprimerExemplaire(int id) {
        
        
        
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        Exemplaire exemplaire;
        
        exemplaire = (Exemplaire)session.load(Exemplaire.class,id);
        session.delete(exemplaire);
        
        session.getTransaction().commit();
        session.close();
        
    }
    
    public static Exemplaire e_identification(Oeuvre oExiste) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();

        String hql = "SELECT e FROM Exemplaire e WHERE e.livre=:l OR e.magazine=:m";
        Query query = session.createQuery(hql);
        query.setParameter("l", oExiste);
        query.setParameter("m", oExiste);
        List results = query.list();

        session.close();

        Exemplaire e = null;
        if (!results.isEmpty()) {
            e = (Exemplaire) results.get(0);
        }

        return e;
    }
}
