<%-- 
    Document   : gestion_reservation
    Created on : 28 oct. 2016, 14:05:38
    Author     : arthu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <title>Bibliothèque</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="webjars/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body><div class="bs-example">
            <button data-toggle="collapse" data-target="#collapseOne">Ajouter réservation</button>
            <button data-toggle="collapse" data-target="#collapseTwo">Supprimer réservation</button>
                       

            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Ajout d'une réservation
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <form action="./gestion_reservation.jsp" method="POST">
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
                            <input type="hidden" name="gestion_oeuvre" value="exemplaire" />
                            <input type="submit" class="btn btn-primary" value="Enregistrer" />
                        </div>
                    </form>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Supression d'une réservation
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            autres trucs ici
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
