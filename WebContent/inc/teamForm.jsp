<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
			
	<div class="form-group">
		<div class="row">
			<label for="nomTeam">Nom de l'équipe </label>
			 <input type="text" id="nomTeam" class="form-control col-lg-2"
						name="nomTeam" value="<c:out value="${team.nomTeam}"/>" size="20" maxlength="20" />
				</div>
				<span class="erreur">${form.erreurs['nomTeam']}</span>
			</div>

			<div class="form-group">
				<div class="row">
					<label for="motorTeam">Motoriste </label>
					<input type="text" id="motTeam" class="form-control col-lg-2"
						name="motTeam" value="<c:out value="${team.motTeam}"/>" size="20" maxlength="20" />
				</div>
				
				<span class="erreur">${form.erreurs['motTeam']}</span>
			</div>

			<div class="form-group">
				<div class="row">
					<label for="siegeS">Siege social </span>
					</label> <input type="text" id="siegeS" class="form-control col-lg-2"
						name="siegeS" value="<c:out value="${team.siegeS}"/>" size="20" maxlength="20" />
				</div>
				<span class="erreur">${form.erreurs['siegeS']}</span>
			</div>

			<div class="form-group">
				<div class="row">
					<label for="directeur">Directeur </span>
					</label> <input type="text" id="directeur" class="form-control col-lg-2"
						name="directeur" value="<c:out value="${team.directeur}"/>" size="20" maxlength="20" />
				</div>
				<span class="erreur">${form.erreurs['directeur']}</span>
			</div>

			