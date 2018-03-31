<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />

<title>Affichage d'une team</title>

</head>
<body>
	<%-- Affichage de la chaîne "message" transmise par la servlet --%>
	<%-- <c:if test="${ form.chkErreur == true }"><div class="alert alert-success  role="alert"><p ><span class="glyphicon glyphicon-thumbs-up" ></span>
	${ form.resultat }
	</p>
	</div></c:if> --%>
	${ form.resultat }
	
	<%-- Puis affichage des données enregistrées dans le bean "client" transmis par la servlet --%>
	<div class="jumbotron">
	<p>Nom : ${ team.pilote.nom }</p>
	<p>Prénom : ${ team.pilote.prenom }</p>
	<p>Nationalité : ${ team.pilote.nationalite }</p>
	
	<p>Nom de l'équipe : ${ team.nomTeam }</p>
	<p>Motoriste : ${ team.motTeam }</p>
	<p>Siège Social : ${ team.siegeS }</p>
	<p>Directeur : ${ team.directeur }</p>
	</div>
<a href="creationTeam"><button type="button" class="btn btn-primary">Retour</button></a>
	<c:import url="/inc/footer.jsp" />