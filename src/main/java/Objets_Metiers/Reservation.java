package Objets_Metiers;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Session;
import util.HibernateUtil;

public class Reservation {

        private int id;
	private Date date_demande;
        private Usager usager;
        private Livre livre;
	private Magazine magazine;
        
        public Reservation(){}
        
	

        public static Reservation e_ajouter(Usager u, String typeOeuvre, Oeuvre oeuvre, Date date)
        {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
		 
            Reservation nvResa = new Reservation();
            
            // Creation de la date de réservation
            try {
                
                nvResa.setDate_demande(date);

            } catch (Exception e) {
                e.printStackTrace();
            }
            
            if(typeOeuvre.equals("livre")){
                nvResa.setLivre((Livre)oeuvre);
            }else{
                nvResa.setMagazine((Magazine)oeuvre);
            }
               nvResa.setUsager(u);
       
            session.save(nvResa);

            session.getTransaction().commit();
            session.close();
            
            return nvResa;
        }
	/**
	 * 
	 * @param u
	 * @param o
	 * @param date
	 */
	public void e_supprimer(Usager u, Oeuvre o, String date) {
		// TODO - implement Reservation.e_supprimer
		throw new UnsupportedOperationException();
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