<%-- 
    Document   : PollingOfficers
    Created on : May 22, 2021, 3:16:50 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.DbQuery" %>
<%@page import = "com.mycompany.evs.User" %>

<!DOCTYPE html>
<html>
    <%

        //list for retreiving data from data base
        ArrayList<User> pollingOfficers = new ArrayList<User>();
        pollingOfficers = DbQuery.getPollingOfficersList();
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Polling Officers</title>

        <!--css-->
        <!--boostrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

    </head>
    <style type= "text/css">
        h1{
            color:whitesmoke;
            font-size:50px;                
            font-family: "Montserrat";
            text-transform: uppercase;
            padding-top: 100px;
            padding-bottom: 40px;
        }

        body{
            background-attachment: fixed;
        }

        .container{
            color:white;
        }




        .button{
            font-family: "Montserrat";
            padding: 6px 20px;
            font-size: 18px;
            background-color: rgba(0, 153, 51, 1);
            color: white;
            border-radius: 5px;
            border: none;
            cursor: pointer;

        }

    </style>
    <body>
        <%
            //cache removal
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            //checking for valid session
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("Returning Officer"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="RO.jsp">Home</a></li>
                <li><a href="EditPollingOfficer.jsp">Add/Remove</a></li>
                <li><a href="#exampleModalCenter" data-toggle="modal" >Clear All</a></li>

                <!--modal-->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 style="font-weight: bold" class="modal-title" id="exampleModalLongTitle">Are You Sure?</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Once you clear all polling officers, changes can not be reversed.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <a href="EditUserServlet?clearAll=clearPollingOfficers"><button  class=" button">Yes</button></a>                            </div>
                        </div>
                    </div>
                </div>


                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </div>



        <h1 style="text-align: center"> Polling Officers</h1>
        <div class="container" style="text-align: center">

            <!--table-->
            <table class="table table-sm" style=" width: 800px; margin: auto">

                <thead>
                    <tr>

                        <!--entities of table-->
                        <th style="font-size:20px" scope="col" style="color:white;">Sr. no.</th>
                        <th style="font-size:20px" scope="col" style="color:white;">CNIC</th>
                        <th style="font-size:20px" scope="col" style="color:white;">Name</th>

                    </tr>
                </thead>
                <tbody>


                    <%
                        //loop for retirving data for table
                        for (int i = 0; i < pollingOfficers.size(); i++) {
                            User pollingOfficer = new User();
                            pollingOfficer = pollingOfficers.get(i);

                    %>


                    <tr>

                        <!--filling the rows of table-->
                        <td style="font-size: 18px;"><%=i + 1%></td>
                        <td style="font-size: 18px;"><%=pollingOfficer.getUserCNIC()%></td>
                        <td style="font-size: 18px;"><%=pollingOfficer.getUserID()%></td>
                    </tr>
                    <%
                        };
                    %>


                </tbody>
            </table>
        </div>


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>