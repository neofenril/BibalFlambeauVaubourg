<%-- 
    Document   : gestion_reservation
    Created on : 28 oct. 2016, 14:05:38
    Author     : arthu
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
            <h2>Réservation ou Emprunt</h2>
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
                            <a data-toggle="collapse" href="#collapse2">Emprunt</a>
                        </h4>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="container" style="margin-top: 15px;">
                                <div class="panel-group" id="accordionEmpr" style="max-width: 97%;">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordionEmpr" href="#collapseEmpr1">Ajouter un Emprunt</a>
                                            </h4>
                                        </div>
                                        <div id="collapseEmpr1" class="panel-collapse collapse in">
                                            <div class="panel-body"><form action="./gestion_resa_et_emprunt.jsp" method="POST">
                                                    <div class="modal-body">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    Identifiant Exemplaire :
                                                                </td>
                                                                <td>
                                                                    <input type="number" name="exemp" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Adresse email Usager :
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="mail"  />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <%!
                                                                    Calendar dateEmprunt = Calendar.getInstance();
                                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                                %>
                                                                <td>
                                                                    Date début Emprunt :
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="dateDeb" value="<%= sdf.format(dateEmprunt.getTime().getTime())%>" readonly/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <%
                                                                    dateEmprunt.add(Calendar.DATE, 14);
                                                                %>
                                                                <td>
                                                                    Date fin Emprunt :
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="dateFin" value="<%= sdf.format(dateEmprunt.getTime())%>" readonly/>
                                                                </td>
                                                                <%
                                                                    dateEmprunt.add(Calendar.DATE, -14);
                                                                %>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        <input type="hidden" name="addOrDel" value="addEmpr" />
                                                        <input type="submit" class="btn btn-primary" value="Enregistrer" />
                                                    </div>
                                                </form></div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordionEmpr" href="#collapseEmpr2">Retour Emprunt</a>
                                            </h4>
                                        </div>
                                        <div id="collapseEmpr2" class="panel-collapse collapse">
                                            <div class="panel-body"><form action="./gestion_resa_et_emprunt.jsp" method="POST">
                                                    <div class="modal-body">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    Identifiant Exemplaire :
                                                                </td>
                                                                <td>
                                                                    <input type="number" name="exemp" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Etat Exemplaire :
                                                                </td>
                                                                <td>
                                                                    <select name="etat">
                                                                        <option value="neuf">neuf</option>
                                                                        <option value="usé">usé</option>
                                                                        <option value="abimé">abimé</option>
                                                                        <option value="détruit">détruit</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
                                                        <input type="hidden" name="addOrDel" value="delEmpr" />
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
            </div>



    </body>
</html>