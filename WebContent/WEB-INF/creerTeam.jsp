<%@ page pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <c:import url="/inc/header.jsp" />
        <div class="formTeam col-lg-12">


            <title>Création Team</title>
            <link type="text/css" rel="stylesheet" href="<c:url value=" inc/style.css "/>" />
            </head>

            <body>
                <div>
                    <form method="post" action="<c:url value="/creationTeam "/> ">


                        <%-- Si et seulement si la Map des clients en session n'est pas vide, alors on propose un choix à l'utilisateur --%>
                          
						<div class = "piloteRadio">
                            <c:if test="${ !empty sessionScope.pilotes }">
                                <label for="choixNouveauPilote">Nouveau pilote ? <span class="requis">*</span></label>
                                 <input type="radio" id="choixNouveauPilote" name="choixNouveauPilote" value="nouveauPilote" checked /> Oui 
                                 <input type="radio" id="choixNouveauPilote" name="choixNouveauPilote" value="ancienPilote" /> Non                                                                 
                            </c:if>
                            </div>
                            
                            <c:set var="pilote" value="${ team.pilote }" scope="request" />
                            
                            
                            <div id="nouveauPilote">
                                <c:import url="/inc/piloteForm2.jsp" />
                            </div>
</div>
                            <%-- Si et seulement si la Map des pilotes en session n'est pas vide, alors on crée la liste déroulante --%>
               
                                <c:set var="pilote" value="${ team.pilote }" scope="request" /> 

								
									<%-- 	                                <c:if test="${ form.chkErreur == false }">
											<div class="alert alert-danger" role="alert">
												<p>${ form.resultat }</p>
											</div>	
										</c:if>  --%>
										

                                    <div class="lolo col-lg-6 ">
                                        
                                       
                                        <div class="team  col-lg-offset-3">
                                            <img src="inc/img/team.png" class="img-rounded" style="width:70%" />
                                        </div> 
                                        

                                        <legend>Informations Equipe</legend>
                                        
                                        	<div class="form-group">
                                            <div class="row">
                                        
                                         <c:if test="${ !empty sessionScope.pilotes }">
                            
                   <div id="ancienPilote" >
                   
                   <div class="form-group">
      <label for="sel1">Nom du pilote:</label>
      <select class="form-control"  name="listePilotes" id="listePilotes">
        <option value="">Choisissez un pilote...</option>
                            <%-- Boucle sur la map des clients --%>
                            <c:forEach items="${ sessionScope.pilotes }" var="mapPilotes">
								<%--  L'expression EL ${mapClients.value} permet de cibler l'objet Client stocké en tant que valeur dans la Map, 
                                  et on cible ensuite simplement ses propriétés nom et prenom comme on le ferait avec n'importe quel bean. --%>
								
								<option value="${ mapPilotes.value.nom }">${ mapPilotes.value.prenom } ${ mapPilotes.value.nom }</option>
							</c:forEach>
						</select>                      
                   </div>  
                   </div>                          
                 </c:if>
                 </div>
                                       
											<div class="form-group">
                                            <div class="row">
                                                <label for="nomTeam">Nom de l'équipe </label> <input type="text" id="nomTeam" class="form-control col-lg-2" name="nomTeam" value="<c:out value=" ${team.nomTeam} "/>" size="20" maxlength="20" />
                                            </div>
                                            <span class="erreur">${form.erreurs['nomTeam']}</span>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <label for="motorTeam">Motoriste </label> <input type="text" id="motTeam" class="form-control col-lg-2" name="motTeam" value="<c:out value=" ${team.motTeam} "/>" size="20" maxlength="20" />
                                            </div>
                                            <span class="erreur">${form.erreurs['motTeam']}</span>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <label for="siegeS">Siege social </span></label> <input type="text" id="siegeS" class="form-control col-lg-2" name="siegeS" value="<c:out value=" ${team.siegeS} "/>" size="20" maxlength="20" />
                                            </div>
                                            <span class="erreur">${form.erreurs['siegeS']}</span>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <label for="directeur">Directeur </span></label> <input type="text" id="directeur" class="form-control col-lg-2" name="directeur" value="<c:out value=" ${team.directeur} "/>" size="20" maxlength="20" />
                                            </div>
                                            <span class="erreur">${form.erreurs['directeur']}</span>
                                        </div>

                                        <input type="submit" class="btn btn-info" value="Valider" />
                                        <input type="reset" class="btn btn-warning" value="Remettre à zéro" />
                                    </div>

                    </form>
                </div>
              

                    <%-- Petite fonction jQuery permettant le remplacement de la première partie du formulaire par la liste déroulante, au clic sur le bouton radio. --%>
                       
        <script>
        	jQuery(document).ready(function(){
        		/* 1 - Au lancement de la page, on cache le bloc d'éléments du formulaire correspondant aux clients existants */
        		$("div#ancienPilote").hide();
        		/* 2 - Au clic sur un des deux boutons radio "choixNouveauClient", on affiche le bloc d'éléments correspondant (nouveau ou ancien client) */
                jQuery('input[name=choixNouveauPilote]:radio').click(function(){
                	$("div#nouveauPilote").hide();
                	$("div#ancienPilote").hide();
                    var divId = jQuery(this).val();
                    $("div#"+divId).show();
                });
            });
        </script>
        
<c:import url="/inc/footer.jsp" />
