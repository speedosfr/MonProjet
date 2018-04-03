package com.projet.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.projet.beans.Pilote;
import com.projet.beans.Team;

public final class CreationTeamForm {
	
	
    private static final String CHAMP_CHOIX_PILOTE     = "choixNouveauPilote";
    private static final String CHAMP_LISTE_PILOTES    = "listePilotes";
   
    private static final String CHAMP_NOM          	   = "nomTeam";
    private static final String CHAMP_MOTOR   		   = "motTeam";
    private static final String CHAMP_SIEGE 		   = "siegeS";
    private static final String CHAMP_DIRECTEUR   	   = "directeur";
    
    private static final String ANCIEN_PILOTE          = "ancienPilote";
    private static final String SESSION_PILOTES        = "pilotes";
    
    private static final String FORMAT_DATE            = "dd/MM/yyyy HH:mm:ss";
    
    private boolean chkErreur;
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public boolean getchkErreur() {
    	return chkErreur;
    }
    
    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Team creerTeam( HttpServletRequest request ) {
    	
    System.out.println("je suis dans CreationTeamForm");
    
        Pilote pilote;
        /*
         * Si l'utilisateur choisit un client déjà existant, pas de validation à
         * effectuer
         */
        String choixNouveauPilote = getValeurChamp( request, CHAMP_CHOIX_PILOTE );
        if ( ANCIEN_PILOTE.equals( choixNouveauPilote ) ) {
            /* Récupération du nom du client choisi */
            String nomAncienPilote = getValeurChamp( request, CHAMP_LISTE_PILOTES );
            /* Récupération de l'objet client correspondant dans la session */
            HttpSession session = request.getSession();
            pilote = ( (Map<String, Pilote>) session.getAttribute( SESSION_PILOTES ) ).get( nomAncienPilote );
        } else {
            /*
             * Sinon on garde l'ancien mode, pour la validation des champs.
             * 
             * L'objet métier pour valider la création d'un client existe déjà,
             * il est donc déconseillé de dupliquer ici son contenu ! À la
             * place, il suffit de passer la requête courante à l'objet métier
             * existant et de récupérer l'objet Client créé.
             */
            CreationPiloteForm piloteForm = new CreationPiloteForm();
            pilote = piloteForm.creerPilote( request );

            /*
             * Et très important, il ne faut pas oublier de récupérer le contenu
             * de la map d'erreur créée par l'objet métier CreationClientForm
             * dans la map d'erreurs courante, actuellement vide.
             */
            erreurs = piloteForm.getErreurs();
        }

        /*
         * Ensuite, il suffit de procéder normalement avec le reste des champs
         * spécifiques à une commande.
         */

        /*
         * Récupération et conversion de la date en String selon le format
         * choisi.
         */
        DateTime dt = new DateTime();
        DateTimeFormatter formatter = DateTimeFormat.forPattern( FORMAT_DATE );
        String date = dt.toString( formatter );

        String nom = getValeurChamp( request, CHAMP_NOM );
        String motor = getValeurChamp( request, CHAMP_MOTOR );
        String siege = getValeurChamp( request, CHAMP_SIEGE );
        String directeur = getValeurChamp( request, CHAMP_DIRECTEUR );
    

        Team team = new Team();

        team.setPilote( pilote );

       
        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( CHAMP_NOM, e.getMessage() );
        }
        team.setNomTeam( nom );

        team.setDate( date );

        try {
            validationMotor( motor );
        } catch ( Exception e ) {
            setErreur( CHAMP_MOTOR, e.getMessage() );
        }
        team.setMotTeam( motor );

        try {
            validationSiege( siege );
        } catch ( Exception e ) {
            setErreur( CHAMP_SIEGE, e.getMessage() );
        }
        team.setSiegeS( siege );

        try {
            validationDirecteur( directeur );
        } catch ( Exception e ) {
            setErreur( CHAMP_DIRECTEUR, e.getMessage() );
        }
        team.setDirecteur( directeur );

       

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de la création de la Team.";
            chkErreur = true;
        } else {
            resultat = "Échec de la création de la Team.";
            chkErreur = false;
        }
        return team;
    }

    private void validationNom( String nom ) throws Exception {
        if ( nom != null ) {
            if ( nom.length() < 2 ) {
                throw new Exception( "Le nom doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer un nom." );
        }
    }

    private void validationMotor( String motor ) throws Exception {
        if ( motor != null ) {
            if ( motor.length() < 2 ) {
                throw new Exception( "Le motoriste doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer un motoriste." );
        }
    }

    private void validationSiege( String siege ) throws Exception {
        if ( siege != null && siege.length() < 2 ) {
            throw new Exception( "Le siege social doit contenir au moins 2 caractères." );
        }
    }

    private void validationDirecteur( String directeur ) throws Exception {
        if ( directeur != null ) {
            if ( directeur.length() < 2 ) {
                throw new Exception( "Le nom du Directeur doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer le nom d'un Directeur." );
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