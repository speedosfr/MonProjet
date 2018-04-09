package com.projet.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projet.dao.DaoFactory;
import com.projet.dao.PiloteDao;

public class ListePilotes extends HttpServlet {
	
    public static final String ATT_PILOTE = "pilote";
    public static final String ATT_FORM   = "form";

    public static final String VUE        = "/WEB-INF/listerPilotes.jsp";
    
    private PiloteDao piloteDao;

    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.piloteDao = daoFactory.getPiloteDao();
        
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* À la réception d'une requête GET, affichage de la liste des clients */
    	request.setAttribute("pilotes", piloteDao.lister());
        this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
}