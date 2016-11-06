<%@page import="Objets_Metiers.Exemplaire"%>
<%@page import="Objets_Metiers.Reservation"%>
<%@page import="java.util.Date"%>
<%@page import="Objets_Metiers.Emprunt"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Bibliothèque</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="webjars/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" media="all" href="webjars/bootstrap-datepicker/1.4.0/css/bootstrap-datepicker.css" />
        <script type="text/javascript" src="webjars/bootstrap-datepicker/1.4.0/js/bootstrap-datepicker.js"></script>


    </head>
    <body style="
          background-image: url('images/test.jpg') ;
          background-repeat: no-repeat;
          background-size: cover;">
        <div class="container">
            <div class="row">
                <div class="col-md-0"></div>
                <div class="col-md-12">
                    <div style="text-align:center;">
                        <h1 style="margin:0;padding-top:2%;padding-bottom:1%">Bibal FLAMBEAU VAUBOURG</h1>
                    </div>
                    <div>
                        <nav class="navbar navbar-inverse">
                            <div class="container-fluid">
                                <!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <a class="navbar-brand" href="index.jsp">Bibal</a>
                                </div>
                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li><a href="<c:url value="/usager"/>">Usager</a></li>
                                        <li><a href="<c:url value="/oeuvre_et_exemplaire"/>">Oeuvres et exemplaires</a></li>
                                        <li><a href="<c:url value="/resa_et_emprunt"/>">Réservations et emprunts</a></li>
                                    </ul>
                                </div><!-- /.navbar-collapse -->
                            </div><!-- /.container-fluid -->
                        </nav>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8" style="text-align:center;background-color:white;padding-bottom:2%">
                    <h3>Emprunt en Retard</h3>
                    <table style="width:100%;text-align:center;">
                        <thead>
                            <tr>
                                <th style="text-align:center;">Titre Oeuvre</th>
                                <th style="text-align:center;">Mail Usager</th>
                                <th style="text-align:center;">Date Retour Prévue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%!
                                List<List> empruntDateDepassee = Emprunt.e_empruntDateDepassee();
                                String titre;
                                String mail;
                                Date date;
                            %>
                            <%
                                for (List  l: empruntDateDepassee) {
                                    titre = (String)l.get(0);
                                    mail = (String)l.get(1);
                                    date = (Date)l.get(2);
                            %>
                            <tr>
                                <td><%=titre%></td>
                                <td><%=mail%></td>
                                <td><%=date%></td>
                            </tr>  
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8" style="text-align:center;background-color:white;padding-bottom:2%">
                    <h3>Réservation Disponible</h3>
                    <table style="width:100%;text-align:center;">
                        <thead>
                            <tr>
                                <th style="text-align:center;">Type Oeuvre</th>
                                <th style="text-align:center;">Titre Oeuvre</th>
                                <th style="text-align:center;">Mail Usager</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%!
                                List<List> reservationDispo = Reservation.e_reservationDispo();
                                String typeResa;
                                String titreResa;
                                String mailResa;
                            %>
                            <%
                                for (List  l: reservationDispo) {
                                    typeResa = (String)l.get(0);
                                    titreResa = (String)l.get(1);
                                    mailResa = (String)l.get(2);
                            %>
                            <tr>
                                <td><%=typeResa%></td>
                                <td><%=titreResa%></td>
                                <td><%=mailResa%></td>
                            </tr>  
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>



        <%
            String message = (String) session.getAttribute("message");

            if (message != null) {
                if (message.equals("ok")) {
        %>
        <div class='alert alert-success' style='position:fixed;bottom:0px;width:100%;text-align:center;'>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Données Enregistrées !</strong>
        </div>
        <%
        } else if (message.equals("ko")) {
        %>
        <div class='alert alert-danger' style='position:fixed;bottom:0px;width:100%;text-align:center;'>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Informations Incomplètes ou Incorrectes !</strong>
        </div>
        <%
        } else if (message.equals("")) {
        } else {
        %>
        <div class='alert alert-danger' style='position:fixed;bottom:0px;width:100%;text-align:center;'>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong><%= message%></strong>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
<script type="text/javascript">
    $(function () {
        $('#datePickerLivre').datepicker({
            format: "dd/mm/yyyy"
        });
    });
    $(function () {
        $('#datePickerMag').datepicker({
            format: "dd/mm/yyyy"
        });
    });
    $(function () {
        $('#datePickerEx').datepicker({
            format: "dd/mm/yyyy"
        });
    });
</script>