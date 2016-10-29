package Objets_Metiers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.hibernate.Session;
import util.HibernateUtil;

public class Emprunt {
    private int id;
    private Exemplaire exemplaire;
    private Usager usager;
    private Date date_debut;
    private Date date_fin;

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

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public static Emprunt e_ajouter(Exemplaire e, Usager u) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Emprunt nvEmprunt = new Emprunt();
        
        try {
            Calendar dateEmprunt = Calendar.getInstance();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            nvEmprunt.setDate_debut(dateEmprunt.getTime());
            dateEmprunt.add(Calendar.DATE, 14);
            nvEmprunt.setDate_fin(dateEmprunt.getTime());

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

}
