package com.projet.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.projet.beans.Pilote;

public class PiloteDaoImpl implements PiloteDao {
	private DaoFactory daoFactory;

	PiloteDaoImpl(DaoFactory daoFactory) {
		this.daoFactory = daoFactory;
	}

	@Override
	public void chkDbl(Pilote pilote) {
		boolean dbl;
		
		do {
			dbl = true;
			List<Pilote> pilotes = lister();

			for (Pilote p : pilotes) {
				if (pilote.getNom().equals(p.getNom()) && pilote.getPrenom().equals(p.getPrenom())
						&& pilote.getNationalite().equals(p.getNationalite())) {

					System.out.println("Le pilote existe déja ! " + dbl);
					dbl = true;

				} else {
					System.out.println("le pilote n existe pas " + dbl);
					dbl = false;
				}
			}
		} while (dbl = false);

	}

	@Override
	public void ajouter(Pilote pilote) {
System.out.println("Le Pilote n est pas present dans la liste , je peux donc l inserer dans la BDD");
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion
					.prepareStatement("INSERT INTO pilote(nom, prenom, nationalite) VALUES(?, ?, ?);");
			preparedStatement.setString(1, pilote.getNom());
			preparedStatement.setString(2, pilote.getPrenom());
			preparedStatement.setString(3, pilote.getNationalite());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("Et bimmm c est ajouté ! ");
	}

	@Override
	public List<Pilote> lister() {

		List<Pilote> pilotes = new ArrayList<Pilote>();

		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;

		try {
			connexion = daoFactory.getConnection();
			statement = connexion.createStatement();
			resultat = statement.executeQuery("SELECT id_pilote, nom, prenom , nationalite FROM pilote;");

			while (resultat.next()) {
				int id = resultat.getInt("id_pilote");
				String nom = resultat.getString("nom");
				String prenom = resultat.getString("prenom");
				String nationalite = resultat.getString("nationalite");

				Pilote pilote = new Pilote();
				pilote.setId(id);
				pilote.setNom(nom);
				pilote.setPrenom(prenom);
				pilote.setNationalite(nationalite);

				pilotes.add(pilote);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pilotes;
	}

	@Override

	public void supprimer(int id) {
		System.out.println("Je suis dans la methode supprimer" + id);
		Connection connexion = null;
		PreparedStatement preparedStatement = null;

		try {
			connexion = daoFactory.getConnection();
			preparedStatement = connexion.prepareStatement("DELETE FROM pilote WHERE id_pilote = (?);");
			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
