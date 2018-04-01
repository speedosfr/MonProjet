<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />
<div class="formTeam col-lg-6 col-lg-offset-3">


	<title>Création Team</title>
	<link type="text/css" rel="stylesheet"
		href="<c:url value="/inc/style.css"/>" />
	</head>
	<body>
		<div>
			<form method=" post " action="<c:url value="/creationTeam"/>">
					 
                    <%-- Si et seulement si la Map des clients en session n'est pas vide, alors on propose un choix à l'utilisateur --%>
                    <c:if test="${ !empty sessionScope.pilotes }">
                        <label for="choixNouveauClient">Nouveau pilote ? <span class="requis">*</span></label>
                        <input type="radio" id="choixNouveauPilote" name="choixNouveauPilote" value="nouveauPilote" checked /> Oui
                        <input type="radio" id="choixNouveauPilote" name="choixNouveauPilote" value="ancienPilote" /> Non
                        <br/><br />
                    </c:if>
                    
                    <c:set var="pilote" value="${ team.pilote }" scope="request" />
                    <div id="nouveauPilote">
                        <c:import url="/inc/piloteForm.jsp" />
                    </div>
			 
			                     <%-- Si et seulement si la Map des clients en session n'est pas vide, alors on crée la liste déroulante --%>
                    <c:if test="${ !empty sessionScope.pilotes }">
                    <div id="ancienPilote">
                              
                    
                        <select class="selectpicker" name="listePilotes" id="listePilotes">
                            <option value="">Choisissez un pilote...</option>
                            <%-- Boucle sur la map des clients --%>
                            <c:forEach items="${ sessionScope.pilotes }" var="mapPilotes">
                            <%--  L'expression EL ${mapClients.value} permet de cibler l'objet Client stocké en tant que valeur dans la Map, 
                                  et on cible ensuite simplement ses propriétés nom et prenom comme on le ferait avec n'importe quel bean. --%>
                            <option value="${ mapPilotes.value.nom }">${ mapPilotes.value.prenom } ${ mapPilotes.value.nom }</option>
                            </c:forEach>
                        </select>
                    </div>
                    </c:if>
			 
			 <%-- Petite astuce ici : placer le pilote accessible via  
                 l'EL ${ team.client } dans une variable "pilote" de 
                 portée request, pour que le code du fragment fonctionne
                 à la fois depuis le formulaire de création d'un pilote 
                 et depuis celui de création d'une team. --%>
                 
                <c:set var="pilote" value="${ team.pilote }" scope="request" />

				<%-- <c:import url="/inc/piloteForm.jsp" />  --%>
		</div>
		<legend>Informations Equipe</legend>
		<c:import url="/inc/teamForm.jsp" />
 <c:if test="${ form.chkErreur == false }"><div class="alert alert-danger" role="alert"><p >${ form.resultat }</p>
	</div></c:if>
		<input type="submit" class="btn btn-info" value="Valider" />
		<input type="reset" class="btn btn-warning" value="Remettre à zéro" />
	
</div>
</form>
</div>
<%-- <script src="<c:url value="/inc/jquery.js"/>"></script> --%>
        
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