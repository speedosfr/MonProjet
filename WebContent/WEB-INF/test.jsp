<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/inc/header.jsp" />

<title>Affichage d'un pilote</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />

</head>
<body>
 <ul>
        <c:forEach var="pilote" items="${ pilotes }">
            <li><c:out value="${ pilote.prenom }" /> <c:out value="${ pilote.nom }" /></li>
        </c:forEach>
    </ul>    

	<c:import url="/inc/footer.jsp" />