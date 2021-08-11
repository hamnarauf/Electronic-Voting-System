<%-- 
    Document   : ReturningOfficers
    Created on : May 26, 2021, 11:48:36 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.User" %>
<%@page import = "com.mycompany.evs.DbQuery" %>

<!DOCTYPE html>
<html>
    <%

        //list for retrieving data from data bases
        ArrayList<User> returningOfficers = new ArrayList<User>();
        returningOfficers = DbQuery.getReturningOfficersList();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Returning Officers</title>
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
            padding-top: 90px;
            padding-bottom: 25px;
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

            //check for valid session
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("ECP"))) {
                response.sendRedirect("home.jsp");
            }
        %>



        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="ECP.jsp" >Home</a></li>
                <li><a href="EditReturningOfficer.jsp">Add/Remove</a></li>
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
                                <p>Once you clear all returning officers, changes can not be reversed.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <a href="EditUserServlet?clearAll=clearReturningOfficers"><button  class=" button">Yes</button></a>                            </div>
                        </div>
                    </div>
                </div>

                <li><a href="LogoutServlet">Logout</a></li>

            </ul>
        </div>



        <h1 style=" text-align: center">Returning Officers</h1>
        <div class="container" style="text-align: center">

            <!--table-->
            <table class="table table-sm" style=" width: 800px; margin: auto">

                <thead>
                    <tr>

                        <!--entities of table-->
                        <th style="font-size:20px"  style="color:white;" scope="col">Sr. NO.</th>
                        <th style="font-size:20px"  style="color:white;" scope="col">CNIC</th>
                        <th style="font-size:20px"  style="color:white;"scope="col">Name</th>


                    </tr>
                </thead>
                <tbody>

                    <%
                        //loop for retreving data
                        for (int i = 0; i < returningOfficers.size(); i++) {
                            User returningOfficer = new User();
                            returningOfficer = returningOfficers.get(i);

                    %>


                    <tr>
                        
                        <!--filling in the rows of table-->
                        <td style="font-size: 18px;"><%=i + 1%></td>
                        <td style="font-size: 18px;"><%=returningOfficer.getUserCNIC()%></td>
                        <td style="font-size: 18px;"><%=returningOfficer.getUserID()%></td>

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