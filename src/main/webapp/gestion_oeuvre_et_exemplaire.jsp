<%-- 
    Document   : gestion_oeuvre_et_exemplaire
    Created on : 25 oct. 2016, 21:25:09
    Author     : Yohann
--%>

<%@page import="Objets_Metiers.Exemplaire"%>
<%@page import="Objets_Metiers.Livre"%>
<%@page import="Objets_Metiers.Magazine"%>
<%@page import="Objets_Metiers.Oeuvre"%>

<%
    String action = request.getParameter("gestion_oeuvre");
    String message = "ok";
    
    switch (action){
        case "livre":
            String titreLivre = request.getParameter("titre");
            String auteurLivre = request.getParameter("auteur");
            String dateLivre = request.getParameter("date");
            String resumeLivre = request.getParameter("resume");

            Livre lExiste = Livre.e_identification(titreLivre);

            if(titreLivre!=null && auteurLivre!=null && dateLivre!=null && resumeLivre!=null && lExiste==null){
                Livre l = Livre.e_ajouter(titreLivre, auteurLivre, dateLivre, resumeLivre);
            }else{
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

            if(titreMagazine!=null && auteurMagazine!=null && dateMagazine!=null && numeroMagazine!=null && mExiste==null){
                Magazine m = Magazine.e_ajouter(titreMagazine, auteurMagazine, dateMagazine, Integer.valueOf(numeroMagazine), Integer.valueOf(periodiciteMagazine));
            }else{
                message = "ko";
            }
            break;
        case "exemplaire":
            String titreExemp = request.getParameter("titre");
            String nbExemp = request.getParameter("nb");
            String dateExemp = request.getParameter("date");
            
            Oeuvre oExiste = Oeuvre.e_identification(titreExemp);
            
            if(titreExemp!=null && nbExemp!=null && dateExemp!=null && oExiste!=null){
               int nb = Integer.valueOf(nbExemp);
               for(int i=0; i<nb; i++){
                   Exemplaire e = Exemplaire.e_ajouter(dateExemp, oExiste.getTitre());
               }
            }else{
                message = "ko";
            }
            break;
    }
    
    session.setAttribute("message", message);
    response.sendRedirect("index.jsp");
%>
