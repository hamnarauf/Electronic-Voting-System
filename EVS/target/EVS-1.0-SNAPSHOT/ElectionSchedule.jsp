<%-- 
    Document   : ElectionSchedule
    Created on : May 18, 2021, 4:35:26 PM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Election Schedule</title>

        <!--css-->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

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
            font-size:60px;                
            font-family: "Montserrat";
            text-transform: uppercase;
            padding-top: 70px;
            padding-bottom: 25px;

        }
        * {margin: 0; padding: 0;}

        .tree ul {
            padding-top: 10px; position: center;
            font-size: 30px;
            color: whitesmoke;
            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        .tree li {
            float: center; text-align: center;
            list-style-type: none;
            font-size: 30px;
            position: relative;
            padding: 20px 0px 0 5px;
            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        /*We will use ::before and ::after to draw the connectors*/

        .tree li::before, .tree li::after{
            content: '';
            position: absolute; top: 0; right: 50%;
            border-top: 1px solid #ccc;
            width: 50%; height: 20px;
        }
        .tree li::after{
            right: auto; left: 50%;
            border-left: 1px solid #ccc;
        }

        .button{
            font-family: "Montserrat";           
            bottom: 0px;
            margin-top: 20px;
            width: 300px;
            padding: 13px 20px;
            font-size: 18px;
            background-color: rgba(0, 153, 51, 1);
            color: white;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            opacity: 0.9;
            position: relative;

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
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("ECP"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="ECP.jsp">Home</a></li>
                <li><a href="EditElectionSchedule.jsp">Edit</a></li>
                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </div>

        <!--schedule-->
        <div class="tree">

            <ul>

                <h1 style="text-align: center" >Schedule</h1>
                <ul>
                    <p style="text-align: center">Election Day: ${date} </p>
                </ul>
                <ul>
                    <li>
                        <a>Polling Starts At: ${start}</a>
                    </li>

                    <li>
                    <u1>
                        <a> Polling Ends At: ${end}</a>
                    </u1>
                    <ul> 

                        <li><a>Result ${result}</a></li>
                    </ul>
                    </li>
                </ul>
            </ul>
            <div class="container" style="text-align: center">
                <a href="Results.jsp"> <button class=" button" >END POLLING</button></a>
            </div>
        </div>


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>

</html>
