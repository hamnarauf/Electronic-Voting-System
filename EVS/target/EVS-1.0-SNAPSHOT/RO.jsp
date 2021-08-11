<%-- 
    Document   : RO
    Created on : May 22, 2021, 3:16:25 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <a href="RO.jsp"></a>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Returning Officer</title>


    <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="bg.css" >
    <style>

        h1{
            color:white;
            font-size:60px;                
            padding-bottom: 10px;
            padding-top: 90px;
        }
        h2{
            color:whitesmoke;
            font-size:25px;                
            padding-bottom: 0px;
            padding-top: 0px;
            font-weight: normal;
            text-transform: uppercase;
        }

        .container b{
            position: relative;                              
            width: 800px;
            padding: 10px 10px;
            text-align: center;
            margin: 2px 5px;
            border-radius: 15px;
            font-weight: bold;
            border: 2px solid white;             
            border: 2px solid white;
            font-size: 20px;
            background: transparent;
            color: white;
            cursor:pointer;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            text-transform: uppercase;       
            padding-top: 2px;
            font-size: 25px;
        }
        span{

            left: 0;
            top: 0;
            background: rgb(0, 153, 51);
            height: 100%;
            width: 0;
            border-radius: 15px;
            position: absolute;
            z-index: -1;
            transition: 0.5s;
            opacity: 0.8;
        }
        b:hover span{
            width: 100%;
        }
        b:hover{
            border: none; 

            .container{
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("Returning Officer"))) {
                response.sendRedirect("home.jsp");
            }
        %>


        <h1 style="text-align: center">RETURNING OFFICER</h1>            
            <h2 style="text-align: center">WELCOME, Ahmed Ali ${User.getUserName()}</h2>

            <div class="container" align =center> 
                <br><br><br>  
                <a href="Candidates.jsp"  type="button" ><b><span></span>Candidates</b></a>
                <br><br>
                <a href="PollingOfficers.jsp" type="button" ><b><span></span>Polling Officers</b></a>
                <br><br>
                <a href="LogoutServlet" type="button" ><b><span></span>Logout</b></a>
            </div>

            <!--javascript-->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        </body>
    </html>