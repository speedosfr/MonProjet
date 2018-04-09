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
import com.projet.dao.DaoFactory;
import com.projet.dao.PiloteDao;

public class SuppressionPilote extends HttpServlet {

    public static final String ID_PILOTE = "id_pilote";
    public static final String SESSION_PILOTES  = "pilotes";

    public static final String VUE              = "/listePilotes";
    
    private PiloteDao piloteDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.piloteDao = daoFactory.getPiloteDao();
    }


    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
       
    	int id =  Integer.parseInt(request.getParameter("id_pilote"));
    	piloteDao.supprimer(id);
    	
    	//request.setAttribute("pilotes", piloteDao.lister());

    	
        /* Redirection vers la fiche récapitulative */
        response.sendRedirect( request.getContextPath() + VUE );
    }

   
}