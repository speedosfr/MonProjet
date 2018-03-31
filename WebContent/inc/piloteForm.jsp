
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<legend>Creation Pilote</legend>
	<div class="alert alert-warning">Tous les champs sont obligatares</div>

	<div class="form-group">
		<div class="row">
			<label for="nomPilote">Nom </label>
			 <input type="text" id="nomPilote" class="form-control col-lg-2" name="nomPilote"
				value="<c:out value="${pilote.nom}"/>" size="20" maxlength="20" />
		</div>
		<span class="erreur">${form.erreurs['nomPilote']}</span>
	</div>
	
	
	<div class="form-group">
		<div class="row">
			<label for="prenomPilote">Prénom </label> <input type="text"
				id="prenomPilote" class="form-control col-lg-2" name="prenomPilote"
				value="<c:out value="${pilote.prenom}"/>" size="20" maxlength="20" />
		</div>
		<span class="erreur">${form.erreurs['prenomPilote']}</span>
	</div>
	<div class="form-group">
		<div class="row">
			<label for="nationalite">Nationalité </label> <input type="text"
				id="nationalite" class="form-control col-lg-2" name="nationalite"
				value="<c:out value="${pilote.nationalite}"/>" size="20"
				maxlength="20" />
		</div>
		<span class="erreur">${form.erreurs['nationalite']}</span>
	</div>

	