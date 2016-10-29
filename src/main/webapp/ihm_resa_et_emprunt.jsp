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
    <body>
        
        <div class="container">
            <h2>Réservation ou emprunt</h2>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#collapse1">Réservations</a>
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
                                        <div class="panel-body"><form action="./gestion_resa_et_emprunt.jsp" method="POST">
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
                                                    <input type="hidden" name="addOrDel" value="add" />
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
                                        <div class="panel-body"><form action="./gestion_resa_et_emprunt.jsp" method="POST">
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
                                                    <input type="hidden" name="addOrDel" value="del" />
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
                            <a data-toggle="collapse" href="#collapse2">Emprunt</a>
                        </h4>
                        <div>Reprend comme j'ai fais au dessus pour ajout / suppression</div>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
