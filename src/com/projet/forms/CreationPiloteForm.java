package com.projet.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.projet.beans.Pilote;

public class CreationPiloteForm {
	
	public static final String CHAMP_NOM       		= "nomPilote";
	public static final String CHAMP_PRENOM     	= "prenomPilote";
	public static final String CHAMP_NATIONALITE    = "nationalite";
	
	private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();
    private boolean chkErreur;

    public boolean isChkErreur() {
		return chkErreur;
	}

	public void setChkErreur(boolean chkErreur) {
		this.chkErreur = chkErreur;
	}

	public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }
    
    public Pilote creerPilote(HttpServletRequest request) {
    	
    	String nom 			= request.getParameter(CHAMP_NOM);
		String prenom 		= request.getParameter(CHAMP_PRENOM);
		String nationalite 	= request.getParameter(CHAMP_NATIONALITE);
		
		
		 Pilote pilote = new Pilote();

	        try {
	            validationNom( nom );
	        } catch ( Exception e ) {
	            setErreur( CHAMP_NOM, e.getMessage() );
	        }
	        pilote.setNom( nom );

	        try {
	            validationPrenom( prenom );
	        } catch ( Exception e ) {
	            setErreur( CHAMP_PRENOM, e.getMessage() );
	        }
	        pilote.setPrenom( prenom );

	        try {
	            validationNationalite( nationalite );
	        } catch ( Exception e ) {
	            setErreur( CHAMP_NATIONALITE, e.getMessage() );
	        }
	        pilote.setNationalite( nationalite );

	        

	        if ( erreurs.isEmpty() ) {
	            resultat = "Succès de la création du pilote.";
	            chkErreur = true;
	        } else {
	            resultat = "Échec de la création du pilote.";
	            chkErreur = false;
	        }
	        
		return pilote;
    }
    private void validationNom( String nom ) throws Exception {
        if ( nom != null ) {
            if ( nom.length() < 2 ) {
                throw new Exception( "Le nom du pilote doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer un nom pour le pilote." );
        }
    }

    private void validationPrenom( String prenom ) throws Exception {
        if ( prenom != null && prenom.length() < 2 ) {
            throw new Exception( "Le prénom du pilote doit contenir au moins 2 caractères." );
        }
    }

    private void validationNationalite( String nationalite ) throws Exception {
        if ( nationalite != null ) {
            if ( nationalite.length() < 2 ) {
                throw new Exception( "La nationalité doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer une nationalité." );
        }
    }   

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}
