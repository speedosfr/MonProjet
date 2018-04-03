<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<div class="helmet  col-lg-offset-4">			
				<img src="inc/img/helmet.gif" class="img-rounded" style="width:40%" />
			</div>
		
				<legend>Creation Pilote</legend>

		<div class="row">
			<div class="messageP col-lg-10 col-lg-offset-1">
				<div class="alert alert-warning">* Tous les champs doivent etre remplis</div>
			</div>
		</div>

		<div class="form-group">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<label for="nomPilote">Nom </label> <input type="text"
						id="nomPilote" class="form-control" name="nomPilote"
						value="<c:out value="${pilote.nom}"/>" size="20" maxlength="20" />
				</div>
			</div>
			<span class="erreur">${form.erreurs['nomPilote']}</span>
		</div>


		<div class="form-group">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<label for="prenomPilote">Prénom </label> <input type="text"
						id="prenomPilote" class="form-control col-lg-2"
						name="prenomPilote" value="<c:out value="${pilote.prenom}"/>"
						size="20" maxlength="20" />
				</div>
			</div>
			<span class="erreur">${form.erreurs['prenomPilote']}</span>
		</div>


		<div class="form-group">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1">
					<label for="nationalite">Nationalité </label> <input type="text"
						id="nationalite" class="form-control col-lg-2" name="nationalite"
						value="<c:out value="${pilote.nationalite}"/>" size="20"
						maxlength="20" />
				</div>
			</div>
			<span class="erreur">${form.erreurs['nationalite']}</span>
		</div>