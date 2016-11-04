<%-- 
    Document   : IHM_usager
    Created on : 4 nov. 2016, 16:36:34
    Author     : Yohann
--%>

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
    </head>
    <body>

        <div class="container">
            <h2>Usager</h2>
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
                                <li><a data-toggle="modal" data-target="#addLivre">Ajouter un Livre</a></li>
                                <li><a data-toggle="modal" data-target="#addMagazine">Ajouter un Magazine</a></li>
                                <li><a data-toggle="modal" data-target="#addExemplaire">Ajouter un Exemplaire</a></li>
                                <li><a href="<c:url value="/resa_et_emprunt"/>" >Réservations et emprunts</a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#collapse1">Ajouter un Usager</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse in">
                        <div>
                            <form action="<c:url value="/usager"/>" method="POST">
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
                    </body>
                    </html>
