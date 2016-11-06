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
    private boolean actif;

    public boolean isActif() {
        return actif;
    }

    public void setActif(boolean actif) {
        this.actif = actif;
    }

    
    public Usager(){
        this.setActif(true);
    }

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

    public static void e_activer(Usager uExiste) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        uExiste.setActif(true);
        
        session.update(uExiste);
        
	session.getTransaction().commit();
        session.close();
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
    public static Usager e_modifier(int id, String nom, String prenom, String mail) {
    	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	Usager nvUsager = new Usager();
        nvUsager.setId(id);
        nvUsager.setNom(nom);
        nvUsager.setPrenom(prenom);
        nvUsager.setMail(mail);
        session.update(nvUsager);
        
	session.getTransaction().commit();
        session.close();
        
        return nvUsager;
    }

    /**
     * 
     * @param name
    */
    public static void e_supprimer(String mail) {
        Usager nvUsager = Usager.e_identification(mail);
        
	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
		 
	
        nvUsager.setActif(false);
        session.update(nvUsager);
        
	session.getTransaction().commit();
        session.close();
    }
        
    @Override
    public String toString(){
        return "nom: "+nom+" |prenom: "+prenom+" |mail: "+mail;
    }
}
