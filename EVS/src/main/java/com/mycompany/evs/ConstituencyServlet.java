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

/**
 *
 * @author Team
 */
public class ConstituencyServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String control = request.getParameter("action");    //indication of form
            if (control.equals("register")) {   
                registerConstituency(request, response);    //calls register method    

            } else if (control.equals("remove")) {
                removeConstituency(request, response);  //calls remove method
            }
            response.sendRedirect("Constituencies.jsp");    //returns to Constituencies page
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConstituencyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registerConstituency(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, IOException {
        String type = request.getParameter("regConstituencyType");
        String num = request.getParameter("constituencyNo");
        String district = request.getParameter("district");
        String province = request.getParameter("province");
        String id;

        try {
            validateConst(type, province, request, response);
            id = getConstID(type, num, province);
            Constituency constituency = new Constituency(id, type, district, province);
            DbQuery.registerConstituency(constituency);

        } catch (ServletException | IOException | SQLException ex) {
            response.getWriter().println(ex.toString());
        }
    }

    private void removeConstituency(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, ClassNotFoundException, IOException {
        String type = request.getParameter("constituencyType");
        String num = request.getParameter("constituencyNo");
        String province = request.getParameter("province");
        String id;

        try {
            validateConst(type, province, request, response);
            id = getConstID(type, num, province);
            DbQuery.removeConstituency(id);

        } catch (IOException ex) {
            response.getWriter().println(ex.toString());
        }
    }

    private void validateConst(String type, String province, HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        //validate no provincial constituency for Capital
        if (type.equals("P") && (province.equals("Capital"))) {
            RequestDispatcher requestDispatcher;
            request.setAttribute("msg", "Invalid province for the Constituency Type");
            requestDispatcher = request.getRequestDispatcher("editConstituency.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private String getConstID(String type, String num, String province) {
        //gets constituency id from the provided details
        String id;
        if (type.equals("N")) {
            id = type + "A" + num;
        } else {
            id = type + province.charAt(0) + num;
        }
        return id;
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
