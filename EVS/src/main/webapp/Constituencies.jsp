<%-- 
    Document   : Constituencies
    Created on : May 26, 2021, 11:50:47 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.DbQuery" %>
<%@page import = "com.mycompany.evs.Constituency" %>

<!DOCTYPE html>
<html>
    <%

//        getting list of all constituencies for displaying data
        ArrayList<Constituency> constituencies = new ArrayList<Constituency>();
        constituencies = DbQuery.getConstituenciesList();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--css-->
        <!--boostrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >
    </head>


    <style type= "text/css">

        /*css for this file*/

        h1{
            color:whitesmoke;
            font-size:50px;                
            font-family: "Montserrat";
            text-transform: uppercase;
            padding-top: 100px;
            padding-bottom: 0px;

        }
        body{
            background-attachment: fixed;

        }

        .container{

            color:white;
        }
    </style>
    <body>
        <%
            //cache removal
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            //session
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("ECP"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <!--nabar-->
        <div class="navbar">
            <ul>            
                <li><a href="ECP.jsp" >Home</a></li>
                <li><a href="EditConstituency.jsp" >Add/Remove</a></li>
                <li><a href="LogoutServlet" >Logout</a></li>
            </ul>
        </div>

        <h1 style="text-align:center">Constituencies</h1>
        <div class = "container" style="text-align: center">
            <div class="row">
                <!--column 1-->
                <div class="container col-md-5"  >

                    <!--table 1-->
                    <table class="table table-sm">
                        <br>
                        <h4 style="text-align:center; font-size:30px">NATIONAL ASSEMBLY</h4>
                        <br>

                        <thead>
                            <tr>
                                <!--entities of table-->
                                <th scope="col" style="font-size:20px; width: 85px">ID</th>
                                <th scope="col" style="font-size:20px">DISTRICT</th>
                                <th scope="col" style="font-size:20px">PROVINCE</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //loop for retrieving data for constituencies
                                for (int i = 0; i < constituencies.size(); i++) {
                                    Constituency Nconstituency = new Constituency();
                                    Nconstituency = constituencies.get(i);
                                    if (Nconstituency.getConstituencyType().equals("N")) {

                            %>

                            <tr>
                                <!--filling in the table-->
                                <td><%= Nconstituency.getConstituencyID()%></td>
                                <td><%= Nconstituency.getConstituencyDistrict()%></td>
                                <td><%= Nconstituency.getConstituencyProvince()%></td>
                            </tr>
                            <%
                                    }
                                }

                            %>

                        </tbody>
                    </table>

                </div>

                <!--column 2-->
                <div class="container col-md-5">
                    <!--table 2-->
                    <table class="table table-sm ">
                        <br>
                        <h4 style="text-align:center; font-size:30px">PROVINCIAL ASSEMBLY</h4>
                        <br>
                        <thead>
                            <tr>
                                <!--entities of table-->
                                <th scope="col" style="font-size:20px; width: 85px">ID</th>
                                <th scope="col" style="font-size:20px">District</th>
                                <th scope="col" style="font-size:20px">Province</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%//loop for retireiving data
                                for (int j = 0; j < constituencies.size(); j++) {
                                    Constituency Pconstituency = new Constituency();
                                    Pconstituency = constituencies.get(j);
                                    if (Pconstituency.getConstituencyType().equals("P")) {
                            %>

                            <tr>
                                <!--filling in the rows of table-->
                                <td><%= Pconstituency.getConstituencyID()%></td>
                                <td><%= Pconstituency.getConstituencyDistrict()%></td>
                                <td><%= Pconstituency.getConstituencyProvince()%></td>
                            </tr>
                            <%
                                    }
                                };
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
