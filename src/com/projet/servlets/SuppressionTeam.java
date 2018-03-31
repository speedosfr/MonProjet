package com.projet.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projet.beans.Team;

public class SuppressionTeam extends HttpServlet {

    public static final String PARAM_DATE_TEAM = "dateTeam";
    public static final String SESSION_TEAMS   = "teams";

    public static final String VUE                 = "/listeTeams";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Récupération du paramètre */
        String dateTeam = getValeurParametre( request, PARAM_DATE_TEAM );

        /* Récupération de la Map des commandes enregistrées en session */
        HttpSession session = request.getSession();
        Map<String, Team> teams = (HashMap<String, Team>) session.getAttribute( SESSION_TEAMS );

        /* Si la date de la commande et la Map des commandes ne sont pas vides */
        if ( dateTeam != null && teams != null ) {
            /* Alors suppression de la commande de la Map */
            teams.remove( dateTeam );
            /* Et remplacement de l'ancienne Map en session par la nouvelle */
            session.setAttribute( SESSION_TEAMS, teams );
        }

        /* Redirection vers la fiche récapitulative */
        response.sendRedirect( request.getContextPath() + VUE );
    }

    /*
     * Méthode utilitaire qui retourne null si un paramètre est vide, et son
     * contenu sinon.
     */
    private static String getValeurParametre( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}