package com.projet.dao;

import java.util.List;

import com.projet.beans.Team;

public interface TeamDao {
	
    void creer( Team team ) throws DAOException;

    Team trouver( long id ) throws DAOException;

    List<Team> lister() throws DAOException;

    void supprimer( Team team ) throws DAOException;
}
