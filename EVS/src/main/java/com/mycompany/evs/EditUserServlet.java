package com.mycompany.evs;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sana Zehra
 */
public class EditUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String control = request.getParameter("action");    //indication of form
        String clearAll = request.getParameter("clearAll");

        try {
            if (clearAll != null) {
                if (clearAll.equals("clearPollingOfficers")) {
                    DbQuery.clearPollingOfficers();
                    response.sendRedirect("PollingOfficers.jsp");
                    
                } else if (clearAll.equals("clearReturningOfficers")) {
                    DbQuery.clearReturningOfficers();
                    response.sendRedirect("ReturningOfficers.jsp");
                }
                
            } else {
                if (control.equals("register")) {
                    registerUser(request, response);    //calls register method
                    
                } else if (control.equals("remove")) {
                    removeUser(request, response);  //calls remove method
                    
                }
                response.sendRedirect(request.getParameter("returnDestination"));    //returns to Constituencies page
            }
            
            
        }catch (SQLException ex) {
            response.getWriter().println(ex.toString());
        }
    }
    
    
    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String cnic = request.getParameter("cnic");
        String name = request.getParameter("name");
        String usernameId = request.getParameter("username");
        String pwd = request.getParameter("password");
        String type = request.getParameter("type");

        User user = new User(name, cnic, usernameId, type, pwd);
        DbQuery.registerUser(user);
    }

    private void removeUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String cnic = request.getParameter("cnic");
            DbQuery.removeUser(cnic);

        } catch (SQLException ex) {
            response.getWriter().println(ex.toString());
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
