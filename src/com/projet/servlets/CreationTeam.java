package com.projet.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projet.beans.Pilote;
import com.projet.beans.Team;
import com.projet.forms.CreationTeamForm;

public class CreationTeam extends HttpServlet {
	
    public static final String ATT_TEAM          = "team";
    public static final String ATT_FORM          = "form";
    public static final String SESSION_PILOTES   = "pilotes";
    public static final String SESSION_TEAMS     = "teams";

    public static final String VUE_SUCCES        = "/WEB-INF/listerTeam.jsp";
    public static final String VUE_FORM          = "/WEB-INF/creerTeam.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* À la réception d'une requête GET, simple affichage du formulaire */
        this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Préparation de l'objet formulaire */
        CreationTeamForm form = new CreationTeamForm();

        /* Traitement de la requête et récupération du bean en résultant */
        Team team = form.creerTeam( request );

        /* Ajout du bean et de l'objet métier à l'objet requête */
        request.setAttribute( ATT_TEAM, team );
        request.setAttribute( ATT_FORM, form );

        /* Si aucune erreur */
        if ( form.getErreurs().isEmpty() ) {
            /* Alors récupération de la map des clients dans la session */
            HttpSession session = request.getSession();
            Map<String, Pilote> pilotes = (HashMap<String, Pilote>) session.getAttribute( SESSION_PILOTES );
            /* Si aucune map n'existe, alors initialisation d'une nouvelle map */
            if ( pilotes == null ) {
                pilotes = new HashMap<String, Pilote>();
            }
            /* Puis ajout du client de la commande courante dans la map */
            pilotes.put( team.getPilote().getNom(), team.getPilote() );
            /* Et enfin (ré)enregistrement de la map en session */
            session.setAttribute( SESSION_PILOTES, pilotes );
 
            /* Ensuite récupération de la map des commandes dans la session */
            Map<String, Team> teams = (HashMap<String, Team>) session.getAttribute( SESSION_TEAMS );
            /* Si aucune map n'existe, alors initialisation d'une nouvelle map */
            if ( teams == null ) {
                teams = new HashMap<String, Team>();
            }
            /* Puis ajout de la commande courante dans la map */
            teams.put( team.getDate(), team );
            /* Et enfin (ré)enregistrement de la map en session */
            session.setAttribute( SESSION_TEAMS, teams );

            /* Affichage de la fiche récapitulative */
            this.getServletContext().getRequestDispatcher( VUE_SUCCES ).forward( request, response );
        } else {
            /* Sinon, ré-affichage du formulaire de création avec les erreurs */
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        }
    }
}