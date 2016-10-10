<%-- 
    Document   : index
    Created on : 10 oct. 2016, 14:16:53
    Author     : Yohann
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
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addUser">Ajouter un Usager</button>
        <%= session.getAttribute("message") %>
                  
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
        
    </body>
</html>
