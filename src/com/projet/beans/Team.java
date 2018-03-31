package com.projet.beans;

import java.sql.Date;
import java.util.ArrayList;

public class Team {
	
	private Pilote pilote;	
	private String nomTeam;
	private String motTeam;
	private String siegeS;
	private String directeur;
	private String date;
	
	//ArrayList pilote = new ArrayList();
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Pilote getPilote() {
		return pilote;
	}
	public void setPilote(Pilote pilote) {
		this.pilote = pilote;
	}
	 
	public String getNomTeam() {
		return nomTeam;
	}
	public void setNomTeam(String nomTeam) {
		this.nomTeam = nomTeam;
	}
	public String getMotTeam() {
		return motTeam;
	}
	public void setMotTeam(String motTeam) {
		this.motTeam = motTeam;
	}
	public String getSiegeS() {
		return siegeS;
	}
	public void setSiegeS(String siegeS) {
		this.siegeS = siegeS;
	}
	public String getDirecteur() {
		return directeur;
	}
	public void setDirecteur(String directeur) {
		this.directeur = directeur;
	}
	
	
	

}
