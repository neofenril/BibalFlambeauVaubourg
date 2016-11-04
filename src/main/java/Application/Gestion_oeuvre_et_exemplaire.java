/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

import Objets_Metiers.Emprunt;
import Objets_Metiers.Exemplaire;
import Objets_Metiers.Livre;
import Objets_Metiers.Magazine;
import Objets_Metiers.Oeuvre;
import Objets_Metiers.Reservation;
import Objets_Metiers.Usager;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yohann
 */
public class Gestion_oeuvre_et_exemplaire extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_resa_et_emprunt.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("gestion_oeuvre");
        String message = "ok";

        switch (action) {
            case "livre":
                String titreLivre = request.getParameter("titre");
                String auteurLivre = request.getParameter("auteur");
                String dateLivre = request.getParameter("date");
                String resumeLivre = request.getParameter("resume");

                Livre lExiste = Livre.e_identification(titreLivre);

                if (titreLivre != null && auteurLivre != null && dateLivre != null && resumeLivre != null && lExiste == null) {
                    Livre l = Livre.e_ajouter(titreLivre, auteurLivre, dateLivre, resumeLivre);
                } else {
                    message = "ko";
                }
                break;
            case "magazine":
                String titreMagazine = request.getParameter("titre");
                String auteurMagazine = request.getParameter("auteur");
                String dateMagazine = request.getParameter("date");
                String numeroMagazine = request.getParameter("numero");
                String periodiciteMagazine = request.getParameter("periodicite");

                Magazine mExiste = Magazine.e_identification(titreMagazine);

                if (titreMagazine != null && auteurMagazine != null && dateMagazine != null && numeroMagazine != null && mExiste == null) {
                    Magazine m = Magazine.e_ajouter(titreMagazine, auteurMagazine, dateMagazine, Integer.valueOf(numeroMagazine), periodiciteMagazine);
                } else {
                    message = "ko";
                }
                break;
            case "exemplaire":
                String titreExemp = request.getParameter("titre");
                String nbExemp = request.getParameter("nb");
                String dateExemp = request.getParameter("date");
                String typeOeuvre = request.getParameter("typeOeuvre");

                Oeuvre oExiste = Oeuvre.e_identification(titreExemp, typeOeuvre);

                if (titreExemp != null && nbExemp != null && dateExemp != null && oExiste != null) {
                    int nb = Integer.valueOf(nbExemp);
                    for (int i = 0; i < nb; i++) {
                        Exemplaire e = Exemplaire.e_ajouter(dateExemp, typeOeuvre, oExiste);
                    }
                } else {
                    message = "ko";
                }
                break;
        }

        request.setAttribute("message", message);
        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_resa_et_emprunt.jsp").forward(request, response);
    }

}
