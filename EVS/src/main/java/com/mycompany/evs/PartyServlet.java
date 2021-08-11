package com.mycompany.evs;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
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

public class PartyServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String control = request.getParameter("action");
            if (control.equals("register")) {
                registerParty(request, response);
            } else if (control.equals("remove")) {
                removeParty(request, response);
            }
            response.sendRedirect("Parties.jsp");    //returns to Parties page
        } catch (SQLException ex) {
            response.getWriter().println(ex.toString());
        }
    }

    private void registerParty(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String name = request.getParameter("name");
        String leader = request.getParameter("leader");
        String symbolName = request.getParameter("symbolName");
        int id = DbQuery.getPartyID();

        InputStream inputStream = null;
        Part imagePart = request.getPart("symbol");

        if (imagePart != null) {
            inputStream = imagePart.getInputStream();
            Party party = new Party(id, name, leader, inputStream, symbolName);
            DbQuery.registerParty(party);
        }
    }

    private void removeParty(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        DbQuery.removeParty(request.getParameter("party"));
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
