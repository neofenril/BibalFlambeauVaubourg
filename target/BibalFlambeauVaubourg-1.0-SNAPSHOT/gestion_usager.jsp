<%-- 
    Document   : gestion_usager.jsp
    Created on : 9 oct. 2016, 21:25:16
    Author     : Yohann
--%>

<%@page import="Objets_Metiers.Usager"%>
<%@page import="java.util.regex.Pattern"%>
<jsp:useBean id="usager" scope="session" class="Objets_Metiers.Usager" />
<jsp:setProperty name="usager" property="*" />

<%
    String nom = usager.getNom();
    String prenom = usager.getPrenom();
    String mail = usager.getMail();
    
    boolean isEmail = Pattern.matches("^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)+$", mail);
    Usager uExiste = Usager.e_identification(mail);
    
    String message = "ok";
    if(isEmail && nom!=null && prenom!=null && uExiste==null){
        Usager u = Usager.e_ajouter(nom, prenom, mail);
    }else{
        message = "ko ";
    }
    
    session.setAttribute("message", message);
    response.sendRedirect("index.jsp");
%>

