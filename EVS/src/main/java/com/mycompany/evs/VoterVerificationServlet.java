package com.mycompany.evs;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VoterVerificationServlet extends HttpServlet {

    String destinationPage; //next webpage

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String cnic = request.getParameter("cnic"); //received from verification form on home page
        Voter voter;
        
        try {
            voter = DbQuery.checkVoterVerification(cnic);
            if (voter != null) {
                request.setAttribute("voter", voter);
                destinationPage = "VoterVerification.jsp";  // display voter profile
            } else {
                HttpSession session = request.getSession();
                String msg = "This CNIC number is not registered with our system";
                session.setAttribute("error1", msg);
                destinationPage = "home.jsp";
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(destinationPage);
            requestDispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException exc) {
            response.getWriter().println(exc.toString());
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
    }
}
