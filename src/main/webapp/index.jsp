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

        <link rel="stylesheet" type="text/css" media="all" href="webjars/bootstrap-datepicker/1.3.1/css/datepicker.css" />
        <script type="text/javascript" src="webjars/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.js"></script>


    </head>
    <body>
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addUser">Ajouter un Usager</button>
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addLivre">Ajouter un Livre</button>
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addMagazine">Ajouter un Magazine</button>
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addExemplaire">Ajouter un Exemplaire</button>
        <a href="reservation.jsp">Réservations</a>
        <div class="modal fade" id="addUser" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter un Usager</h4>
                    </div>
                    <form action="./gestion_usager.jsp" method="POST">
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <td>
                                        Nom :
                                    </td>
                                    <td>
                                        <input type="text" name="nom" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Prenom :
                                    </td>
                                    <td>
                                        <input type="text" name="prenom" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Mail :
                                    </td>
                                    <td>
                                        <input type="text" name="mail" value="" />
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addLivre" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter un Livre</h4>
                    </div>
                    <form action="./gestion_oeuvre_et_exemplaire.jsp" method="POST">
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <td>
                                        Titre :
                                    </td>
                                    <td>
                                        <input type="text" name="titre" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Auteur :
                                    </td>
                                    <td>
                                        <input type="text" name="auteur" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date Edition :  
                                    </td>
                                    <td>

                                        <input type="text" id='datePickerLivre' name="date"  placeholder="Selectionnez date" aria-describedby="basic-addon1">


                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        Resume :
                                    </td>
                                    <td>
                                        <input type="text" name="resume" value="" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                            <input type="hidden" name="gestion_oeuvre" value="livre" />
                            <input type="submit" class="btn btn-primary" value="Enregistrer" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addMagazine" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter un Magazine</h4>
                    </div>
                    <form action="./gestion_oeuvre_et_exemplaire.jsp" method="POST">
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <td>
                                        Titre :
                                    </td>
                                    <td>
                                        <input type="text" name="titre" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Auteur :
                                    </td>
                                    <td>
                                        <input type="text" name="auteur" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date Parution :
                                    </td>
                                    <td>
                                        <input type="text" id='datePickerMag' name="date"  placeholder="Selectionnez date" aria-describedby="basic-addon1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Numero :
                                    </td>
                                    <td>
                                        <input type="number" name="numero" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Periodicite :
                                    </td>
                                    <td>
                                        <input type="text" name="periodicite" value="" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                            <input type="hidden" name="gestion_oeuvre" value="magazine" />
                            <input type="submit" class="btn btn-primary" value="Enregistrer" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addExemplaire" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Ajouter des Exemplaires</h4>
                    </div>
                    <form action="./gestion_oeuvre_et_exemplaire.jsp" method="POST">
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
        } else {
        %>
        <div class='alert alert-danger' style='position:fixed;bottom:0px;width:100%;text-align:center;'>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Informations Incomplètes ou Incorrectes !</strong>
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