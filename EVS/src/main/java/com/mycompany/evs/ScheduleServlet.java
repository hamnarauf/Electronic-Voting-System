package com.mycompany.evs;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Binary Beats
 */
public class ScheduleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("schedule");
        String act = request.getParameter("edit");
        boolean fileExists = ScheduleXML.fileExist();

        if (action != null) {
            if (fileExists) {
                String[] schedule = ScheduleXML.getSchedule();
                displaySchedule(request, response, schedule, action);
            } else {
                ScheduleXML.editSchedule("XXXX-XX-XX", "XX:XX", "XX:XX", "XX:XX");
                String[] schedule = ScheduleXML.getSchedule();
                displaySchedule(request, response, schedule, action);
            }
        } else {
            String date = request.getParameter("electionDay");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");
            String resultTime = request.getParameter("resultTime");
            ScheduleXML.editSchedule(date, startTime, endTime, resultTime);
            String[] schedule = ScheduleXML.getSchedule();
            displaySchedule(request, response, schedule, action);
        }
    }

    public static void displaySchedule(HttpServletRequest request, HttpServletResponse response, String[] schedule, String action)
            throws ServletException, IOException {

        String destinationPage = null;
        request.setAttribute("date", schedule[0]);
        request.setAttribute("start", schedule[1]);
        request.setAttribute("end", schedule[2]);
        request.setAttribute("result", schedule[3]);

        RequestDispatcher requestDispatcher;
        if (null == action) {
            destinationPage = "ElectionSchedule.jsp";
        } else switch (action) {
            case "normal":
                destinationPage = "Schedule.jsp";
                break;
            case "confidential":
                destinationPage = "ElectionSchedule.jsp";
                break;
            default:
                break;
        }
        requestDispatcher = request.getRequestDispatcher(destinationPage);
        requestDispatcher.forward(request, response);
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
