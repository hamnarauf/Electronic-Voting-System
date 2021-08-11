<%-- 
    Document   : home
    Created on : May 26, 2021, 11:35:58 AM
    Author     : Binary Beats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OBV-EVS</title>

        <!--css -->
        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        

        <!--background-->
        <link rel="stylesheet" href="bg.css" >

        <!--slider form-->        
        <link rel="stylesheet" href="slider.css" >

        <!--navbar-->
        <link rel="stylesheet" href="navbar.css" >

        <!--logo-->
        <link rel="icon" href="images/logo.png" />

        <style>
            .container {
                min-height: 550px;
                min-width: 750px;
                max-width: 750px;
            }

            section {
                min-height: 87vh;
            }

        </style>

    </head>
    <body>

        <!--navbar-->
        <div class="navbar">
            <ul>            
                <li><a href="ScheduleServlet?schedule=normal">Schedule</a></li>   
                <li><a href="ResultsServlet">Results</a></li>
                <li><a href="AboutUs.jsp">About Us</a></li>   

            </ul>
        </div>

        <section>
            <div class="container">
                <!--form for voter verification-->
                <div class="form form1">
                    <div class="wrapper">

                        <form id="remove" novalidate action = "VoterVerificationServlet" method = "POST">

                            <h1>Voter<br> Verification</h1>
                            <br>
                            <input name = "cnic" class="form-control" type="text"  
                                   placeholder="Enter CNIC: XXXXXXXXXXXXX"  name="cnic" pattern = "[0-9]{13}"  required>
                            <div class="invalid-feedback">
                                Please provide a valid CNIC number
                            </div>
                            <%
                                //error message
                                String verification_msg = (String) session.getAttribute("error1");
                                if (verification_msg != null) {
                                    out.println("<font color=red size=2px>" + verification_msg + "</font>");
                                    session.removeAttribute("error1");
                                }
                            %>

                            <br>
                            <button type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>

                <!--form for login-->
                <div class="form form2 active">
                    <div class="wrapper">
                        <form id="register" novalidate action = "LoginServlet" method = "POST">

                            <h1>Login</h1>
                            <br>
                            <input name = "username" type="text" class="form-control"  placeholder="Enter Username" required>
                            <div class="invalid-feedback">Please provide a username.</div>

                            <input name = "password" type="password" class="form-control"  placeholder="Password" required>
                            <div class="invalid-feedback">Please provide a password.</div>

                            <label class="custom-control-label" style = "margin:7px;" >User Type</label> 
                            <div class="row offset-md-1" >
                                <div class="custom-control custom-radio ">
                                    <input type="radio" class="custom-control-input" id="action1" name="userType" value="ECP" required>
                                    <label class="custom-control-label" for="action1" >ECP</label>
                                </div>
                            </div>


                            <div class="row offset-md-1" >
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" id="action2" value="Returning Officer" name="userType" required>
                                    <label class="custom-control-label" for="action2">Returning Officer</label>

                                </div>                           
                            </div> 


                            <div class="row offset-md-1" style="text-align: left">
                                <div class="custom-control custom-radio " style = "margin-bottom:9px;" >
                                    <input type="radio" class="custom-control-input" id="action3" name="userType" value="Polling Officer" required>
                                    <label class="custom-control-label"  for="action3">Polling Officer</label>
                                    <div class="invalid-feedback">Please select an action.</div>
                                </div>                           
                            </div>  
                            <%
//                                error message
                                String login_msg = (String) session.getAttribute("error2");
                                if (login_msg != null) {
                                    out.println("<font color=red size=2px>" + login_msg + "</font>");
                                    session.removeAttribute("error2");
                                    session.invalidate();

                                }


                            %>
                            <br>
                            <br>

                            <button  type="submit" style = "opacity: 0.9;" class="btn btn-primary ">Submit</button>
                        </form>
                    </div>
                </div>

                <!--overlays-->
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-left">
                            <h1>Voter Verification<br> by CNIC</h1>
                            <button id="removeButton">Voter Verification</button>
                        </div>
                        <div class="overlay-right">
                            <h1>User Login</h1>

                            <button id="registerButton">Login</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--javascript-->
        <script type= "text/javascript" src="form.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
<a href="home.jsp"></a>