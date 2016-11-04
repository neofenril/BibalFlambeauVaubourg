<%-- 
    Document   : gestion_reservation
    Created on : 28 oct. 2016, 14:05:38
    Author     : arthu
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
    <body>

        <div class="container">
            <h2>Oeuvres et Exemplaires</h2>
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
                                <li><a href="<c:url value="/usager"/>">Ajouter un Usager</a></li>
                                <li><a href="<c:url value="/oeuvre_et_exemplaire"/>">Oeuvres et exemplaires</a></li>
                                <li><a href="<c:url value="/resa_et_emprunt"/>">Réservations et emprunts</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#collapse1">Oeuvres</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="container" style="margin-top: 15px;">
                            <div class="panel-group" id="accordionResa" style="max-width: 97%;">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordionResa" href="#collapseResa1">Ajouter une réservation</a>
                                        </h4>
                                    </div>
                                    <div id="collapseResa1" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <form action="<c:url value="/resa_et_emprunt"/>" method="POST">
                                                <div class="modal-body">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                Type Oeuvre :
                                                            </td>
                                                            <td>
                                                                Livre <input type="radio" name="typeOeuvre" value="livre" checked="checked" />
                                                                Magazine <input type="radio" name="typeOeuvre" value="magazine" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Titre Oeuvre :
                                                            </td>
                                                            <td>
                                                                <input type="text" name="titre" value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Adresse email Usager :
                                                            </td>
                                                            <td>
                                                                <input type="text" name="adress"  />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                    <input type="hidden" name="addOrDel" value="addResa" />
                                                    <input type="submit" class="btn btn-primary" value="Enregistrer" />
                                                </div>
                                            </form></div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordionResa" href="#collapseResa2">Supprimer une réservation</a>
                                        </h4>
                                    </div>
                                    <div id="collapseResa2" class="panel-collapse collapse">
                                        <div class="panel-body"><form action="<c:url value="/resa_et_emprunt"/>" method="POST">
                                                <div class="modal-body">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                Type Oeuvre :
                                                            </td>
                                                            <td>
                                                                Livre <input type="radio" name="typeOeuvre" value="livre" checked="checked" />
                                                                Magazine <input type="radio" name="typeOeuvre" value="magazine" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Titre Oeuvre :
                                                            </td>
                                                            <td>
                                                                <input type="text" name="titre" value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Adresse email Usager :
                                                            </td>
                                                            <td>
                                                                <input type="text" name="adress"  />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                    <input type="hidden" name="addOrDel" value="delResa" />
                                                    <input type="submit" class="btn btn-primary" value="Enregistrer" />
                                                </div>
                                            </form></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#collapse2">Exemplaires</a>
                        </h4>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="container" style="margin-top: 15px;">
                                <div class="panel-group" id="accordionEmpr" style="max-width: 97%;">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordionEmpr" href="#collapseEmpr1">Ajouter des exemplaires</a>
                                            </h4>
                                        </div>
                                        <div id="collapseEmpr1" class="panel-collapse collapse in" >
                                            <div class="panel-body">
                                                <form action="<c:url value="/oeuvre_et_exemplaire"/>" method="POST">
                                                    <div class="modal-body">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    Type Oeuvre :
                                                                </td>
                                                                <td>
                                                                    Livre <input type="radio" name="typeOeuvre" value="livre" checked="checked" />
                                                                    Magazine <input type="radio" name="typeOeuvre" value="magazine" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Titre Oeuvre :
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="titre" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Nombre :
                                                                </td>
                                                                <td>
                                                                    <input type="number" name="nb" value="1" min='1'/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Date Achat :
                                                                </td>
                                                                <td>
                                                                    <input type="text" id='datePickerEx' name="date"  placeholder="Selectionnez date" aria-describedby="basic-addon1">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        <input type="hidden" name="gestion_oeuvre" value="exemplaire" />
                                                        <input type="submit" class="btn btn-primary" value="Enregistrer" />
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    String message = (String) request.getAttribute("message");

                    if (message != null) {
                        if (message.equals("ok")) {
                %>
                <div class='alert alert-success' style='position:fixed;bottom:0px;width:70%;text-align:center;'>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Données Enregistrées !</strong>
                </div>
                <%
                } else if (message.equals("ko")) {
                %>
                <div class='alert alert-danger' style='position:fixed;bottom:0px;width:70%;text-align:center;'>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Informations Incomplètes ou Incorrectes !</strong>
                </div>
                <%
                } else if (message.equals("")) {
                } else {
                %>
                <div class='alert alert-danger' style='position:fixed;bottom:0px;width:70%;text-align:center;'>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong><%= message%></strong>
                </div>
                <%
                        }
                    }
                %>
            </div>




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