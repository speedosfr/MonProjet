<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">TEAM F1</a>
    </div>
    <ul class="nav navbar-nav">
      <li class =<c:out value="${ accueilEtat }" />  ><a href="accueil">ACCUEIL</a></li>
      <li class =<c:out value="${ etat }" />  class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#" > PILOTES <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listePilotes">Afficher les pilotes</a></li>
          <li><a href="creationPilote">Créer un pilote</a></li>          
        </ul>
      </li>
      
      <li class =<c:out value="${ teamEtat }" /> class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">TEAM <span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="listeTeams">Afficher les teams</a></li>
      <li><a href="creationTeam">Créer une team</a></li>
    </ul>
    </li>
</ul>
  
  <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    </div>
</nav> 

