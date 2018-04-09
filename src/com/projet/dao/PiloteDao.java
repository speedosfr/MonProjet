package com.projet.dao;

import java.util.List;

import com.projet.beans.Pilote;


public interface PiloteDao {
    void ajouter( Pilote pilote );
    List<Pilote> lister();
    void supprimer(int id);
   void chkDbl(Pilote pilote);
}