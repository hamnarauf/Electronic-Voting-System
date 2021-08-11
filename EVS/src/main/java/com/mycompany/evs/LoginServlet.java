package com.mycompany.evs;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    String destinationPage; //next webpage

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //received from login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("userType");

        User user;
        RequestDispatcher requestDispatcher;

        try {
            user = DbQuery.checkLoginDetails(username, password, type);
            String msg;
            
            if (user != null) {  //valid credentials
                HttpSession session = request.getSession(); //session for each logged in user
                session.setAttribute("username", username); //setting username as session attribute
                session.setAttribute("password", password); //setting password as session attribute
                session.setAttribute("type", type); //setting type as session attribute

                request.setAttribute("name", user.getUserName());
                request.setAttribute("cnic", user.getUserCNIC());
                msg = null;
                
                switch (type) {
                    case "ECP":
                        destinationPage = "ECP.jsp";    //ECP homepage
                        break;
                    case "Returning Officer":
                        destinationPage = "RO.jsp";     //Returning Officer homepage
                        break;
                    case "Polling Officer":
                        destinationPage = "BiometricVerification.jsp";     //Polling Officer homepage
                        break;
                }

            } else {   //invalid credentials
                HttpSession session = request.getSession();
                msg = "Invalid Username or Password";
                session.setAttribute("error2", msg);   //error message
                destinationPage = "home.jsp";   //Login page
            }
            
            requestDispatcher = request.getRequestDispatcher(destinationPage);
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
        return "Manages User-Login i.e. ECP, Returning Officer, Polling Officer";
    }
}
