<%-- 
    Document   : EditReturningOfficer
    Created on : May 26, 2021, 12:17:09 PM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Returning Officer</title>

        <!--css stylesheets-->

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->
        <link rel="stylesheet" href="slider.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <style>
            .container {
                min-height: 550px;
                min-width: 820px;
                max-width: 820px;
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
                opacity: 0.9

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

            //checking for valid session
            if ((session.getAttribute("username") == null) || (session.getAttribute("password") == null) || !(session.getAttribute("type").equals("ECP"))) {
                response.sendRedirect("home.jsp");
            }
        %>

        <section>
            <div class="container">

                <!--returning officer removal form-->
                <div class="form form1">
                    <div class="wrapper">

                        <form id="remove" novalidate action = "EditUserServlet" method = "POST">


                            <h1>Remove<br> Returning Officer</h1>
                            <br>

                            <input name = "cnic" class="form-control" type="text"  
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  name="cnic" pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>


                            <input name = "username" type="text" class="form-control"  placeholder="Enter Username" required>
                            <div class="invalid-feedback">Please provide a username.</div>


                            <textarea name= "reason" class="form-control"  rows="4"  placeholder = "Reason" required ></textarea>
                            <div class="invalid-feedback">Please provide a reason.</div>

                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="type" value="Returning officer">
                            <input type="hidden" name="returnDestination" value="ReturningOfficers.jsp">

                            <button  type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>

                <!--returning officer  registration form-->
                <div class="form form2 active">
                    <div class="wrapper">

                        <form id="register" novalidate action = "EditUserServlet" method = "POST">

                            <h1>Register<br> Returning Officer</h1>
                            <br>

                            <input name = "cnic" class="form-control" type="text"  
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  
                                   pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>


                            <input name = "name" type="text" class="form-control"  placeholder="Enter Officer's Name"  required>
                            <div class="invalid-feedback">Please provide a name.</div>


                            <input name = "username" type="text" class="form-control"  placeholder="Enter Username"  required>
                            <div class="invalid-feedback">Please provide a username.</div>

                            <input name = "password" type="password" class="form-control"  placeholder="Password" required>
                            <div class="invalid-feedback">Please provide a password.</div>

                            <input type="hidden" name="action" value="register">
                            <input type="hidden" name="type" value="Returning officer">
                            <input type="hidden" name="returnDestination" value="ReturningOfficers.jsp">

                            <button type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>

                <!--overlays-->
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-left">
                            <h1>Returning Officer<br> Removal</h1>

                            <button id="removeButton">Remove</button>
                        </div>
                        <div class="overlay-right">
                            <h1>Returning Officer<br> Registration</h1>

                            <button id="registerButton">Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div>
            <a href="ReturningOfficers.jsp" target="_parent"> <button class=" button">Back</button></a>
        </div>


        <!--javascript-->
        <script type= "text/javascript" src="form.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>