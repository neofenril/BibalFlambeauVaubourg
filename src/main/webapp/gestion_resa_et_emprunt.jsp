<%-- 
    Document   : gestion_reservation
    Created on : 28 oct. 2016, 14:28:19
    Author     : arthu
--%>
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
    
    switch (action)
    {
        case "add":
            String titreOeuvre = request.getParameter("titre").trim();
            String mailUser = request.getParameter("adress").trim();
            String typeOeuvre = request.getParameter("typeOeuvre");
            
            Oeuvre oExiste = Oeuvre.e_identification(titreOeuvre, typeOeuvre);
            Usager uExiste = Usager.e_identification(mailUser);
            
            Date date = new Date(Calendar.getInstance().getTime().getTime());
            
            
            if (oExiste!=null && date !=null && uExiste!=null)
            {
            Reservation r = Reservation.e_ajouter(uExiste, typeOeuvre,  oExiste,  date);
            }else{
                message = "ko";
            }
            
        case "del":
            String titreOeuvreSupp = request.getParameter("titre").trim();
            String mailUserSupp = request.getParameter("adress").trim();
            String typeOeuvreSupp = request.getParameter("typeOeuvre");
            
            Oeuvre oExisteSupp = Oeuvre.e_identification(titreOeuvreSupp, typeOeuvreSupp);
            Usager uExisteSupp = Usager.e_identification(mailUserSupp);
            
            Reservation rExiste = Reservation.e_identification(uExisteSupp, oExisteSupp, typeOeuvreSupp);
            if(rExiste != null)
            {
                Reservation.e_supprimer(rExiste);
            }
            else{
                message = "ko";
            }
            
    }       
    session.setAttribute("message", message);
    response.sendRedirect("index.jsp");   
            
            
    
     
%>
