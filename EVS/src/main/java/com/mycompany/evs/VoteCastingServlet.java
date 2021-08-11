package com.mycompany.evs;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
/**
 *
 * @author Binary Beats
 */
public class VoteCastingServlet extends HttpServlet {

    String destinationPage; //next webpage

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            RequestDispatcher requestDispatcher;

            int naPartyID = Integer.parseInt(request.getParameter("N"));
            int paPartyID = Integer.parseInt(request.getParameter("P"));
            String NAconst = request.getParameter("naConstituency");
            String PAconst = request.getParameter("paConstituency");
            String cnic = request.getParameter("cnic");
            
            Candidature naCandidature = new Candidature(NAconst, naPartyID);
            Candidature paCandidature = new Candidature(PAconst, paPartyID);
            
            DbQuery.castVote(naCandidature);
            DbQuery.castVote(paCandidature);
            //DbQuery.updateStatus(cnic, naPartyID, NAconst, paPartyID, PAconst);
            
            PrintWriter out = response.getWriter();
            out.println("Your vote has been successfully cast");
//            destinationPage = "BiometricVerification.jsp";
//            requestDispatcher = request.getRequestDispatcher(destinationPage);
//            requestDispatcher.forward(request, response);

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
