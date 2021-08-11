package com.mycompany.evs;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Binary Beats
 */
@MultipartConfig
public class CandidateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String control = request.getParameter("action");
        String clearAll = request.getParameter("clearAll");

        try {
            if (clearAll != null) {
                DbQuery.clearCandidates();
            } else {
                if (control.equals("register")) {
                    registerCandidate(request, response);
                } else if (control.equals("remove")) {
                    removeCandidate(request, response);
                }
            }
            response.sendRedirect("Candidates.jsp");
            
        } catch (ClassNotFoundException ex) {
            response.getWriter().println(ex.toString());
        } catch (SQLException ex) {
            Logger.getLogger(CandidateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registerCandidate(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException,
            ClassNotFoundException {

        try {
            String cnic = request.getParameter("cnic");
            String name = request.getParameter("name");
            String dob = request.getParameter("DOB");
            String gender = request.getParameter("gender");
            String party = request.getParameter("party");
            int partyID = Integer.parseInt(party);
            String constID = request.getParameter("constituencyID");

            InputStream photoStream = null;
            Part filePart = request.getPart("photo");

            if (filePart != null) {
                photoStream = filePart.getInputStream();
                Candidate candidate = new Candidate(cnic, name, gender, dob, photoStream, partyID);
                Candidature candidature = new Candidature(cnic, constID, partyID);
                DbQuery.registerCandidate(candidate, candidature);
            }

        } catch (SQLException ex) {
            response.getWriter().println(ex.toString());
        }

    }

    private void removeCandidate(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String cnic = request.getParameter("cnic");
        DbQuery.removeCandidate(cnic);
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
    }

}
