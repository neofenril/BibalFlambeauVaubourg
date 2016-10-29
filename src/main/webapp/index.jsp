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
        <div class="container-fluid">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div style="text-align:center;">
                    <h1 style="margin:0;padding-top:2%;padding-bottom:1%">Bibal Flambeau Vaubourg</h1>
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
                                    <li><a data-toggle="modal" data-target="#addUser">Ajouter un Usager</a></li>
                                    <li><a data-toggle="modal" data-target="#addLivre">Ajouter un Livre</a></li>
                                    <li><a data-toggle="modal" data-target="#addMagazine">Ajouter un Magazine</a></li>
                                    <li><a data-toggle="modal" data-target="#addExemplaire">Ajouter un Exemplaire</a></li>
                                    <li><a href="ihm_resa_et_emprunt.jsp">Réservations et emprunts</a></li>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div><!-- /.container-fluid -->
                    </nav>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
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