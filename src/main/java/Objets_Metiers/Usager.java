package Objets_Metiers;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import util.HibernateUtil;



public class Usager {
    private int id;
    private String nom;
    private String prenom;
    private String mail;

    
    public Usager(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getMail() {
        return mail;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }   
         
    /**
     * 
     * @param mail
     */
    public static Usager e_identification(String mail){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        String hql = "SELECT u FROM Usager u WHERE u.mail=:mail";
        Query query = session.createQuery(hql);
        query.setParameter("mail", mail);
        List results = query.list();
        
        session.close();
        
        Usager u = null;
        if(!results.isEmpty()){
            u = (Usager)results.get(0);
        }
        
        return u;
    }

    /**
     * 
     * @param name
     */
    public static Usager e_ajouter(String nom, String prenom, String mail) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Usager nvUsager = new Usager();
        nvUsager.setNom(nom);
        nvUsager.setPrenom(prenom);
        nvUsager.setMail(mail);
        session.save(nvUsager);
        
	session.getTransaction().commit();
        session.close();
        
        return nvUsager;
    }
    
    /**
     * 
     * @param name
     */
    public void e_modifier(String name) {
    	// TODO - implement Usager.e_modifier
        throw new UnsupportedOperationException();
    }

    /**
     * 
     * @param name
    */
    public void e_supprimer(String name) {
	// TODO - implement Usager.e_supprimer
        throw new UnsupportedOperationException();
    }
        
    @Override
    public String toString(){
        return "nom: "+nom+" |prenom: "+prenom+" |mail: "+mail;
    }
}
