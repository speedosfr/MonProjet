<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />

<title>Liste des Teams existantes</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/inc/style.css"/>" />
</head>
<body>

	<div id="corps">
		<c:choose>
			<%-- Si aucune team n'existe en session, affichage d'un message par d�faut. --%>
			<c:when test="${ empty sessionScope.teams }">
				<div class="alert alert-warning col-lg-4 col-lg-offset-4"><p>Aucune Team enregistr�e.</p></div>
			</c:when>
			<%-- Sinon, affichage du tableau. --%>
			<c:otherwise>

				
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Pilote</th>
								<th scope="col">Nom</th>
								<th scope="col">Motoriste</th>
								<th scope="col">Siege Social</th>
								<th scope="col">Directeur</th>
								<th class="action">Action</th>
							</tr>
						</thead>
						
						<%-- Parcours de la Map des teams en session, et utilisation de l'objet varStatus. --%>
						<c:forEach items="${ sessionScope.teams }" var="mapTeams"
							varStatus="boucle">
							<%-- Simple test de parit� sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>
							<tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">
								<%-- Affichage des propri�t�s du bean Team, qui est stock� en tant que valeur de l'entr�e courante de la map --%>
								<td><c:out
										value="${ mapTeams.value.pilote.prenom } ${ mapTeams.value.pilote.nom }" /></td>
								<td><c:out value="${ mapTeams.value.nomTeam }" /></td>
								<td><c:out value="${ mapTeams.value.motTeam }" /></td>
								<td><c:out value="${ mapTeams.value.siegeS }" /></td>
								<td><c:out value="${ mapTeams.value.directeur }" /></td>

								<%-- Lien vers la servlet de suppression, avec passage de la date de la commande - c'est-�-dire la cl� de la Map - en param�tre gr�ce � la balise <c:param/>. --%>
								<td class="action"><a
									href="<c:url value="/suppressionTeam"><c:param name="dateTeam" value="${ mapTeams.key }" /></c:url>">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</a></td>
							</tr>
						</c:forEach>
					</table>
			</c:otherwise>
		</c:choose>
		</div>
	
</body>
</html>