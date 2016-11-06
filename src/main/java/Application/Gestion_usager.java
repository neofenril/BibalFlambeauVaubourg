/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

import Objets_Metiers.Emprunt;
import Objets_Metiers.Reservation;
import Objets_Metiers.Usager;
import java.io.IOException;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yohann
 */
public class Gestion_usager extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_usager.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("gestion_usager");
        String message = "ok";
        
        switch(action){
                case "ajout":
                    message = e_ajouterUsager(request);
                    break;
                case "modif":
                    message = e_modifierUsager(request);
                    break;
                case "suppr":
                    message = e_supprimerUsager(request);
                    break;
                case "activ":
                    message = e_activerUsager(request);
                    break;
        }
        
        
        request.setAttribute("message", message);
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_usager.jsp").forward(request, response);
    }
    
    public static String e_ajouterUsager(HttpServletRequest request){
        String nom = request.getParameter("nom").trim();
        String prenom = request.getParameter("prenom").trim();
        String mail = request.getParameter("mail").trim();

        boolean isEmail = Pattern.matches("^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)+$", mail);
        Usager uExiste = Usager.e_identification(mail);

        String message = "ok";
        if (isEmail && nom != null && prenom != null && uExiste == null) {
            Usager u = Usager.e_ajouter(nom, prenom, mail);
        } else {
            message = "ko";
        }
        return message;
    }
    
    public static String e_modifierUsager(HttpServletRequest request){
        String mailActu = request.getParameter("mailActu").trim();
        String nom = request.getParameter("nom").trim();
        String prenom = request.getParameter("prenom").trim();
        String mail = request.getParameter("mail").trim();
        
        Usager uExiste = Usager.e_identification(mailActu);
        if(nom == ""){
            nom = uExiste.getNom();
        }
        if(prenom == ""){
            prenom = uExiste.getPrenom();
        }
        if(mail == ""){
            mail = uExiste.getMail();
        }
        boolean isEmail = Pattern.matches("^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)+$", mail);
        
        String message = "ok";
        if (isEmail && uExiste != null) {            
            Usager u = Usager.e_modifier(uExiste.getId(), nom, prenom, mail);
        } else {
            message = "ko";
        }
        return message;
    }
    
    public static String e_supprimerUsager(HttpServletRequest request){
        
        String mailActu = request.getParameter("mailActu").trim();
        Usager uExiste = Usager.e_identification(mailActu);
        boolean usagerEmpruntEnCours = Emprunt.empruntEnCours(uExiste);
        
        String message = "ok";
        if (uExiste != null && usagerEmpruntEnCours==false) {  
            Reservation.e_deleteAllResaUser(uExiste);
            Usager.e_supprimer(uExiste.getMail());
        } else {
            message = "ko";
        }
        return message;
    }

    private String e_activerUsager(HttpServletRequest request) {
        
        String mailActu = request.getParameter("mailActu").trim();
        Usager uExiste = Usager.e_identification(mailActu);
        String message = "ok";
        if (uExiste != null ) {
            Usager.e_activer(uExiste);
        } else {
            message = "ko";
        }
        return message;
    }
}
