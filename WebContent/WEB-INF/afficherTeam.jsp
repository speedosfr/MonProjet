<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />

<title>Affichage d'une team</title>

</head>
<body>
	<%-- Affichage de la cha�ne "message" transmise par la servlet --%>
	<%-- <c:if test="${ form.chkErreur == true }"><div class="alert alert-success  role="alert"><p ><span class="glyphicon glyphicon-thumbs-up" ></span>
	${ form.resultat }
	</p>
	</div></c:if> --%>
	${ form.resultat }
	
	<%-- Puis affichage des donn�es enregistr�es dans le bean "client" transmis par la servlet --%>
	<div class="jumbotron">
	<p>Nom : ${ team.pilote.nom }</p>
	<p>Pr�nom : ${ team.pilote.prenom }</p>
	<p>Nationalit� : ${ team.pilote.nationalite }</p>
	
	<p>Nom de l'�quipe : ${ team.nomTeam }</p>
	<p>Motoriste : ${ team.motTeam }</p>
	<p>Si�ge Social : ${ team.siegeS }</p>
	<p>Directeur : ${ team.directeur }</p>
	</div>
<a href="creationTeam"><button type="button" class="btn btn-primary">Retour</button></a>
	<c:import url="/inc/footer.jsp" />