package com.mycompany.evs;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Binary Beats
 */
public class BiometricVerificationServlet extends HttpServlet {

    String destinationPage; //next webpage

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");

            RequestDispatcher requestDispatcher;
            String cnic = request.getParameter("cnic");

            //biometric verification
            Voter voter = DbQuery.biometricVerify(cnic);
            System.out.println(cnic);
            if (voter != null) {
                Boolean hasVoted = DbQuery.hasVoted(voter);
                if (!(hasVoted)) {
                    request.setAttribute("voter", voter);
                    destinationPage = "VoteCasting.jsp";
                    
                } else {
                    HttpSession session = request.getSession();
                    String msg = "The voter has already voted";
                    session.setAttribute("error", msg);
                    destinationPage = "BiometricVerification.jsp";
                }
            } else {
                HttpSession session = request.getSession();
                String msg = "Username and the fingerprint do not match";
                session.setAttribute("error", msg);
                destinationPage = "BiometricVerification.jsp";
            }
            
            System.out.println(destinationPage);
            requestDispatcher = request.getRequestDispatcher(destinationPage);
            requestDispatcher.forward(request, response);

        } catch (SQLException ex) {
            System.out.println(ex.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
