<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />

<title>Liste des pilotes existants</title>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/inc/style.css"/>" />
</head>
<body>

	<div class="container">
	
	<div class="lolo col-lg-8 col-lg-offset-2">
	
	<legend>Liste des Pilotes</legend>
	<div class="team  col-lg-offset-1">			
				<img src="inc/img/drivers.png" class="img-rounded" style="width:100%" />
	</div>
	
		<c:choose>
			<%-- Si aucun client n'existe en session, affichage d'un message par d�faut. --%>
			<c:when test="${ empty sessionScope.pilotes }">
				<div class="alert alert-warning col-lg-4 col-lg-offset-4"><p>Aucun pilote enregistr�.</p></div>
			</c:when>
			<%-- Sinon, affichage du tableau. --%>
			<c:otherwise>
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">Nom</th>
							<th scope="col">Pr�nom</th>
							<th scope="col">Nationalit�</th>
							<th class="action">Action</th>
						</tr>
						</thead>
						
						<%-- Parcours de la Map des pilotes en session, et utilisation de l'objet varStatus. --%>
						<c:forEach items="${ sessionScope.pilotes }" var="mapPilotes"
							varStatus="boucle">
							<%-- Simple test de parit� sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>
							<tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">
								<%-- Affichage des propri�t�s du bean Client, qui est stock� en tant que valeur de l'entr�e courante de la map --%>
								<td><c:out value="${ mapPilotes.value.nom }" /></td>
								<td><c:out value="${ mapPilotes.value.prenom }" /></td>
								<td><c:out value="${ mapPilotes.value.nationalite }" /></td>

								<%-- Lien vers la servlet de suppression, avec passage du nom du pilote - c'est-�-dire la cl� de la Map - en param�tre gr�ce � la balise <c:param/>. --%>
								<td class="action"><a
									href="<c:url value="/suppressionPilote"><c:param name="nomPilote" value="${ mapPilotes.key }" /></c:url>">
										<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								</a></td>
							</tr>
						</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div></div>
</body>
</html>