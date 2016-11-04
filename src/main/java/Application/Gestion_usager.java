/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

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
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_resa_et_emprunt.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom").trim();
        String prenom = request.getParameter("prenom").trim();
        String mail = request.getParameter("mail").trim();

        boolean isEmail = Pattern.matches("^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)+$", mail);
        Usager uExiste = Usager.e_identification(mail);

        String message = "ok";
        if (isEmail && nom != null && prenom != null && uExiste == null) {
            Usager u = Usager.e_ajouter(nom, prenom, mail);
        } else {
            message = "ko ";
        }
    }
}
