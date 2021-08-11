<%-- 
    Document   : Parties
    Created on : May 26, 2021, 11:49:22 AM
    Author     : Binary Beats
--%>

<%-- 
    Document   : Parties
    Created on : May 26, 2021, 11:49:22 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.mycompany.evs.Party" %>
<%@page import = "com.mycompany.evs.DbQuery" %>


<!DOCTYPE html>
<html>
    <%
//retrieving data from data base
        ArrayList<Party> parties = new ArrayList<Party>();
        parties = DbQuery.getPartiesList();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parties</title>
        <!--css-->
        <!--bootstrap-->
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
            padding-bottom: 20px;

        }
        body{
            background-attachment: fixed;

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
                response.sendRedirect("home.jsp");}

        %>

        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="ECP.jsp" >Home</a></li>
                <li>  <a href="EditParty.jsp" >Add/Remove</a> </li>
                <li><a href=LogoutServlet>Logout</a></li>


            </ul>
        </div>


        <h1 style="text-align: center">Parties</h1>
        <div class="container" style="text-align: center; background-color: white; opacity: 0.88" >

            <!--table-->
            <table class="table table-sm">

                <thead>
                    <tr style="font-size:20px">

                        <!--entities of table-->
                        <th scope="col">Name</th>
                        <th scope="col">Leader</th>
                        <th scope="col">Symbol name</th>
                        <th scope="col">Symbol</th>
                    </tr>
                </thead>
                <tbody>
                    <%      

                            //loop for retrieving data for parties
                            for (int i = 0; i < parties.size(); i++) {
                            Party party = new Party();
                            party = parties.get(i);

                    %>

                    <tr>

                        <!--filling the rows of table-->
                        <td style="font-size:20px"><%=party.getPartyName()%></td>
                        <td style="font-size:20px"><%=party.getPartyLeader()%></td>
                        <td style="font-size:20px"><%=party.getSymbolName()%></td>
                        <td style="font-size:20px"><img src="data:image/jpg;base64,<%=party.getPartySymbol()%>"></td>

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
