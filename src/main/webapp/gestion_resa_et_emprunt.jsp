<%-- 
    Document   : gestion_reservation
    Created on : 28 oct. 2016, 14:28:19
    Author     : arthu
--%>
<%@page import="java.util.List"%>
<%@page import="Objets_Metiers.Emprunt"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Objets_Metiers.Exemplaire"%>
<%@page import="Objets_Metiers.Livre"%>
<%@page import="Objets_Metiers.Magazine"%>
<%@page import="Objets_Metiers.Oeuvre"%>
<%@page import="Objets_Metiers.Usager"%>
<%@page import="Objets_Metiers.Reservation"%>

<%
    String action = request.getParameter("addOrDel");
    String message = "ok";

    switch (action) {
        case "addResa":
            String titreOeuvre = request.getParameter("titre").trim();
            String mailUser = request.getParameter("adress").trim();
            String typeOeuvre = request.getParameter("typeOeuvre");

            Oeuvre oExiste = Oeuvre.e_identification(titreOeuvre, typeOeuvre);
            Usager uExiste = Usager.e_identification(mailUser);

            Date date = new Date(Calendar.getInstance().getTime().getTime());

            if (oExiste != null && date != null && uExiste != null) {
                Reservation r = Reservation.e_ajouter(uExiste, typeOeuvre, oExiste, date);
            } else {
                message = "ko";
            }
            break;

        case "delResa":
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
            break;

        case "addEmpr":
            int idExemplaire = Integer.valueOf(request.getParameter("exemp"));
            String mailUsager = request.getParameter("mail");

            Exemplaire eExiste = Exemplaire.e_identification(idExemplaire);
            Usager uExisteEmpr = Usager.e_identification(mailUsager);

            if (eExiste != null && uExisteEmpr != null) {
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
            break;

        case "delEmpr":
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
            break;
        default:
            message = "";
            break;
    }
    
    session.setAttribute("message", message);
    response.sendRedirect("index.jsp");
%>