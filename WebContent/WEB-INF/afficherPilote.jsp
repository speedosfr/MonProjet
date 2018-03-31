<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />

<title>Affichage d'un pilote</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />

</head>
<body>
	<%-- Affichage de la chaîne "resultat" transmise par le form(modele) --%>
	
	
    <c:if test="${ form.chkErreur == true }"><div class="alert alert-success" role="alert">
    <p ><span class="glyphicon glyphicon-thumbs-up" ></span> ${ form.resultat }</p>
	</div></c:if>
   

	<%-- Puis affichage des données enregistrées dans le bean "client" transmis par la servlet --%>
	<div class="jumbotron">
	<p>Nom : ${ pilote.nom }</p>
	<p>Prénom : ${ pilote.prenom }</p>
	<p>Nationalité : ${ pilote.nationalite }</p>
	</div>
<a href="creationPilote"><button type="button" class="btn btn-primary">Retour</button></a>

	<c:import url="/inc/footer.jsp" />