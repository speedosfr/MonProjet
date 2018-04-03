<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />
<div class="formPilote col-lg-12 col-lg-offset-1">
	
	<title>Création Pilote</title>
	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />
	</head>
	<body>
		
	<form method="post" action="<c:url value="/creationPilote"/>">
				<c:import url="/inc/piloteForm.jsp" />
		
		 <c:if test="${ form.chkErreur == false }"><div class="alert alert-danger" role="alert"><p >${ form.resultat }</p>
	</div></c:if>
		
<div class="row"><div class ="bouton col-lg-offset-2">
		<input type="submit" class="btn btn-info " value="Valider" />
		<input type="reset" class="btn btn-warning " value="Remettre à zéro" />
</div></div>
	</form>
</div>
</div>
</div>
<c:import url="/inc/footer.jsp" />