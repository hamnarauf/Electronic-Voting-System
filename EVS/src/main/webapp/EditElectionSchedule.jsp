<%-- 
    Document   : EditElectionSchedule
    Created on : Jun 3, 2021, 12:54:46 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Election Schedule</title>

        <!--css stylesheets-->

        <!--boostrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <style>
            .container {

                min-height: 600px;
                min-width: 800px;
                max-width: 800px;

            }
            .button{
                font-family: "Montserrat";
                position: absolute;
                bottom: 25px;
                left: 10%;
                margin-left: -108px;
                width: 8%;
                padding: 8px 20px;
                font-size: 18px;
                background-color: rgba(0, 153, 51, 1);
                color: white;
                border-radius: 5px;
                border: none;
                cursor: pointer;

            }
        </style>
    </head>
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

        <section>
            <div class="container">

                <!--form for editing election schedule-->
                <div class="form form2 active">
                    <div class="wrapper">
                        <form id="register" novalidate action = "ScheduleServlet" method = "POST">

                            <h1>Edit Schedule</h1>
                            <br>
                            <label for="election day">Election date:</label>
                            <input class ="form-control" type="date"  name="electionDay" required>
                            <div class="invalid-feedback">Please provide a date.</div>

                            <label for="appt">Polling Starts at:</label>
                            <input class ="form-control" type="time"  required name="startTime">
                            <div class="invalid-feedback">Please provide a time.</div>

                            <label for="appt">Polling Ends at:</label>
                            <input class ="form-control" type="time"  required name="endTime">
                            <div class="invalid-feedback">Please provide a time.</div>

                            <label for="appt">Result at:</label>
                            <input class ="form-control" type="time" required name="resultTime">
                            <div class="invalid-feedback">Please provide a time.</div>

                            <input type="hidden" name="edit" value="edit">

                            <button id = "register" type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Edit Changes</button>
                        </form>
                    </div>
                </div>

                <!--overlay-->
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-left">
                            <h1>Election<br> Commission Of Pakistan</h1>

                        </div>
                        <div class="overlay-right">
                            <h1></h1>

                            <button id="registerButton">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div>
            <a href="ScheduleServlet?schedule=confidential" target="_parent"> <button class=" button">Back</button></a>
        </div>


        <!--javascript-->

        <script>

            // JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';

                window.addEventListener('load', function () {
                    var form = document.getElementById('register');
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                }, false);
            })();
        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>