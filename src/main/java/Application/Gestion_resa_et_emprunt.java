package Application;

import Objets_Metiers.Emprunt;
import Objets_Metiers.Exemplaire;
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

public class Gestion_resa_et_emprunt extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_resa_et_emprunt.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("addOrDel");
        String message = "ok";

        switch (action) {
            case "addResa":
                message = e_ajouterReservation(request);
                break;
            case "delResa":
                message = e_supprimerReservation(request);
                break;
            case "addEmpr":
                message = e_ajouterEmprunt(request);
                break;
            case "delEmpr":
                message = rendreEmprunt(request);
                break;
            default:
                message = "";
                break;
        }

        request.setAttribute("message", message);
        /* Transmission de la paire d'objets request/response à notre JSP */
        this.getServletContext().getRequestDispatcher("/WEB-INF/IHM_resa_et_emprunt.jsp").forward(request, response);
    }

    public static String e_ajouterReservation(HttpServletRequest request) {
        String message = "ok";
        String titreOeuvre = request.getParameter("titre").trim();
        String mailUser = request.getParameter("adress").trim();
        String typeOeuvre = request.getParameter("typeOeuvre");

        Oeuvre oExiste = Oeuvre.e_identification(titreOeuvre, typeOeuvre);
        Usager uExiste = Usager.e_identification(mailUser);

        Date date = new Date(Calendar.getInstance().getTime().getTime());

        if (oExiste != null && date != null && uExiste != null && uExiste.isActif()) {
            Reservation r = Reservation.e_ajouter(uExiste, typeOeuvre, oExiste, date);
        } else {
            message = "ko";
        }
        return message;
    }

    public static String e_supprimerReservation(HttpServletRequest request) {
        String message = "ok";
        String titreOeuvreSupp = request.getParameter("titre").trim();
        String mailUserSupp = request.getParameter("adress").trim();
        String typeOeuvreSupp = request.getParameter("typeOeuvre");

        Oeuvre oExisteSupp = Oeuvre.e_identification(titreOeuvreSupp, typeOeuvreSupp);
        Usager uExisteSupp = Usager.e_identification(mailUserSupp);

        Reservation rExiste = Reservation.e_identification(uExisteSupp, oExisteSupp, typeOeuvreSupp);
        if (rExiste != null) {
            Reservation.e_supprimer(rExiste);
        } else {
            message = "ko";
        }
        return message;
    }

    public static String e_ajouterEmprunt(HttpServletRequest request) {
        String message = "ok";
        int idExemplaire = Integer.valueOf(request.getParameter("exemp"));
        String mailUsager = request.getParameter("mail");

        Exemplaire eExiste = Exemplaire.e_identification(idExemplaire);
        Usager uExisteEmpr = Usager.e_identification(mailUsager);

        if (eExiste != null && uExisteEmpr != null && uExisteEmpr.isActif()) {
            boolean insert = true;
            List<Reservation> resas = null;
            if (eExiste.getLivre() != null) {
                resas = Reservation.e_getReservations(eExiste.getLivre(), "livre");
            } else {
                resas = Reservation.e_getReservations(eExiste.getMagazine(), "magazine");
            }

            Emprunt empConcerne = Emprunt.e_identification(eExiste);
            if (empConcerne != null) {
                insert = false;
                message = "Exemplaire en cours d'Emprunt";
            } else if (resas != null && !resas.isEmpty()) {
                Usager mailUResa = resas.get(0).getUsager();
                if (mailUResa.getId() != uExisteEmpr.getId()) {
                    insert = false;
                    message = "Exemplaire Réservé par un autre Usager";
                } else {
                    Reservation.e_supprimer(resas.get(0));
                }
            }

            if (insert) {
                Emprunt.e_ajouter(eExiste, uExisteEmpr);
            }
        } else {
            message = "ko";
        }
        return message;
    }

    public static String rendreEmprunt(HttpServletRequest request) {
        String message = "ok";
        int idExemp = Integer.valueOf(request.getParameter("exemp"));
        String etat = request.getParameter("etat");

        Exemplaire eExisteRetour = Exemplaire.e_identification(idExemp);

        if (eExisteRetour != null && etat != null) {
            Emprunt emprConcerne = Emprunt.e_identification(eExisteRetour);
            if (emprConcerne == null) {
                message = "Exemplaire non emprunté";
            } else {
                eExisteRetour.modifEtat(etat);
                emprConcerne.rendreEmprunt();
            }
        } else {
            message = "ko";
        }
        return message;
    }
}
