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

public class SuppressionPilote extends HttpServlet {

    public static final String PARAM_NOM_PILOTE = "nomPilote";
    public static final String SESSION_PILOTES  = "pilotes";

    public static final String VUE              = "/listePilotes";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* Récupération du paramètre */
        String nomPilote = getValeurParametre( request, PARAM_NOM_PILOTE );

        /* Récupération de la Map des clients enregistrés en session */
        HttpSession session = request.getSession();
        Map<String, Pilote> pilotes = (HashMap<String, Pilote>) session.getAttribute( SESSION_PILOTES );

        /* Si le nom du client et la Map des clients ne sont pas vides */
        if ( nomPilote != null && pilotes != null ) {
            /* Alors suppression du client de la Map */
            pilotes.remove( nomPilote );
            /* Et remplacement de l'ancienne Map en session par la nouvelle */
            session.setAttribute( SESSION_PILOTES, pilotes );
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